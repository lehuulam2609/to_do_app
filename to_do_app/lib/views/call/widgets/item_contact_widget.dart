import 'package:flutter/material.dart';
import 'package:to_do_app/models/remote/contact_model.dart';
import 'package:to_do_app/utils/app_style.dart';

class ItemContactWidget extends StatelessWidget {
  final ContactModel item;
  ItemContactWidget({
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
          child: Row(
            children: [
              /// Avatar
              Container(
                margin: EdgeInsets.only(right: 14),
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400],
                ),
              ),

              /// Name/Phone
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.name,
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
                        item.number,
                        style: TextStyles().regularOpenSans(
                          15,
                          AppColor.black11142D,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
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
