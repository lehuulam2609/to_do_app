import 'package:to_do_app/language/language.dart';
import 'package:to_do_app/views/home/home_view_model.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:to_do_app/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'dart:io';

import 'package:to_do_app/views/home/widgets/button_widget.dart';

class HomeView extends GetWidget<HomeViewModel> {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// TO CALL
                      ButtonWidget(
                        buttonText: LanguageKey.toCallButton.tr,
                        onTap: () {
                          controller.navigateCall();
                        },
                        active: true,
                        height: 56,
                        horizontalWidth: 20,
                      ),

                      /// TO BUY
                      ButtonWidget(
                        buttonText: LanguageKey.toBuyButton.tr,
                        onTap: () {
                          controller.navigateBuy();
                        },
                        active: true,
                        height: 56,
                        horizontalWidth: 20,
                      ),

                      /// TO SELL
                      ButtonWidget(
                        buttonText: LanguageKey.toSellButton.tr,
                        onTap: () {
                          controller.navigateSell();
                        },
                        active: true,
                        height: 56,
                        horizontalWidth: 20,
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
