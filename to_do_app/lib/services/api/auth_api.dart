import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/base_response_model.dart';
import 'package:to_do_app/models/remote/token_model.dart';
import 'package:to_do_app/utils/app_api_url.dart';
import 'api.dart';

abstract class AuthApi {
  Future<BaseResponse<TokenModel>> postLogin(Map<String, String> header);
  Future<BaseResponse<TokenModel>> deleteLogout(String token);
}

class AuthApiIpml implements AuthApi {
  DioApi dioApi;

  AuthApiIpml({@required this.dioApi});

  Future<BaseResponse<TokenModel>> postLogin(Map<String, String> header) async {
    return dioApi.doPost(dioApi.baseApiUrl + AppApiUrl.loginUrl, {},
        headerAuth: header);
  }

  Future<BaseResponse<TokenModel>> deleteLogout(String token) {
    return dioApi.doDelete(dioApi.baseApiUrl + AppApiUrl.loginUrl + '/' + token);
  }
}
