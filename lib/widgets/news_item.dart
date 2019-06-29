import 'package:everything_flutter/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class NewsItem extends StatelessWidget {
  final title;
  final source;
  final time;
  final link;
  final image;
  NewsItem({Key key, this.title, this.source, this.time, this.link, this.image})
      : super(key: key);

  final ScreenScaler _scaler = ScreenScaler();

  Widget _buildViewAllButton() {
    return Container(
      padding: EdgeInsets.all(_scaler.getHeight(1)),
      child: Text(
        'View All',
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
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: _scaler.getTextSize(15),
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
        _buildViewAllButton(),
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: Text(
            '15 hours ago',
            style: TextStyle(
              fontSize: _scaler.getTextSize(11),
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
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.amber,
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
