import 'package:everything_flutter/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class RoundedRecntangleButton extends StatelessWidget {
  final title;
  RoundedRecntangleButton({Key key, this.title}) : super(key: key);

  final ScreenScaler _scaler = ScreenScaler();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(_scaler.getHeight(1)),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: _scaler.getTextSize(11),
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.DART_BLUE,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
