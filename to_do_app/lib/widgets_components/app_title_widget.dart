
import 'package:to_do_app/utils/app_size.dart';
import 'package:to_do_app/widgets_components/back_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTitleWidget extends StatelessWidget {
  AppTitleWidget({
    @required this.title,
    this.onTap,
    this.isVisibility = false,
  });

  final String title;
  final Function onTap;
  final bool isVisibility;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: isVisibility,
            child: BackIconWidget(
              onTap: onTap,
            ),
          ),
          Text(
            title,
            style: Get.textTheme.subtitle1
                .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Visibility(
              visible: isVisibility,
              child: SizedBox(
                  height: AppSize.width(30), width: AppSize.width(30))),
        ],
      ),
    );
  }
}
