import 'package:everything_flutter/widgets/rounded_rectangle_button.dart';
import 'package:everything_flutter/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class WidgetsPage extends StatelessWidget {
  static const route = "/widgets";
  WidgetsPage({Key key}) : super(key: key);

  final ScreenScaler _scaler = ScreenScaler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TitleBar(title: "Widgets"),
          Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image.network(
                        'https://iryanbell.com/static/385fb7423be9e5c34cb99dfdac479dce/9d7fc/flutter_app_bar.png',
                        height: _scaler.getHeight(30),
                        width: _scaler.getWidth(50),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "#WidgetOfTheDay",
                            style: TextStyle(
                              fontSize: _scaler.getTextSize(12),
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Positioned",
                            style: TextStyle(
                              fontSize: _scaler.getTextSize(15),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: _scaler.getHeight(2)),
                          RoundedRecntangleButton(title: 'Read More'),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(),
          Container(
            padding: EdgeInsets.fromLTRB(_scaler.getWidth(5.5), 2.5, 0.0, 1.0),
            alignment: Alignment.topLeft,
            child: Text(
              "Previous Widgets",
              style: TextStyle(
                fontSize: _scaler.getTextSize(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
