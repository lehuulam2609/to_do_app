
import 'package:get/get.dart';
import 'package:to_do_app/views/call/call_view_model.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CallViewModel(
        toDoApi: Get.find(),
      ),
    );
  }
}
