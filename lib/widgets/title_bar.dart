import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

import '../helpers/app_colors.dart';

class TitleBar extends StatelessWidget {
  TitleBar({Key key, this.title}) : super(key: key);

  final String title;

  final ScreenScaler _scaler = ScreenScaler();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: _scaler.getHeight(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.EXQUISITE_TURQUOISE,
                AppColors.DART_BLUE,
              ],
            ),
          ),
        ),
        Positioned(
          top: 68,
          left: 20,
          child: Row(
            children: <Widget>[
              Text(
                title,
                textScaleFactor: 2.6,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
