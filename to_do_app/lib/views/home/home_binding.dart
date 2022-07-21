import 'package:to_do_app/views/home/home_view_model.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeViewModel(),
    );
  }
}
