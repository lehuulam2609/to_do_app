/*
 * Developed by Hiep Le on 11/12/20 4:26 PM.
 * Last modified 11/12/20 4:26 PM.
 * Copyright (c) 2020 BeeSight Soft. All rights reserved.
 *
 */
import 'package:to_do_app/core/rxobject/rxobject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingContentWidget<T> extends StatelessWidget {
  LoadingContentWidget(
      {@required this.obj,
      this.width,
      this.height,
      this.contentBuilder,
      this.errorBuilder,
      this.loadingWidget});

  final double height;
  final double width;
  final RxBusyObject obj;
  final Widget Function(T data) contentBuilder;
  final Widget Function(dynamic error) errorBuilder;
  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => obj.isbusy.value
          ? Center(child: loadingWidget ?? CupertinoActivityIndicator())
          : (obj.hasError
              ? errorBuilder?.call(obj.error) ??
                  Center(
                    child: Container(
                      child: Text("Something wrong"),
                    ),
                  )
              : contentBuilder?.call(obj.value)),
    );
  }
}
