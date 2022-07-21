import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/utils/app_asset.dart';
import 'package:to_do_app/utils/app_helper.dart';
import 'package:to_do_app/utils/app_style.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  HeaderWidget({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadow,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      ),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          height: 66,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  color: Colors.white,
                  height: 66,
                  padding: EdgeInsets.only(left: 8),
                  child: Container(
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      AppImages.icBack,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppHelper.resizeByWidth(context, 10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyles().semiboldOpenSans(
                      20,
                      AppColor.black11142D,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Container(
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
