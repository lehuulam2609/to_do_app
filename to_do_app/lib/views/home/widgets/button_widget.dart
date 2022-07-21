import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_style.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final bool active;
  final double height;
  final double horizontalWidth;
  final Color textColor;
  final TextStyle style;

  ButtonWidget({
    Key key,
    @required this.buttonText,
    @required this.onTap,
    @required this.active,
    @required this.height,
    @required this.horizontalWidth,
    this.textColor,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalWidth,
        vertical: 15.0,
      ),
      height: height ?? 50,
      width: MediaQuery.of(context).size.width - (horizontalWidth * 2),
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            AppColor.blue0070BB,
            AppColor.blue005F9F,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: active == true
          ? TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
              ),
              child: Text(
                this.buttonText,
                textAlign: TextAlign.center,
                style: style ??
                    TextStyles().boldOpenSans(16, textColor ?? Colors.white),
              ),
              onPressed: () {
                onTap();
              },
            )
          : Container(
              alignment: Alignment.center,
              height: height ?? 50,
              width: MediaQuery.of(context).size.width - (horizontalWidth * 2),
              child: Text(
                this.buttonText,
                textAlign: TextAlign.center,
                style: style ??
                    TextStyles().boldOpenSans(16, textColor ?? Colors.white),
              ),
            ),
    );
  }
}
