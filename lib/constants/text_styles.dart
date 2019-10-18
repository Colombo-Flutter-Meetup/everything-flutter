import 'package:everything_flutter/constants/app_colors.dart';
import 'package:everything_flutter/constants/text_size.dart';
import 'package:everything_flutter/helpers/screen_util.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static final TextStyle title = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil.getTextSize(TextSize.title),
  );

  static final TextStyle miniTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil.getTextSize(TextSize.miniTitle),
  );

  static final TextStyle cardTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil.getTextSize(TextSize.cardTitle),
    );

  static final TextStyle subtitle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: ScreenUtil.getTextSize(TextSize.subtitle),
    color: Colors.black54,
  );

  static final TextStyle blueSubtitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil.getTextSize(TextSize.subtitle),
    color: AppColors.BLUE,
    );
}
