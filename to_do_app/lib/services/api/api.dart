import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:to_do_app/core/models/base_response_model.dart';
import 'package:to_do_app/repos/auth_repo.dart';
import 'package:to_do_app/services/api/model_response_factory.dart';
import 'package:to_do_app/utils/app_config.dart';
import 'package:dio/dio.dart';
import 'package:to_do_app/utils/app_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as GetX;
import 'package:to_do_app/utils/app_routes.dart';

abstract class Api {
  String baseApiUrl = GetX.Get.find<AppEnvironment>().apiBaseUrl;
  AuthRepo authRepo;
  Api(this.authRepo);
  String _checkHost = 'google.com';

  Map<String, String> header = {};

  Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {
      "Content-Type": "application/json",
    };
    var token = await authRepo.getAuthToken();
    if ((token ?? '').length > 0) {
      header.addAll({"Authorization": "Bearer " + token});
    }
    this.header = header;
    return header;
  }

  Future<BaseResponse<T>> doGet<T>(String url);

  Future<BaseResponse<T>> doDelete<T>(String url);

  Future<BaseResponse<T>> doPost<T>(String url, dynamic body);

  Future<BaseResponse<T>> doPatch<T>(String url, dynamic body);

  BaseResponse<T> handleResponse<T>(response);
  BaseResponse<T> handleInternalError<T>(error);

  void handleUnAuthorized() async {
    // default implementation, can be overrided
    var currentRoute = GetX.Get.currentRoute ?? '';
    AuthRepoImpl(authLocalStorage: GetX.Get.find()).saveAuthToken('');
    if (currentRoute == '') {
    } else {
      // GetX.Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<bool> checkBadInternet() async {
    try {
      final result = await InternetAddress.lookup(_checkHost);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return false;
      }
    } on SocketException catch (_) {
      return true;
    }
    return true;
  }
}

class DioApi extends Api {
  Dio dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    ),
  );

  DioApi({@required AuthRepo authRepo}) : super(authRepo) {
    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(responseBody: true));
    }
  }

  BaseResponse<T> handleDioResponse<T>(Response response) {
    try {
      if (response.statusCode >= 200 && response.statusCode <= 499) {
        if (response.statusCode == 401) {
          handleUnAuthorized();
          var error = BaseResponse<T>.initError(
              response.statusCode, AppConstant.errorMessage.invalidAccess);
          return error;
        }
        var result = ApiResponseFactory.parseJson<T>(response.data);
        return BaseResponse.initData(result);
      } else {
        var error = BaseResponse<T>.initError(
            response.statusCode, AppConstant.errorMessage.anErrorOccured);
        return error;
      }
    } catch (error) {
      return handleInternalError<T>(error);
    }
  }

  @override
  BaseResponse<T> handleInternalError<T>(error) {
    if (error is DioError) {
      return handleDioError<T>(error);
    }
    if (error is TimeoutException) {
      return BaseResponse<T>.initError(-9999, 'Your request time out');
    }
    if (error is SocketException) if (error.osError != null) {
      if (error.osError?.errorCode == 8) {
        return BaseResponse<T>.initError(error.osError?.errorCode ?? -999,
            'The internet connection appears to be offline, please try again');
      } else {
        return BaseResponse<T>.initError(
            error.osError?.errorCode ?? -999, error.osError.message);
      }
    } else {
      return BaseResponse<T>.initError(
          error.osError?.errorCode ?? -999, 'Network error, please try again');
    }
    if (error is NoSuchMethodError) {
      return BaseResponse<T>.initError(-1, 'Error when getting data');
    }
    if (error is TypeError) {
      return BaseResponse<T>.initError(-2, 'Error when converting data');
    }

    return BaseResponse.initError(-999, error?.message ?? 'An error occured');
  }

  @override
  BaseResponse<T> handleResponse<T>(response) {
    if (response is Response) {
      return handleDioResponse<T>(response);
    } else {
      return handleInternalError(response);
    }
  }

  BaseResponse<T> handleDioError<T>(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return BaseResponse<T>.initError(-9999, 'Your request time out');
      case DioErrorType.sendTimeout:
        return BaseResponse<T>.initError(-9999, 'Your request time out');
        break;
      case DioErrorType.receiveTimeout:
        return BaseResponse<T>.initError(-9999, 'Your request time out');
        break;
      case DioErrorType.response:
        // if (dioError?.response?.statusCode == 401) {
        //   handleUnAuthorized();
        // }
        var error =
            ((dioError.response.data['messages'] ?? []) as List).length > 0
                ? ((dioError.response.data['messages'] ?? []) as List).first
                : null;
        var errorCode = (error != null
                ? int.parse(error['code'] ?? '100')
                : dioError?.response?.statusCode) ??
            -9999;
        var errorMessage = error['message'] ?? '';

        return BaseResponse<T>.initError(errorCode, errorMessage);
        break;
      case DioErrorType.cancel:
        return BaseResponse<T>.initError(-9999, 'Cancelled, please try again');
        break;
      default:
        return BaseResponse<T>.initError(
            dioError?.response?.statusCode ?? -9999,
            dioError.message ?? 'An error occured, please try again');
    }
  }

  @override
  Future<BaseResponse<T>> doGet<T>(String url,
      {bool needThrowError = false,
      Map<String, String> headerInput,
      Map<String, dynamic> queryParameters}) async {
    try {
      if (await checkBadInternet()) {
        return BaseResponse<T>.initError(
            -999, AppConstant.errorMessage.badInternetConnection);
      }
      var header = headerInput ?? (await getHeader());
      if (queryParameters != null) {
        var response = await dio.get(url,
            options: Options(headers: header),
            queryParameters: queryParameters);
        return handleResponse<T>(response);
      } else {
        var response = await dio.get(
          url,
          options: Options(headers: header),
        );
        return handleResponse<T>(response);
      }
    } catch (e) {
      if (needThrowError) {
        rethrow;
      } else {
        return handleInternalError<T>(e);
      }
    }
  }

  @override
  Future<BaseResponse<T>> doDelete<T>(String url,
      {bool needThrowError = false}) async {
    try {
      if (await checkBadInternet()) {
        return BaseResponse<T>.initError(
            -999, AppConstant.errorMessage.badInternetConnection);
      }
      var header = await getHeader();
      var response = await dio.delete(url, options: Options(headers: header));
      return handleResponse<T>(response);
    } catch (e) {
      if (needThrowError) {
        rethrow;
      } else {
        return handleInternalError<T>(e);
      }
    }
  }

  @override
  Future<BaseResponse<T>> doPost<T>(String url, dynamic body,
      {bool needThrowError = false, Map<String, String> headerAuth}) async {
    if (body != null) {
      print('============REQUEST===============');
      if (body != null) {
        print(json.encode(body));
      }
      print('============------===============');
    }

    try {
      if (await checkBadInternet()) {
        return BaseResponse<T>.initError(
            -999, AppConstant.errorMessage.badInternetConnection);
      }
      var header = (headerAuth ?? (await getHeader()));
      if (headerAuth != null) {
        var response = await dio.post(
          url,
          options: Options(
            headers: header,
          ),
        );
        return handleResponse<T>(response);
      } else {
        var response = await dio.post(
          url,
          options: Options(headers: header),
          data: body,
        );
        return handleResponse<T>(response);
      }
    } catch (e) {
      if (needThrowError) {
        rethrow;
      } else {
        return handleInternalError<T>(e);
      }
    }
  }

  @override
  Future<BaseResponse<T>> doPatch<T>(String url, dynamic body,
      {bool needThrowError = false}) async {
    if (body != null) {
      print('============REQUEST===============');
      if (body != null) {
        print(json.encode(body));
      }
      print('============------===============');
    }
    try {
      if (await checkBadInternet()) {
        return BaseResponse<T>.initError(
            -999, AppConstant.errorMessage.badInternetConnection);
      }
      var header = await getHeader();
      var response =
          await dio.patch(url, options: Options(headers: header), data: body);
      return handleResponse<T>(response);
    } catch (e) {
      if (needThrowError) {
        rethrow;
      } else {
        return handleInternalError<T>(e);
      }
    }
  }
}
