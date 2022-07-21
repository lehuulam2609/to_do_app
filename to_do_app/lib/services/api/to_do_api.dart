
import 'package:to_do_app/core/models/base_response_model.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/models/remote/contact_model.dart';
import 'package:to_do_app/utils/app_api_url.dart';
import 'api.dart'; 

abstract class ToDoApi {
  Future<BaseResponse<List<ContactModel>>> getListContacts();
  Future<BaseResponse<List<ContactModel>>> getListOrders();
}

class ToDoApiIpml implements ToDoApi {
  DioApi dioApi;

  ToDoApiIpml({@required this.dioApi});

  Future<BaseResponse<List<ContactModel>>> getListContacts() async {
    return dioApi.doGet(dioApi.baseApiUrl + AppApiUrl.callUrl);
  }

  Future<BaseResponse<List<ContactModel>>> getListOrders() async {
    return dioApi.doGet(dioApi.baseApiUrl + AppApiUrl.buyUrl);
  }
}