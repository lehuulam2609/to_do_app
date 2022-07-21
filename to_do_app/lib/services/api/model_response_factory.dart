
import 'package:to_do_app/models/remote/contact_model.dart';
import 'package:to_do_app/models/remote/order_model.dart';
import 'package:to_do_app/models/remote/token_model.dart';
import 'package:to_do_app/models/remote/user_model.dart';

Type typeOf<T>() => T;
Type typeOfElementsInList<T>() => T.runtimeType;

class ApiResponseFactory {
  static final Map<String, Function(dynamic json)> responseParser = {
    'String': (json) => json,
    'UserModel': (json) => UserModel.fromJson(json),
    'List<UserModel>': (json) => parseList<UserModel>(json),
    'TokenModel': (json) => TokenModel.fromJson(json),
    'List<TokenModel>': (json) => parseList<TokenModel>(json),
    // UserMainResponse
    'UserMainResponse': (json) => UserMainResponse.fromJson(json),
    'List<UserMainResponse>': (json) => parseList<UserMainResponse>(json),
    'UserSubResponse': (json) => UserSubResponse.fromJson(json),
    'List<UserSubResponse>': (json) => parseList<UserSubResponse>(json),
    'ContactModel': (json) => ContactModel.fromJson(json),
    'List<ContactModel>': (json) => parseList<ContactModel>(json),
    'OrderModel': (json) => OrderModel.fromJson(json),
    'List<OrderModel>': (json) => parseList<OrderModel>(json),
  };

  static dynamic parseJson<T>(json) {
    return responseParser[T?.toString()]?.call(json);
  }

  static List<T> parseList<T>(json) {
    return json is List
        ? List<T>.from(json.map((e) => responseParser[T?.toString()]?.call(e)))
        : null;
  }
}
