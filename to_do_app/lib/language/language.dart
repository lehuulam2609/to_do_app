import 'package:to_do_app/language/en.dart';
import 'package:to_do_app/utils/app_constant.dart';
import 'package:get/get.dart';

class LanguageKey {
  static const error = 'error';
  static const yes_button = 'yes_button';
  static const no_button = 'no_button';
  static const ok_button = 'ok_button';
  static const success = 'success';

  static const cameraPermission = 'camera_permission';
  static const photoPermission = 'photo_permission';
  static const locationPermission = 'location_permission';
  static const deny = 'deny';
  static const settings = 'settings';
  static const cameraDescription = 'camera_description';
  static const photoDescription = 'photo_description';
  static const locationDescription = 'location_description';

  /// Home
  static const toCallButton = 'to_call_button';
  static const toBuyButton = 'to_buy_button';
  static const toSellButton = 'to_sell_button';
  static const callListText = 'call_list_text';
}

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        LocaleKey.EN: EnglishLanguage().generateLanguage(),
      };
}
