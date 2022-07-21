import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/models/remote/user_model.dart';
import 'package:to_do_app/repos/auth_repo.dart';
import 'package:to_do_app/utils/app_constant.dart';

UserSubResponse userSubResponseLocal;

abstract class HiveStorage {
  void dispose();
  /// Profile
  Future<void> insertCurrentUser(UserSubResponse user);
  Future<UserSubResponse> getCurrentUser();
}

class HiveStorageIpml implements HiveStorage {
  final Box box;
  final AuthRepo authRepo;
  HiveStorageIpml({
    @required this.box,
    @required this.authRepo,
  });

  // Closes all Hive boxes
  @override
  void dispose() {
    Hive.close();
  }

  ////////////////////////////////////////////////////////////////
  /// Profile With Username
  ////////////////////////////////////////////////////////////////
  @override
  Future<void> insertCurrentUser(UserSubResponse user) async {
    box.put(EventKey.currentUserDB, jsonEncode(user.toJson()));
  }

  @override
  Future<UserSubResponse> getCurrentUser() async {
    final String response = box.get(EventKey.currentUserDB) ?? '';
    if (response.length > 0) {
      final jsonMap = json.decode(response);
      return UserSubResponse.fromJson(jsonMap);
    }
    return null;
  }

  
}
