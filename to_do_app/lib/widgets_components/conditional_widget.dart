/*
 * Developed by BSSDev.
 * Last modified
 * Copyright (c) 2021 BeeSight Soft. All rights reserved.
 *
 */
import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  ConditionalWidget(
      {this.condition,
      @required this.widgetShowIfTrue,
      this.widgetShowIfFalse});

  final bool condition;
  final Widget Function() widgetShowIfTrue;
  final Widget Function() widgetShowIfFalse;

  @override
  Widget build(BuildContext context) {
    var _condition = condition ?? false;
    return _condition

        /// If condition = true
        ? widgetShowIfTrue?.call() ?? SizedBox()

        /// If condition = false
        : widgetShowIfFalse?.call() ?? SizedBox();
  }
}
