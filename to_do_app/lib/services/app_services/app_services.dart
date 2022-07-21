
import 'package:hive/hive.dart';
import 'package:to_do_app/core/services/language_service.dart';
import 'package:to_do_app/repos/auth_repo.dart';
import 'package:to_do_app/services/api/api.dart';
import 'package:to_do_app/services/api/auth_api.dart';
import 'package:to_do_app/services/api/to_do_api.dart';
import 'package:to_do_app/services/api/user_api.dart';
import 'package:to_do_app/services/local_storage/auth_local_storage.dart';
import 'package:get/get.dart';
import 'package:to_do_app/services/local_storage/hive_storage.dart';
import 'package:to_do_app/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices {
  static Future<void> initServices() async {
    print('Starting services ...');
    final box = Hive.box(EventKey.hiveDB);
    await Get.putAsync<SharedPreferences>(() async {
      return await SharedPreferences.getInstance();
    });
    await Get.putAsync(() async {
      return await LanguageService(sharedPreferences: Get.find()).init();
    });
    Get.put<AuthLocalStorage>(AuthLocalStorageIpml(sharedPref: Get.find()));
    Get.put<AuthRepo>(AuthRepoImpl(authLocalStorage: Get.find()));
    Get.put<DioApi>(DioApi(authRepo: Get.find()));
    Get.put<AuthApi>(AuthApiIpml(dioApi: Get.find()));
    Get.put<UserApi>(UserApiIpml(dioApi: Get.find()));
    Get.put<ToDoApi>(ToDoApiIpml(dioApi: Get.find()));
    Get.put<HiveStorage>(HiveStorageIpml(box: box, authRepo: Get.find()));
    print('All services started! ✅');
  }
}
