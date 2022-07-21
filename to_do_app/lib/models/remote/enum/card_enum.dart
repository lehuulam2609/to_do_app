//['TURQUOISE', 'BLUE', 'PURPLE', 'GREEN', 'GIRL', 'YELLOW', 'BOY', 'WHITE', 'RED', 'ORANGE']//

import 'package:enum_to_string/enum_to_string.dart';


enum CardEnum {
  TURQUOISE,
  BLUE,
  PURPLE,
  GREEN,
  GIRL,
  YELLOW,
  BOY,
  WHITE,
  RED,
  ORANGE,
}

CardEnum enumFromStringCard(String value) {
  return EnumToString.fromString(CardEnum.values, value);
}

String enumToStringCard(CardEnum type) {
  return EnumToString.convertToString(type);
}