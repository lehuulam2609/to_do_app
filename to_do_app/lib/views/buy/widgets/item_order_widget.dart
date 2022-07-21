import 'package:flutter/material.dart';
import 'package:to_do_app/language/language.dart';
import 'package:to_do_app/models/remote/order_model.dart';
import 'package:to_do_app/utils/app_style.dart';
import 'package:get/get.dart';

class ItemOrderWidget extends StatelessWidget {
  final OrderModel item;
  ItemOrderWidget({
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          padding: EdgeInsets.all(11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${LanguageKey.nameText.tr}${item.name}',
                  style: TextStyles().semiboldOpenSans(
                    16,
                    AppColor.black11142D,
                    height: 1.3,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${LanguageKey.priceText.tr}${item.price.toStringAsFixed(0)}',
                  style: TextStyles().regularOpenSans(
                    16,
                    AppColor.black11142D,
                    height: 1.3,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${LanguageKey.quantityText.tr}${item.quantity.toString()}',
                  style: TextStyles().regularOpenSans(
                    16,
                    AppColor.black11142D,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),

        /// Line
        Container(
          height: 1,
          color: AppColor.shadow,
        ),
      ],
    );
  }
}
