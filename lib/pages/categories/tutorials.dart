import 'package:carousel_slider/carousel_slider.dart';
import 'package:everything_flutter/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

// TODO : Work on this
class TutorialsPage extends StatelessWidget {
  static const route = "/tutorials";
  TutorialsPage({Key key}) : super(key: key);

  final ScreenScaler _scaler = ScreenScaler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TitleBar(title: "Tutorials"),
          Container(
            padding: EdgeInsets.fromLTRB(
              _scaler.getWidth(5.5),
              _scaler.getHeight(1.5),
              _scaler.getWidth(0.0),
              _scaler.getHeight(1.5),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "For You",
              style: TextStyle(
                fontSize: _scaler.getTextSize(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CarouselSlider(
            viewportFraction: 0.5,
            autoPlay: true,
            initialPage: 0,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            items: <Widget>[
              Container(
                color: Colors.amber,
                height: _scaler.getHeight(25),
                width: _scaler.getWidth(50),
              ),
              Container(
                color: Colors.red,
                height: _scaler.getHeight(25),
                width: _scaler.getWidth(50),
              ),
              Container(
                color: Colors.blue,
                height: _scaler.getHeight(25),
                width: _scaler.getWidth(50),
              ),
            ],
          ),
          SizedBox(height: _scaler.getHeight(2)),
          Container(
            padding: EdgeInsets.fromLTRB(
              _scaler.getWidth(5.5),
              _scaler.getHeight(1.5),
              _scaler.getWidth(0.0),
              _scaler.getHeight(1.5),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "Latest Articles",
              style: TextStyle(
                fontSize: _scaler.getTextSize(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CarouselSlider(
            viewportFraction: 0.5,
            autoPlay: true,
            initialPage: 0,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            items: <Widget>[
              Container(
                color: Colors.amber,
                height: _scaler.getHeight(25),
                width: _scaler.getWidth(50),
              ),
              Container(
                color: Colors.red,
                height: _scaler.getHeight(25),
                width: _scaler.getWidth(50),
              ),
              Container(
                color: Colors.blue,
                height: _scaler.getHeight(25),
                width: _scaler.getWidth(50),
              ),
            ],
          )
        ],
      ),
    );
  }
}
