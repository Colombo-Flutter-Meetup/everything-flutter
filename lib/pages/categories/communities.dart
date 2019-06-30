import 'package:everything_flutter/helpers/app_colors.dart';
import 'package:everything_flutter/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

// TODO : Improve this page
class CommunitesPage extends StatelessWidget {
  static const route = "/communities";
  CommunitesPage({Key key}) : super(key: key);

  Widget _buildCommunityCard(
      String imageURL, String title, String description) {
    return Card(
      margin: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            FlutterLogo(
              size: 70.0,
            ),
            SizedBox(height: _scaler.getHeight(0.5)),
            Text(
              "Colombo Flutter Community",
              style: TextStyle(
                fontSize: _scaler.getTextSize(12.5),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: _scaler.getHeight(1)),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "About us",
                style: TextStyle(
                  fontSize: _scaler.getTextSize(10.5),
                  fontWeight: FontWeight.bold,
                  color: AppColors.DART_BLUE,
                ),
              ),
            ),
            Text(
              'Colombo Flutter Community is determined to promote the use of Flutter throughout Sri Lanka as it is the future for mobile application development.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: _scaler.getTextSize(10),
              ),
            ),
            SizedBox(height: _scaler.getHeight(1)),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Reach Us!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: AppColors.DART_BLUE,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  final ScreenScaler _scaler = ScreenScaler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TitleBar(title: "Communities"),
          SizedBox(height: _scaler.getHeight(2)),
          Text(
            "Reach our developer community!",
            style: TextStyle(
              fontSize: _scaler.getTextSize(12),
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildCommunityCard('imageURL', 'title', 'description')
        ],
      ),
    );
  }
}
