import 'dart:io';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:to_do_app/core/theme/app_theme.dart';
import 'package:to_do_app/language/language.dart';
import 'package:to_do_app/repos/auth_repo.dart';
import 'package:to_do_app/utils/app_constant.dart';
import 'services/app_services/app_services.dart';
import 'utils/app_routes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

Future<void> runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  String dir = await _findLocalPath();
  Hive.init(dir);
  await Hive.openBox(EventKey.hiveDB);
  await AppServices.initServices();

  final authRepo = AuthRepoImpl(authLocalStorage: Get.find());
  String token = (await authRepo.getAuthToken()) ?? '';

  runApp(
    GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale(LocaleKey.EN)],
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppRoutes.mainRoutes,
      theme: AppThemes.lightTheme,
      locale: Locale(LocaleKey.EN),
      translations: Language(),
    ),
  );
}

Future<String> _findLocalPath() async {
  String externalStorageDirPath = '';
  if (Platform.isAndroid) {
    try {
      if ((externalStorageDirPath ?? '').isEmpty) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } catch (e) {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    }
  } else if (Platform.isIOS) {
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;
  }
  return externalStorageDirPath;
}

//INIT ONESIGNAL
Future<void> initOneSignal() async {
  await OneSignal.shared.setAppId(AppConstant.oneSignalAppId);
  OneSignal.shared.consentGranted(true);
  OneSignal.shared.setLocationShared(true);
  OneSignal.shared.setLogLevel(OSLogLevel.none, OSLogLevel.none);

  OneSignal.shared.setRequiresUserPrivacyConsent(true);
  // OneSignal.shared.userProvidedPrivacyConsent();

  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  OneSignal.shared.disablePush(false);

  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent notification) async {
    _handleNotificationReceived(notification);
  });

  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    _handleOpenNotificationReceived(result);
  });

  OneSignal.shared.setInAppMessageClickedHandler((OSInAppMessageAction action) {
    _handleInAppMessageClicked(action);
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    // Will be called whenever the permission changes
  });

  OneSignal.shared
      .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    // Will be called whenever the subscription changes
  });

  OneSignal.shared.setEmailSubscriptionObserver(
      (OSEmailSubscriptionStateChanges emailChanges) {
    // Will be called whenever then user's email subscription changes
  });

  final String currentPlayerId = (await OneSignal.shared.getDeviceState())?.userId ?? '';
  print("=================================================");
  print("@@@@@@@@@@@@@@@@@@@@@PLAYER_ID@@@@@@@@@@@@@@@@@@@@");
  print(currentPlayerId ?? '');
  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
  print("=================================================");
}

/// IN APP MESSAGE CLICK
void _handleInAppMessageClicked(OSInAppMessageAction notification) {
  print('IN APP MESSAGE CLICK: ${notification}');
  eventBus.fire(EventKey.reloadServerPush);
  Future.delayed(Duration(seconds: 2)).then((value) {
    eventBus.fire(EventKey.navigateTab2);
  });
}

//// WILL OPEN
void _handleOpenNotificationReceived(
    OSNotificationOpenedResult notification) async {
  print('NOTIFICATION OPENED HANDLER CALLED WITH: ${notification}');
  Future.delayed(Duration(seconds: 2)).then((value) {
    eventBus.fire(EventKey.navigateTab2);
  });
}

/// WILL RECEIVE
void _handleNotificationReceived(OSNotificationReceivedEvent notification) {
  print('NOTIFICATION RECEIVE: ${notification}');
  eventBus.fire(EventKey.reloadServerPush);
}
