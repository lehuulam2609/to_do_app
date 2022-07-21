
import 'package:get/get.dart';
import 'package:to_do_app/views/sell/sell_view_model.dart';

class SellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SellViewModel(
        sqLiteStorage: Get.find(),
      ),
    );
  }
}
