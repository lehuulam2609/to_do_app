
import 'package:get/get.dart';

class AppSize {
  static final _widthDevice = Get.width;
  static const L = "L";
  static const M = "M";
  static const S = "S";
  static const B = "B";

  ///
  /// * This function scale width item by screen width
  ///
  static double width(double width) {
    return width;
  }

  ///
  /// * This function scale width item by screen height
  ///
  static double height(double height) {
    return height;
  }

  /// A Card
  static double getAWidth() {
    var width = (_widthDevice - 16 * 3) * (2 / 3);
    return width;
  }

  static double getAHeight() {
    return getAWidth() / 2;
  }

  /// B Card
  static double getBWidth() {
    var width = (_widthDevice - 16 * 3) / 3;
    return width;
  }

  static double getBHeight() {
    return getBWidth();
  }

  /// C Card
  static double getCWidth() {
    var width = _widthDevice - (16 * 2);
    return width;
  }

  static double getCHeight() {
    return getCWidth() * 0.32;
  }

  /// D Card
  static double getDWidth() {
    var width = _widthDevice - (16 * 2);
    return width;
  }

  static double getDHeight() {
    return getDWidth() * 0.4;
  }

  /// B1S Card
  static double getB1SWidth() {
    var width = (_widthDevice - (16 * 2)) * 0.31;
    return width;
  }

  static double getB1SHeight() {
    return getB1SWidth() * 1.2;
  }

  /// B1L Card
  static double getB1LWidth() {
    var width = _widthDevice - (16 * 2);
    return width;
  }

  static double getB1LHeight() {
    return getB1SHeight();
  }

  /// mg
  static double mg() {
    var mg = (getB1LWidth() - (3 * getB1SWidth())) / 2;
    return mg;
  }

  /// C1 Card
  static double getC1Width() {
    var width = _widthDevice - (8 * 2);
    return width;
  }

  static double getC1Height() {
    return getC1Width() * 1.6;
  }

  /// * A1 Card

  static double getA1Width() {
    var width = (_widthDevice - 16 * 3) / 3;
    return width;
  }

  static double getA1Height() {
    return getA1Width();
  }

  /// * A2 Card

  static double getA2Width() {
    var width = (_widthDevice - (16 * 3)) / (2 / 3);
    return width;
  }

  static double getA2Height() {
    var height = getA2Width() / 2;
    return height;
  }

  /// * A3 Card

  static double getA3Width() {
    var width = _widthDevice - (16 * 2);
    return width;
  }

  static double getA3Height() {
    var height = getA3Width() * 0.32;
    return height;
  }

  /// B1 Card

  static double getB1Width() {
    var width = (_widthDevice - 16 * 2) * 0.31;
    return width;
  }

  static double getB1Height() {
    var height = getB1Width() * 1.2;
    return height;
  }

  /// B2 Card

  static double getB2Width() {
    var width = _widthDevice - (16 * 2);
    return width;
  }

  static double getB2Height() {
    var height = getB1Width();
    return height;
  }

  /// D1 Card
  static double getD1Width() {
    var width = _widthDevice - (16 * 2);
    return width;
  }

  static double getD1Height() {
    var height = getD1Width() * 0.4;
    return height;
  }
}
