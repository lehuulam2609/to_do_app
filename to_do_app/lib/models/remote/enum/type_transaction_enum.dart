
/*
key to look from transaction list item: trType
Values:
Fund: FUNDING
Transfer: TRANSFER_BETWEEN_USERS
Order: CARD_ORDER
Refund: REFUNDING
Walk in: WALK_IN_FOOD_ORDER
App Order: APP_FOOD_ORDER
Return: RETURN_ORDER
*/
import 'package:enum_to_string/enum_to_string.dart';

enum TypeTransactionEnum {
  FUNDING,
  TRANSFER_BETWEEN_USERS,
  CARD_ORDER,
  REFUNDING,
  WALK_IN_FOOD_ORDER,
  APP_FOOD_ORDER,
  RETURN_ORDER,
  VAT,
  ADULT_VAT,
  COUPON_PURCHASE,
}

TypeTransactionEnum enumFromString(String value) {
  return EnumToString.fromString(TypeTransactionEnum.values, value);
}

String enumToString(TypeTransactionEnum type) {
  return EnumToString.convertToString(type);
}