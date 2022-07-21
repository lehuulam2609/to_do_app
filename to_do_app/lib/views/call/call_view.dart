import 'package:to_do_app/language/language.dart';
import 'package:to_do_app/models/remote/contact_model.dart';
import 'package:to_do_app/views/call/call_view_model.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:to_do_app/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:to_do_app/views/call/widgets/header_widget.dart';
import 'package:to_do_app/views/call/widgets/item_contact_widget.dart';
import 'dart:io';

import 'package:to_do_app/views/home/widgets/button_widget.dart';

class CallView extends GetWidget<CallViewModel> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          if (Navigator.of(context).canPop()) {
            return true;
          } else {
            MoveToBackground.moveTaskToBack();
            return false;
          }
        }
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Container(
                  color: AppColor.grey244,
                  child: Column(
                    children: [
                      /// Header
                      HeaderWidget(title: LanguageKey.callListText.tr),

                      /// Body
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: controller.listContacts.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final ContactModel item =
                                  controller.listContacts.value[index];
                              return ItemContactWidget(item: item);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => AppHelper.buildLoading(controller.isLoading.value)),
            ],
          ),
        ),
      ),
    );
  }
}
