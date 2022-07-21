import 'package:to_do_app/core/models/base_response_model.dart';
import 'package:to_do_app/core/rxobject/rxobject.dart';
import 'package:get/state_manager.dart';

class BaseViewModel extends GetxController {
  /// run a future, set isbusy corresponding during the future call and result to object's value
  /// set needThrowException = true when need to catch the error outside again
  Future<void> runBusyFuture(Future busyFuture,
      {RxBusyObject object, bool needThrowException = false}) async {
    try {
      object.setBusy(true);
      var result = await busyFuture;
      object.setBusy(false);
      // check if result is a BaseResponse
      // then transfer data or pass the BaseResponse.error to RxBusyObject.error for later needs
      if (result is BaseResponse) {
        transferApiResult(result, object);
      } else {
        object(result);
      }
      return;
    } catch (e) {
      object.setBusy(false);
      object.error = e;
      if (needThrowException) rethrow;
    }
  }

  void transferApiResult(BaseResponse result, RxBusyObject object) {
    if (result.hasError) {
      object.error = result.errorMessage;
    } else {
      object(result.response);
    }
  }
}
