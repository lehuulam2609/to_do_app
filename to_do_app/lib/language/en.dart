
import 'package:to_do_app/language/language.dart';

class EnglishLanguage {
  Map<String, String> generateLanguage() {
    return {
      LanguageKey.error: 'Message',
      LanguageKey.yes_button: 'Yes',
      LanguageKey.no_button: 'No',
      LanguageKey.ok_button: 'OK',
      LanguageKey.success: 'Success',

      LanguageKey.cameraPermission: 'Camera Permission',
      LanguageKey.photoPermission: 'Photo Permission',
      LanguageKey.locationPermission: 'Location Permission',
      LanguageKey.settings: 'Settings',
      LanguageKey.deny: 'Deny',
      LanguageKey.photoDescription: 'This app needs access to photo album',
      LanguageKey.cameraDescription: 'This app needs camera access to take photo',
      LanguageKey.locationDescription: 'This app needs access to location',

      /// Home
      LanguageKey.toCallButton: 'To Call',
      LanguageKey.toBuyButton: 'To Buy',
      LanguageKey.toSellButton: 'To Sell',
      LanguageKey.callListText: 'Call List'
    };
  }
}
