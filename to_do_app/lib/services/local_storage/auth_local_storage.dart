import 'package:to_do_app/core/services/base_local_storage.dart';
import 'package:to_do_app/utils/app_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalStorage implements BaseLocalStorage {
  Future<String> getApiKey();

  Future<String> getAuthToken();

  Future<bool> saveApiKey(String apiKey);

  Future<bool> saveAuthToken(String authToken);

  Future<bool> savePinCode(String email, String pincode);

  Future<String> getPinCode(String email);

  Future<bool> handleUnAuthorized();

  Future<bool> saveEmployeeId(String employee);

  Future<String> getEmployeeId();

  Future<bool> saveDateLogin(String dateLogin);

  Future<String> getDateLogin();

  Future<bool> saveTour(bool isTour);

  Future<bool> getTour();

  Future<String> getRefreshAuthToken();

  Future<bool> saveRefreshAuthToken(String authToken);

  Future<String> getCurrentEmail();

  Future<bool> saveCurrentEmail(String email);

  /// FACE / TOUCH
  Future<bool> saveFaceID(String email, bool isFace);

  Future<bool> getFaceID(String email);

  Future<bool> saveTouchID(String email, bool isTouch);

  Future<bool> getTouchID(String email);

  Future<bool> saveSignUpNotVerify(String data);

  Future<String> getSignUpNotVerify();

  Future<bool> saveCallApiLanguage(bool isCall);

  Future<bool> getCallApiLanguage();

  /// REMEMBER ME
  Future<bool> saveRememberMe(bool isRemember);

  Future<bool> getRememberMe();

  Future<bool> saveUserNameRemember(String username);

  Future<String> getUserNameRemember();

  Future<bool> savePasswordRemember(String password);

  Future<String> getPasswordRemember();

  /// Username
  Future<bool> saveUserName(String username);

  Future<String> getUserName();

  /// Host & Database
  Future<bool> saveHost(String host);

  Future<String> getHost();

  Future<bool> saveDatabase(String database);

  Future<String> getDatabase();

  /// Access Mobile
  Future<bool> saveAccessMobile(int accessMobile);

  Future<int> getAccessMobile();

  /// Save Attachment
  Future<bool> saveAttachment(String recordId, String taskId);

  Future<String> getAttachment(String recordId);

  /// Password
  Future<bool> savePassword(String password);

  Future<String> getPassword();
}

// with shared pref
class AuthLocalStorageIpml implements AuthLocalStorage {
  SharedPreferences sharedPref;

  AuthLocalStorageIpml({@required this.sharedPref});

  @override
  Future<String> getApiKey() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.apiKey);
  }

  @override
  Future<String> getAuthToken() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.authToken);
  }

  @override
  Future<bool> saveApiKey(String apiKey) async {
    return sharedPref.setString(AppConstant.sharePrefKeys.apiKey, apiKey);
  }

  @override
  Future<bool> saveAuthToken(String authToken) async {
    return sharedPref.setString(AppConstant.sharePrefKeys.authToken, authToken);
  }

  @override
  Future<bool> savePinCode(String email, String pincode) async {
    return sharedPref.setString(email, pincode);
  }

  @override
  Future<String> getPinCode(String email) async {
    return sharedPref.getString(email);
  }

  @override
  Future<bool> handleUnAuthorized() async {
    await sharedPref.remove(AppConstant.sharePrefKeys.authToken);
    await sharedPref.remove(AppConstant.sharePrefKeys.apiKey);
    return true;
  }

  @override
  Future<String> getDateLogin() async {
    // TODO: implement getDateLogin
    return sharedPref.getString(AppConstant.sharePrefKeys.dateLogin);
  }

  @override
  Future<String> getEmployeeId() async {
    // TODO: implement getEmployeeId
    return sharedPref.getString(AppConstant.sharePrefKeys.employeeId);
  }

  @override
  Future<bool> saveDateLogin(String dateLogin) {
    // TODO: implement saveDateLogin
    return sharedPref.setString(AppConstant.sharePrefKeys.dateLogin, dateLogin);
  }

  @override
  Future<bool> saveEmployeeId(String employee) {
    // TODO: implement saveEmployeeId
    return sharedPref.setString(AppConstant.sharePrefKeys.employeeId, employee);
  }

  @override
  Future<bool> saveTour(bool isTour) {
    return sharedPref.setBool(AppConstant.sharePrefKeys.isTour, isTour);
  }

  @override
  Future<bool> getTour() async {
    return sharedPref.getBool(AppConstant.sharePrefKeys.isTour) ?? false;
  }

  @override
  Future<String> getCurrentEmail() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.currentEmail);
  }

  @override
  Future<String> getRefreshAuthToken() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.refreshAuthToken);
  }

  @override
  Future<bool> saveCurrentEmail(String email) async {
    return sharedPref.setString(AppConstant.sharePrefKeys.currentEmail, email);
  }

  @override
  Future<bool> saveRefreshAuthToken(String authToken) async {
    return sharedPref.setString(
        AppConstant.sharePrefKeys.refreshAuthToken, authToken);
  }

  @override
  Future<bool> getFaceID(String email) async {
    return sharedPref.getBool(email + '_' + AppConstant.sharePrefKeys.faceID) ??
        false;
  }

  @override
  Future<bool> getTouchID(String email) async {
    return sharedPref
            .getBool(email + '_' + AppConstant.sharePrefKeys.touchID) ??
        false;
  }

  @override
  Future<bool> saveFaceID(String email, bool isFace) async {
    return sharedPref.setBool(
        email + '_' + AppConstant.sharePrefKeys.faceID, isFace);
  }

  @override
  Future<bool> saveTouchID(String email, bool isTouch) async {
    return sharedPref.setBool(
        email + '_' + AppConstant.sharePrefKeys.touchID, isTouch);
  }

  @override
  Future<String> getSignUpNotVerify() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.signUpNotVerify) ??
        '';
  }

  @override
  Future<bool> saveSignUpNotVerify(String data) async {
    return sharedPref.setString(
            AppConstant.sharePrefKeys.signUpNotVerify, data) ??
        false;
  }

  @override
  Future<bool> saveCallApiLanguage(bool isCall) async {
    return sharedPref.setBool(
        AppConstant.sharePrefKeys.callApiLanguage, isCall);
  }

  @override
  Future<bool> getCallApiLanguage() async {
    return sharedPref.getBool(AppConstant.sharePrefKeys.callApiLanguage) ??
        false;
  }

  /// REMEMBER ME
  @override
  Future<bool> saveRememberMe(bool isRemember) async {
    return sharedPref.setBool(AppConstant.sharePrefKeys.rememberMe, isRemember);
  }

  @override
  Future<bool> getRememberMe() async {
    return sharedPref.getBool(AppConstant.sharePrefKeys.rememberMe) ?? false;
  }

  @override
  Future<bool> saveUserNameRemember(String username) async {
    return sharedPref.setString(
        AppConstant.sharePrefKeys.rememberMeUserName, username);
  }

  @override
  Future<String> getUserNameRemember() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.rememberMeUserName) ??
        '';
  }

  @override
  Future<bool> savePasswordRemember(String password) async {
    return sharedPref.setString(
        AppConstant.sharePrefKeys.rememberMePassword, password);
  }

  @override
  Future<String> getPasswordRemember() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.rememberMePassword) ??
        '';
  }

  /// Username
  @override
  Future<bool> saveUserName(String username) async {
    return sharedPref.setString(AppConstant.sharePrefKeys.username, username);
  }

  @override
  Future<String> getUserName() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.username) ?? '';
  }

  /// Host & Database
  @override
  Future<bool> saveHost(String host) async {
    return sharedPref.setString(AppConstant.sharePrefKeys.host, host);
  }

  @override
  Future<String> getHost() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.host) ?? '';
  }

  @override
  Future<bool> saveDatabase(String database) async {
    return sharedPref.setString(AppConstant.sharePrefKeys.database, database);
  }

  @override
  Future<String> getDatabase() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.database) ?? '';
  }

  /// Access Mobile
  @override
  Future<bool> saveAccessMobile(int accessMobile) async {
    return sharedPref.setInt(
        AppConstant.sharePrefKeys.accessMobile, accessMobile);
  }

  @override
  Future<int> getAccessMobile() async {
    return sharedPref.getInt(AppConstant.sharePrefKeys.accessMobile) ?? 0;
  }


  /// Save Attachment
  @override
  Future<bool> saveAttachment(String recordId, String taskId) async {
    return sharedPref.setString('recordId_' + recordId, taskId);
  }

  @override
  Future<String> getAttachment(String recordId) async {
    return sharedPref.getString('recordId_' + recordId) ?? '';
  }

  /// Password
  @override
  Future<bool> savePassword(String password) async {
    return sharedPref.setString(AppConstant.sharePrefKeys.passwordUser, password);
  }

  @override
  Future<String> getPassword() async {
    return sharedPref.getString(AppConstant.sharePrefKeys.passwordUser) ?? '';
  }
}
