import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void printLog({
  @required String nameFunc,
  @required String feature,
  @required dynamic data,
}) {
  if (!kReleaseMode) {
    print(
        "[🔥${nameFunc?.toUpperCase() ?? ''} ] _${feature ?? ''} data = $data");
  }
}
