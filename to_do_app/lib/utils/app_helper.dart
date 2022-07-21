import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:to_do_app/core/services/language_service.dart';
import 'package:to_do_app/language/language.dart';
import 'package:to_do_app/repos/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:to_do_app/services/api/user_api.dart';
import 'package:to_do_app/services/local_storage/hive_storage.dart';
import 'package:to_do_app/utils/app_config.dart';
import 'package:to_do_app/utils/app_constant.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:image/image.dart' as img;

class AppHelper {
  static double widthScreenDefault = 414;
  static double heightScreenDefault = 896;

  static LanguageService languageService = Get.find();

  /// Show popup
  static void showPopup(Widget child, BuildContext context,
      {Function onAction}) {
    showDialog<dynamic>(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: child,
          );
        });
  }

  /// blocks rotation; sets orientation to: portrait
  static Future<void> portraitModeOnly() {
    return SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }

  /// blocks rotation; sets orientation to: landscape
  static Future<void> landscapeModeOnly() {
    return SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
  }

  /// Enable rotation
  static Future<void> enableRotation() {
    return SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
  }

  /// Show popup permission camera
  static void showPopupCamera(BuildContext context) async {
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(LanguageKey.cameraPermission.tr),
        content: Text(LanguageKey.cameraDescription.tr,
            style: TextStyle(
              height: 1.3,
              fontFamily: NameFont.openSans,
            )),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(LanguageKey.deny.tr),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            child: Text(LanguageKey.settings.tr),
            onPressed: () => openAppSettings(),
          ),
        ],
      ),
    );
  }

  /// Show popup permission Photo
  static void showPopupPhoto(BuildContext context) async {
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(LanguageKey.photoPermission.tr),
        content: Text(LanguageKey.photoDescription.tr,
            style: TextStyle(
              height: 1.3,
              fontFamily: NameFont.openSans,
            )),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(LanguageKey.deny.tr),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            child: Text(LanguageKey.settings.tr),
            onPressed: () => openAppSettings(),
          ),
        ],
      ),
    );
  }

  /// Show popup permission Location
  static void showPopupLocation(BuildContext context) async {
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(LanguageKey.locationPermission.tr),
        content: Text(LanguageKey.locationDescription.tr,
            style: TextStyle(
              height: 1.3,
              fontFamily: NameFont.openSans,
            )),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(LanguageKey.deny.tr),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            child: Text(LanguageKey.settings.tr),
            onPressed: () => openAppSettings(),
          ),
        ],
      ),
    );
  }

  /// Resize by width
  static double resizeByHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value / heightScreenDefault;
  }

  static double resizeByWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value / widthScreenDefault;
  }

  static bool validateFullName(String name) {
    return name.replaceAll(' ', '').length > 0;
  }

  static bool validateMobile(String string) {
    if (string == null || string.isEmpty) {
      return false;
    }

    const pattern = r'^(?:[+0]9)?[0-9]{10}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static bool validateMail(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(mail);
  }

  static bool validatePassword(String password) {
    Pattern pattern = r'^((?=.*[A-Z])(?=.*\W).{8,50})$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(password);
  }

  static String removeLastCharacter(String text) {
    if (text != null && text.length > 0 && text[text.length - 1] == ' ') {
      text = text.substring(0, text.length - 1);
      return text;
    }
    return text;
  }

  /// ERROR
  static void showError(String text, {String title, int time}) {
    Get.snackbar(
      title ?? LanguageKey.error.tr,
      text,
      duration: Duration(seconds: time ?? 3),
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.5),
      animationDuration: Duration(milliseconds: 400),
    );
  }

  /// Loading
  static Widget buildLoading(bool isLoading) {
    if (isLoading == true) {
      return Container(
        color: Color.fromRGBO(40, 42, 62, 0),
        child: SpinKitCircle(color: AppColor.hhColor.withOpacity(0.8)),
        alignment: Alignment.center,
      );
    } else {
      return Container();
    }
  }

  /// Check url image
  static String validAvatarUrl(String avatar) {
    if (avatar == '' || avatar == null) {
      return '';
    }
    if ((avatar ?? '').contains('http')) {
      return avatar;
    }
    String url = Get.find<AppEnvironment>().imageUrl;
    return url + avatar;
  }

  /// String -> Date
  static DateTime convertStringToDateWithFormat(String date, String format) {
    var _fm = DateFormat(format);
    return _fm.parse(date) ?? DateTime.now();
  }

  /// Date -> String
  static String convertDatetoStringWithFormat(DateTime date, String format) {
    var _fm = DateFormat(format);
    return _fm.format(date) ?? '';
  }

  /// Valid English
  static bool isValidEnglish(String name) {
    RegExp regExp = new RegExp(r'^[a-z ]');
    if (name.isEmpty) {
      return false;
    }
    if (!regExp.hasMatch(name)) {
      return false;
    }
    return true;
  }

  /// Valid Arabic
  static bool isValidArabic(String name) {
    RegExp regExp = new RegExp(
      r'^[\u0621-\u064A\u0660-\u0669 ]',
    );
    if (name.isEmpty) {
      return false;
    }
    if (!regExp.hasMatch(name)) {
      return false;
    }
    return true;
  }

  /// Format number .00
  static String formatNumber(double value) {
    String format = '';
    if (value < 1000) {
      format = '##0.###';
    } else if (value < 1000000) {
      format = '##0,000.###';
    } else if (value < 1000000000) {
      format = '##0,000,000.###';
    } else if (value < 1000000000000) {
      format = '##0,000,000,000.###';
    } else {
      format = '##0,000,000,000,000.###';
    }
    final formatter = NumberFormat(format).format(value);
    return formatter;
  }

  /// Check double value
  static String convertTextToFormatNumber(String text) {
    if ((text ?? '').isEmpty) {
      return '0';
    }
    final double price = double.tryParse(text);
    return formatNumber(price);
  }

  //// SHOW DIALOG
  static void showAlertDialog(BuildContext context, String message) {
    Widget cancelButton = FlatButton(
      child: Text(LanguageKey.ok_button.tr),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(message),
      actions: [
        cancelButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showAlertDialogSuccess(BuildContext context, String text) {
    Widget okButton = FlatButton(
      child: Text(LanguageKey.ok_button.tr),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(LanguageKey.success.tr),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /// REMOVE SPACE START/END STRING
  static String getWithoutSpaces(String s) {
    if (s.length > 1) {
      String tmp = s.substring(1, s.length - 1);
      while (tmp.startsWith(' ')) {
        tmp = tmp.substring(1);
      }
      while (tmp.endsWith(' ')) {
        tmp = tmp.substring(0, tmp.length - 1);
      }

      return tmp;
    }
    return s;
  }

  static bool checkSameDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  /// RESIZED IMAGE
  static Future<File> resizeImage(File file, {double width = 300}) async {
    var decodedImage = await decodeImageFromList(file.readAsBytesSync());
    img.Image imageTemp = img.decodeImage(file.readAsBytesSync());
    img.Image resizedImg = img.copyResize(imageTemp,
        width: width.round(),
        height:
            (width.round() * decodedImage.height / decodedImage.width).round());
    return file..writeAsBytesSync(img.encodePng(resizedImg));
  }

  /// Base 64
  static Widget getImageBase64(
      String base64image, double width, double height) {
    Uint8List byte =
        base64.decode((base64image.split('base64').last).replaceAll(',', ''));
    return Image.memory(
      byte,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  /// Get Image Asset
  static Widget getImageAsset(String name, double width, double height,
      {Color color, BoxFit fit}) {
    return Container(
        width: height,
        height: height,
        child: fit != null
            ? (color != null
                ? Image.asset(
                    name,
                    width: width,
                    height: height,
                    color: color,
                    fit: fit,
                  )
                : Image.asset(
                    name,
                    width: width,
                    height: height,
                    fit: fit,
                  ))
            : (color != null
                ? Image.asset(
                    name,
                    width: width,
                    height: height,
                    color: color,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    name,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                  )));
  }

  /// Convert Base 64 to File
  static Future<File> convertBase64ToFile(
      String base64image, String nameImage) async {
    final String data = (base64image.split('base64').last).replaceAll(',', '');
    Uint8List bytes = base64.decode(data);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$dir/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        "${nameImage.toString()}.png");
    await file.writeAsBytes(bytes);
    return file;
  }

  /// Convert File to base64
  static String convertFileToBase64(File file) {
    Uint8List bytes = file.readAsBytesSync();
    return base64Encode(bytes);
  }

  /// Check first /
  static String checkFirstCharacterServer(String url) {
    url = url.replaceAll('//', '/');
    if (url[0] == '/') {
      return url.substring(1, url.length - 1);
    }
    return url;
  }

  /// Check last /
  static String checkLastCharacterServer(String url) {
    if (url[url.length - 1] == '/') {
      return url.substring(0, url.length - 2);
    }
    return url;
  }

  /// Check Profile
  static Future<void> checkProfileApi() async {
    final userApi = Get.find<UserApi>();
    final hiveStorage = Get.find<HiveStorage>();
    if (await hasConnection()) {
      var response = await userApi.postGetProfile();
      if (response.hasError) {
        userSubResponseLocal = null;
      } else {
        final result = response?.response?.data ?? [];
        userSubResponseLocal = (result.length > 0) ? result.first : null;

        /// Hive Storage User
        hiveStorage.insertCurrentUser(userSubResponseLocal);
      }
    } else {
      userSubResponseLocal = await hiveStorage.getCurrentUser();
    }
  }

  static Color checkColorFromStatus(String status) {
    if (status == 'Completed') {
      return AppColor.blue3F8CFF;
    } else if (status == 'In progress') {
      return AppColor.green7FBA7A;
    } else {
      return AppColor.redFF754C;
    }
  }

  static String getBase64FromFile(File file) {
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    return fileInBase64;
  }

  static String checkHostLink(String host) {
    if ((host ?? '').isEmpty || host.contains('http')) {
      return host ?? '';
    }
    if (host.contains('v1/database')) {
      return 'https://${host.toString()}'.replaceAll('//fmi', '/fmi');
    }
    return 'https://${host.toString()}/fmi/data/v1/databases'
        .replaceAll('//fmi', '/fmi');
  }

  /// Name Avatar Empty
  static String getFullNameEmpty(String firstName, String lastName) {
    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return firstName[0] + lastName[0];
    } else if (firstName.length > 1 && lastName.isEmpty) {
      return firstName[0] + firstName[1];
    } else if (lastName.length > 1 && firstName.isEmpty) {
      return lastName[0] + lastName[1];
    }
    return '';
  }

  /// Check connect Internet
  static Future<bool> hasConnection() async {
    bool hasWifi = false;
    bool hasMobileConnection = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      hasMobileConnection = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      hasWifi = true;
    }
    return hasWifi || hasMobileConnection;
  }
}
