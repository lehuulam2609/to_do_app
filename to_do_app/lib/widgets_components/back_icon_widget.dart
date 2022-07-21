
import 'package:to_do_app/utils/app_size.dart';
import 'package:flutter/material.dart';

class BackIconWidget extends StatelessWidget {
  BackIconWidget({this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      onTap: (){
        onTap?.call();
      },
      child: Container(
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.blue,
            size: AppSize.width(20),
          ),
        ),
        height: AppSize.width(40),
        width: AppSize.width(40),
      ),
    );
  }
}
