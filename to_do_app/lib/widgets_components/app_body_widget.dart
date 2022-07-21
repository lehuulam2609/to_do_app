
import 'package:to_do_app/utils/app_constant.dart';
import 'package:to_do_app/widgets_components/back_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBodyWidget extends StatelessWidget {
  AppBodyWidget({@required this.title, @required this.body, this.onTap, this.enableBackButton = true});

  final String title;
  final Widget body;
  final Function onTap;
  final bool enableBackButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(GetUtils.capitalize(title),style: TextStyle(
            fontFamily: NameFont.openSans,
            color: Colors.black
          ),),
          backgroundColor: Colors.grey[100],
          elevation: 0.5,
          leading: Visibility(
            visible: enableBackButton,
            child: BackIconWidget(
              onTap: onTap,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: body,
        ),
      ),
    );
  }
}
