
import 'package:get/get.dart';
import 'package:to_do_app/utils/app_config.dart';
import 'my_app.dart';

void main() async {
  Get.put<AppEnvironment>(AppEnvironment.live());
  await runMyApp();
}
