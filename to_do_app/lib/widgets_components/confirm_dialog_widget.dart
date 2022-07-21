
import 'package:to_do_app/language/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDialogWidget extends StatelessWidget {
  final String contentDialog;
  final Function button;

  ConfirmDialogWidget({
    this.contentDialog,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(contentDialog),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            button?.call();
            Get.back();
          },
          child: Text(LanguageKey.yes_button.tr),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Get.back();
          },
          child: Text(LanguageKey.no_button.tr),
        ),
      ],
    );
  }
}
