import 'package:flutter/cupertino.dart';
import 'package:to_do_app/utils/app_constant.dart';

class AppStyles {
  static TextStyles textStyles;
  static AppColor colorStyles;
}

class TextStyles {
  /// OpenSans
  TextStyle boldOpenSans(double size, Color color, {double height = 1.0}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color,
        height: height,
        fontFamily: NameFont.openSans,
      );

  TextStyle semiboldOpenSans(double size, Color color,
          {double height = 1.0}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
        height: height,
        fontFamily: NameFont.openSans,
      );

  TextStyle mediumOpenSans(double size, Color color, {double height = 1.0}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        height: height,
        fontFamily: NameFont.openSans,
      );

  TextStyle regularOpenSans(double size, Color color, {double height = 1.0}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color,
        height: height,
        fontFamily: NameFont.openSans,
      );

  TextStyle lightOpenSans(double size, Color color, {double height = 1.0}) =>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: color,
        height: height,
        fontFamily: NameFont.openSans,
      );
}

class AppColor {
  static const Color blue = Color.fromRGBO(29, 161, 242, 1);
  static const Color whiteLilac = Color.fromRGBO(248, 250, 252, 1);
  static const Color blackPearl = Color.fromRGBO(30, 31, 43, 1);
  static const Color brinkPink = Color.fromRGBO(255, 97, 136, 1);
  static const Color juneBud = Color.fromRGBO(186, 215, 97, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color nevada = Color.fromRGBO(105, 109, 119, 1);
  static const Color ebonyClay = Color.fromRGBO(40, 42, 58, 1);
  static const Color hhColor = Color.fromRGBO(72, 34, 131, 1);
  static const Color grey244 = Color.fromRGBO(244, 249, 253, 1);
  static const Color shadow = Color.fromRGBO(165, 177, 196, 0.3);
  static const Color shadow15 = Color.fromRGBO(165, 177, 196, 0.15);
  
  static const Color grey544D7E = Color(0xFF544D7E);

  static const Color black11142D = Color(0xFF11142D);
  static const Color grey808191 = Color(0xFF808191);
  static const Color blue004987 = Color(0xFF004987);
  static const Color borderB2B3BD = Color(0xFFB2B3BD);
  static const Color grey11142D = Color(0xFF11142D);
  static const Color greyE4E4E4 = Color(0xFFE4E4E4);
  static const Color greyF0F3F6 = Color(0xFFF0F3F6);
  static const Color redFF754C = Color(0xFFFF0000); // Old: FF754C
  static const Color redFF0000= Color(0xFFFF0000);
  static const Color blue3F8CFF = Color(0xFF3F8CFF);
  static const Color black1B1D21 = Color(0xFF1B1D21);
  static const Color greyE4E9F2 = Color(0xFFE4E9F2);
  static const Color redAA182C = Color(0xFFAA182C);
  static const Color greyE3E6EC = Color(0xFFE3E6EC);
  static const Color grey333333 = Color(0xFF333333);
  static const Color green7FBA7A = Color(0xFF7FBA7A);
  static const Color orangeFF754C = Color(0xFFFF754C);

  static const Color blue006ECB = Color(0xFF006ECB);
  static const Color grey7D8592 = Color(0xFF7D8592);
  static const Color grey222222 = Color(0xFF222222);
  static const Color greyD8E0F0 = Color(0xFFD8E0F0);
  static const Color blue0070BB = Color(0xFF0070BB);
  static const Color blue005F9F = Color(0xFF005F9F);
  static const Color blue11 = Color.fromRGBO(11, 98, 169, 1);
  static const Color greyB3B3B3 = Color(0xFFB3B3B3);
  static const Color grey676767 = Color(0xFF676767);
  static const Color grey2F2F2F = Color(0xFF2F2F2F);
  static const Color greyF2F2F2 = Color(0xFFF2F2F2);
  static const Color green2B9D77 = Color(0xFF2B9D77);
  static const Color green219653 = Color(0xFF219653);
  static const Color grey1B1D21 = Color(0xFF1B1D21);
  static const Color greyE1E1E1 = Color(0xFFE1E1E1);
  static const Color redEB5757 = Color(0xFFEB5757);
  static const Color green00BD9F = Color(0xFF00BD9F);
  static const Color redFF361D = Color(0xFFFF361D);
}
