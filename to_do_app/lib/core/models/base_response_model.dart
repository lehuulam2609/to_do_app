import 'dart:core';
import 'package:to_do_app/models/remote/message_model.dart';
import 'package:to_do_app/models/remote/user_model.dart';
import 'package:to_do_app/services/api/model_response_factory.dart';
import 'package:to_do_app/utils/app_constant.dart';

import 'base_error.dart';

class BaseResponse<T> {
  bool error;
  T response;
  List<MessageModel> messages;
  List<BaseError> errors;
  Meta meta;

  /// BASE API
  int success;
  String errorCode;
  String msg;
  String token;
  String refreshToken;
  bool isProfileSetup;
  UserModel profile;


  BaseResponse.fromJson(Map<String, dynamic> json) {
    error = json["error"] ?? false;
    response = json['response'] != null
        ? ApiResponseFactory.parseJson<T>(json['response'])
        : null;
    messages = json['messages'] != null ? [] : (json['messages'] as List).map((e) => MessageModel.fromJson(e)).toList();
    // errors = parseErrorList(json);
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;

    ///BASE API
    success = json["success"] ?? 0;
    errorCode = json["errorCode"] ?? '';
    msg = json["msg"] ?? (json['message'] ?? '');
    token = json["token"] ?? '';
    refreshToken = json['refreshToken'] ?? '';
    isProfileSetup = json["isProfileSetup"];
    profile =
        json['profile'] != null ? UserModel.fromJson(json['profile']) : null;

  }

  BaseResponse.initData(dynamic data) {
    response = data;
  }

  List<BaseError> parseErrorList(Map<String, dynamic> json) {
    List errors = json["errors"];
    return errors != null
        // ? List<BaseError>.from(errors.map((x) => BaseError.fromJson(x)))
        ? [BaseError.fromJson(json["errors"])]
        : <BaseError>[];
  }

  // ERROR HANDLER
  bool get hasError {
    return errors != null ? errors.length > 0 : (response == null);
  }

  String get errorMessage {
    var errorMessage = AppConstant.errorMessage.anErrorOccured;
    if (errors != null) {
      if (errors.length > 0) {
        errorMessage = errors.first.message;
      }
    }
    return errorMessage;
  }

  BaseResponse.initError(int code, String message) {
    errors = [
      BaseError(
        code: code,
        message: msg ?? message,
      )
    ];
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta copyWith({
    int currentPage,
    int from,
    int lastPage,
    String path,
    int perPage,
    int to,
    int total,
  }) =>
      Meta(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json["current_page"],
      from: json["from"],
      lastPage: json["last_page"],
      path: json["path"],
      perPage: json["per_page"],
      to: json["to"],
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
