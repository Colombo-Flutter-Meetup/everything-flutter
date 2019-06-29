import 'package:everything_flutter/helpers/app_colors.dart';
import 'package:everything_flutter/pages/communities.dart';
import 'package:everything_flutter/pages/events.dart';
import 'package:everything_flutter/pages/tutorials.dart';
import 'package:everything_flutter/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class HomeMenuItem extends StatefulWidget {
  final String title;
  final String imageURL;
  HomeMenuItem({Key key, this.title, this.imageURL}) : super(key: key);

  _HomeMenuItemState createState() => _HomeMenuItemState();
}

class _HomeMenuItemState extends State<HomeMenuItem> {
  ScreenScaler _scaler = ScreenScaler();
  int _selectedIndex = 0;

  Widget _buildBackgroundImage() {
    return Container(
      height: _scaler.getHeight(40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          widget.imageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGradientEffect() {
    return Container(
      height: _scaler.getHeight(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppColors.BRACING_BLUE,
          ],
        ),
      ),
    );
  }

  Widget _buildViewAllButton() {
    return Positioned(
      left: _scaler.getWidth(5),
      right: _scaler.getWidth(5),
      bottom: _scaler.getHeight(2.5),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(_scaler.getWidth(2)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.TEAL,
              AppColors.DART_BLUE,
            ],
          ),
        ),
        child: Text(
          "View All",
          style: TextStyle(
            fontSize: _scaler.getTextSize(12),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBackground() {
    return Positioned(
      left: _scaler.getWidth(3),
      top: _scaler.getHeight(2),
      child: Opacity(
        opacity: 0.5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          padding: EdgeInsets.all(5.0),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: _scaler.getTextSize(18),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    Positioned(
      left: _scaler.getWidth(3),
      right: _scaler.getWidth(3),
      top: _scaler.getHeight(2),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: _scaler.getTextSize(18),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            _buildBackgroundImage(),
            _buildGradientEffect(),
            _buildTitleBackground(),
            _buildTitle(),
            _buildViewAllButton()
          ],
        ),
      ),
    );
  }

  //  switch (_selectedIndex) {
  //                   case 0:
  //                     Navigator.pushNamed(context, EventsPage.route);
  //                     break;
  //                   case 1:
  //                     Navigator.pushNamed(context, TutorialsPage.route);
  //                     break;
  //                   case 2:
  //                     Navigator.pushNamed(context, WidgetsPage.route);
  //                     break;
  //                   case 3:
  //                     Navigator.pushNamed(context, CommunitesPage.route);
  //                     break;
  //                 }
}
