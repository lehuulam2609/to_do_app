import 'package:to_do_app/language/language.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:to_do_app/models/remote/order_model.dart';
import 'package:to_do_app/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:to_do_app/views/buy/widgets/item_order_widget.dart';
import 'package:to_do_app/views/call/widgets/header_widget.dart';
import 'dart:io';
import 'package:to_do_app/views/sell/sell_view_model.dart';

class SellView extends GetWidget<SellViewModel> {
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
                      HeaderWidget(title: LanguageKey.sellListText.tr),

                      /// Body
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: controller.listOrders.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              final OrderModel item =
                                  controller.listOrders.value[index];
                              return ItemOrderWidget(item: item);
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
