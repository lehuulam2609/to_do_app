
import 'package:to_do_app/services/local_storage/auth_local_storage.dart';

abstract class AuthRepo {
  Future<String> getApiKey();
  Future<String> getAuthToken();
  Future<bool> saveApiKey(String apiKey);
  Future<bool> saveAuthToken(String authToken);
  Future<bool> handleUnAuthorized();
}

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({this.authLocalStorage});

  AuthLocalStorage authLocalStorage;

  String _apiKey;

  @override
  Future<String> getApiKey({bool fromDisk = false}) async {
    if (_apiKey != null && !fromDisk) {
      return _apiKey;
    }
    return authLocalStorage.getApiKey();
  }

  @override
  Future<String> getAuthToken() async {
    return authLocalStorage.getAuthToken();
  }

  @override
  Future<bool> saveApiKey(String apiKey) async {
    _apiKey = apiKey;
    return authLocalStorage.saveApiKey(apiKey);
  }

  @override
  Future<bool> saveAuthToken(String authToken) async =>
      authLocalStorage.saveAuthToken(authToken);

  @override
  Future<bool> handleUnAuthorized() {
    return authLocalStorage.handleUnAuthorized();
  }
}
