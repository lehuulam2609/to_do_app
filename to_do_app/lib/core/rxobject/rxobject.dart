import 'package:get/get.dart';

abstract class Busy {
  RxBool isbusy = false.obs;
}

abstract class ErrorHandler<T> {
  T error;
  bool get hasError;

  ///clearError
  void clearEror();

  String get errorMessage;
}

class RxBusyObject<T> extends Rx<T> implements Busy, ErrorHandler<dynamic> {
  RxBusyObject({T initial}) : super(initial);
  @override
  RxBool isbusy = false.obs;

  /// set isbusy value and notify changes on views with RxBool
  /// to use in view: Obx(() => object.isBusy.value)
  void setBusy(bool value, {needClearError = true}) {
    if (value && needClearError) {
      clearEror();
    }
    isbusy(value);
  }

  @override
  void close() {
    isbusy.close();
    super.close();
  }

  @override
  var error;

  @override
  void clearEror() {
    error = null;
  }

  @override
  bool get hasError {
    return error != null;
  }

  @override
  String get errorMessage {
    return error.toString();
  }
}
