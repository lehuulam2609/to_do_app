import 'package:get/get.dart';
import 'package:to_do_app/my_app.dart';
import 'package:to_do_app/utils/app_config.dart';

void main() async {
  Get.put<AppEnvironment>(AppEnvironment.dev());
  await runMyApp();
}
