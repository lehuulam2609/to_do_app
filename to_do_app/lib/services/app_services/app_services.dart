import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/core/services/language_service.dart';
import 'package:path/path.dart';
import 'package:to_do_app/repos/auth_repo.dart';
import 'package:to_do_app/services/api/api.dart';
import 'package:to_do_app/services/api/auth_api.dart';
import 'package:to_do_app/services/api/to_do_api.dart';
import 'package:to_do_app/services/api/user_api.dart';
import 'package:to_do_app/services/local_storage/auth_local_storage.dart';
import 'package:get/get.dart';
import 'package:to_do_app/services/local_storage/hive_storage.dart';
import 'package:to_do_app/services/local_storage/sqlite_storage.dart';
import 'package:to_do_app/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices {
  static Future<void> initServices() async {
    print('Starting services ...');
    final box = Hive.box(EventKey.hiveDB);
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sell.db');
    final db = await openDatabase(path, version: 1,
        onCreate: (Database database, int version) async {
      await database.transaction((txn) async {
        await txn.execute('''
      CREATE TABLE "${SQLiteDatabaseConstant.itemToSell}" ( 
        "id" INTEGER, 
        "name" TEXT,
        "price" REAL,
        "quantity" INTEGER,
        "type" INTEGER);
      ''');
      });
    });

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
    Get.put<SQLiteStorage>(SQLiteStorageIpml(db: db));
    print('All services started! ✅');
  }
}
