import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:everything_flutter/helpers/app_colors.dart';

class TitleBar extends StatelessWidget {
  final String title;

  TitleBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function wp = Screen(MediaQuery.of(context).size).wp;

    Function hp = Screen(MediaQuery.of(context).size).hp;
    return Stack(
      children: <Widget>[
        Container(
          height: hp(18),
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
