import 'dart:math';

import 'package:flutter/material.dart';

class ScreenUtil {
  static double _screenWidth;
  static double _screenHeight;

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
  }

  static const double _fixedWidth =
      410; // Set to an Aspect Ratio of 2:1 (height:width)
  static const double _fixedHeight =
      820; // Set to an Aspect Ratio of 2:1 (height:width)

  // Useful rounding method (solution -> https://stackoverflow.com/questions/28419255/how-do-you-round-a-double-in-dart-to-a-given-degree-of-precision-after-the-decim/53500405#53500405)
  static double roundToDecimals(double val, int decimalPlaces) {
    double mod = pow(10.0, decimalPlaces);
    return ((val * mod).round().toDouble() / mod);
  }

  static double getWidth(double width) {
    final int _decPlaces = 5;
    final double _fixedWidth = ScreenUtil._fixedWidth;

    _screenWidth =
        _screenWidth.floorToDouble(); // Extracts Device Screen maximum width.

    double _rsWidth = 0;
    if (_screenWidth == _fixedWidth) {
      // If input width matches fixedWidth then do normal scaling.
      _rsWidth = ScreenUtil.roundToDecimals(
          (_screenWidth * (width / 100)), _decPlaces);
    } else {
      // If input width !match fixedWidth then do adjustment factor scaling.
      double _scaleRatioWidth =
          ScreenUtil.roundToDecimals((_screenWidth / _fixedWidth), _decPlaces);
      double _scalerWidth =
          ((width + log(width + 1)) * pow(1, _scaleRatioWidth)) / 100;
      _rsWidth =
          ScreenUtil.roundToDecimals((_screenWidth * _scalerWidth), _decPlaces);
    }

    return _rsWidth;
  }

  static double getHeight(double height) {
    final int _decPlaces = 5;
    final double _fixedHeight = ScreenUtil._fixedHeight;

    _screenHeight =
        _screenHeight.floorToDouble(); // Extracts Device Screen maximum height.

    double _rsHeight = 0;
    if (_screenHeight == _fixedHeight) {
      // If input height matches fixedHeight then do normal scaling.
      _rsHeight = ScreenUtil.roundToDecimals(
          (_screenHeight * (height / 100)), _decPlaces);
    } else {
      // If input height !match fixedHeight then do adjustment factor scaling.
      double _scaleRatioHeight = ScreenUtil.roundToDecimals(
          (_screenHeight / _fixedHeight), _decPlaces);
      double _scalerHeight =
          ((height + log(height + 1)) * pow(1, _scaleRatioHeight)) / 100;
      _rsHeight = ScreenUtil.roundToDecimals(
          (_screenHeight * _scalerHeight), _decPlaces);
    }

    return _rsHeight;
  }

  static double getTextSize(double textSize) =>
      textSize / 100 * (getHeight(textSize) + getWidth(textSize));

  static double getFullScreen(double percent) =>
      percent / 100 * (getHeight(percent) + getWidth(percent));

  static EdgeInsetsGeometry getPadding(double height, double width) =>
      EdgeInsets.fromLTRB(getWidth(width), getHeight(height), getWidth(width),
          getHeight(height));

  static EdgeInsetsGeometry getPaddingLTRB(
          double left, double top, double right, double bottom) =>
      EdgeInsets.fromLTRB(
          getWidth(left), getHeight(top), getWidth(right), getHeight(bottom));

  static EdgeInsetsGeometry getPaddingAll(double all) =>
      EdgeInsets.all(getFullScreen(all));

  static BorderRadius getBorderRadiusCircular(double radius) =>
      BorderRadius.circular(getFullScreen(radius));
}
