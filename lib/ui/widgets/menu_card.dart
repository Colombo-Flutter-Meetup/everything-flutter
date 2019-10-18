import 'package:everything_flutter/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final String imageAsset;
  final Color color;
  final Widget child;

  const MenuCard({
    Key key,
    this.height,
    this.width,
    this.imageAsset,
    this.color,
    this.child,
    this.borderRadius,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.hardLight,
          ),
        ),
//          boxShadow: [
//            new BoxShadow(
//              color: color,
//              blurRadius: 12.0,
//              spreadRadius: 2
//              ),
//          ]
      ),
      child: child,
    );
  }
}
