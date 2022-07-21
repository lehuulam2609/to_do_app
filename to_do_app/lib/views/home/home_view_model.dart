
import 'package:to_do_app/core/viewmodel/base_viewmodel.dart';
import 'package:get/get.dart';
import 'package:to_do_app/utils/app_routes.dart';

class HomeViewModel extends BaseViewModel {
  Rx<bool> isLoading = Rx<bool>(false);

  @override
  void onInit() async {
    super.onInit();

  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Navigate Call
  void navigateCall() {
    Get.toNamed(Routes.CALL);
  }
  
  /// Navigate Buy
  void navigateBuy() {
    Get.toNamed(Routes.BUY);
  }

  /// Navigate Sell
  void navigateSell() {
    Get.toNamed(Routes.SELL);
  }
}
