import 'package:everything_flutter/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class MenuItem extends StatelessWidget {
  Function wp;
  Function hp;
  MenuItem({Key key}) : super(key: key);

  Widget _buildItem(String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.TEAL,
                AppColors.DART_BLUE,
              ],
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 8.0),
          width: wp(42),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10.0),
            child: Text(
              title,
              textScaleFactor: wp(0.4),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
    return Container(
      width: wp(90),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildItem("Events"),
              _buildItem("Communities"),
            ],
          ),
          SizedBox(height: hp(1.5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildItem("Widgets"),
              _buildItem("Tutorials"),
            ],
          ),
        ],
      ),
    );
  }
}
