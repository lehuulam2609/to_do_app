
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWidget extends StatelessWidget {
  final String contentDialog;
  final Function button;

  DialogWidget({
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
          child: Text('OK'),
        ),
      ],
    );
  }
}
