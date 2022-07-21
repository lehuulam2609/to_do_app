
import 'package:get/get.dart';
import 'package:to_do_app/views/buy/buy_view_model.dart';

class BuyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BuyViewModel(
        toDoApi: Get.find(),
      ),
    );
  }
}
