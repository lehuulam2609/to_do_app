
import 'dart:convert';
import 'package:to_do_app/models/remote/request/query_profile_request.dart';
import 'package:to_do_app/core/models/base_response_model.dart';
import 'package:to_do_app/models/remote/user_model.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_api_url.dart';
import 'api.dart'; 

abstract class UserApi {
  Future<BaseResponse<UserMainResponse>> postGetProfile();
}

class UserApiIpml implements UserApi {
  DioApi dioApi;

  UserApiIpml({@required this.dioApi});

  Future<BaseResponse<UserMainResponse>> postGetProfile() async {
    final request = QueryProfileRequest(username: '');
    return dioApi.doPost(dioApi.baseApiUrl + AppApiUrl.profileUrl,
        json.encode(request.toJson()));
  }

}
