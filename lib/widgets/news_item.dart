import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

import 'rounded_rectangle_button.dart';

class NewsItem extends StatelessWidget {
  NewsItem({Key key, this.title, this.source, this.time, this.link, this.image})
      : super(key: key);

  final image;
  final link;
  final source;
  final time;
  final title;

  final ScreenScaler _scaler = ScreenScaler();

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            source,
            style: TextStyle(
              fontSize: _scaler.getTextSize(10),
              color: Colors.grey,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: _scaler.getTextSize(13),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomItems() {
    return Row(
      children: <Widget>[
        RoundedRecntangleButton(title: 'View More'),
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: Text(
            time,
            style: TextStyle(
              fontSize: _scaler.getTextSize(11),
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Expanded(
      flex: 5,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: _scaler.getHeight(15),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewsInfo() {
    return Expanded(
      flex: 7,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildTitle(),
            _buildBottomItems(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: _scaler.getHeight(18),
        width: _scaler.getWidth(90),
        child: Row(
          children: <Widget>[
            _buildNewsInfo(),
            SizedBox(width: _scaler.getWidth(2)),
            _buildImage(),
          ],
        ),
      ),
    );
  }
}
