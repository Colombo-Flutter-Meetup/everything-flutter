import 'package:carousel_slider/carousel_slider.dart';
import 'package:everything_flutter/helpers/app_colors.dart';
import 'package:everything_flutter/widgets/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  static const route = "/";

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ScreenScaler _scaler = new ScreenScaler();

  Widget _buildAppBar() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(
          _scaler.getWidth(5), _scaler.getHeight(5), 10, 10),
      child: Column(
        children: <Widget>[
          Text(
            "Timeline",
            style: TextStyle(
              fontSize: _scaler.getTextSize(22),
              fontWeight: FontWeight.bold,
              height: 0.2,
              color: AppColors.DART_BLUE,
            ),
          ),
          Text(
            "See stuff around you!",
            style: TextStyle(
              fontSize: _scaler.getTextSize(12.5),
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      height: _scaler.getHeight(40),
      viewportFraction: 0.7,
      initialPage: 0,
      enableInfiniteScroll: true,
      enlargeCenterPage: true,
      items: <Widget>[
        _buildMenuCard('Events',
            'https://ministrypass.com/wp-content/uploads/2016/10/Artistic-Fall-Events.jpg'),
        _buildMenuCard(
            'Tutorials', 'https://wirelesstrondheim.no/img/tutorial/intro.jpg'),
      ],
    );
  }

  Widget _buildMenuCard(String title, String imageURL) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: _scaler.getWidth(2.5),
      // ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: _scaler.getHeight(40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
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
            ),
            Positioned(
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
                    title,
                    style: TextStyle(
                      fontSize: _scaler.getTextSize(18),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: _scaler.getWidth(3),
              right: _scaler.getWidth(3),
              top: _scaler.getHeight(2),
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: _scaler.getTextSize(18),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNewsStand() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          alignment: Alignment.topLeft,
          child: Text(
            "News",
            style: TextStyle(
              fontSize: _scaler.getTextSize(18),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        NewsItem(
            title: 'Title',
            image:
                'https://ewscripps.brightspotcdn.com/dims4/default/8ad5707/2147483647/strip/true/crop/640x360+0+60/resize/1280x720!/quality/90/?url=https%3A%2F%2Fmediaassets.ktnv.com%2Fphoto%2F2016%2F11%2F22%2FBreaking_News_graphic_20120827002741_640_480_1441066805019_23462145_ver1.0_640_480_1479856203859_50224855_ver1.0_640_480.JPG',
            source: 'Source',
            time: 'Time',
            link: '')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _scaler..init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Status Bar Height
            Container(height: _scaler.getHeight(5)),
            _buildAppBar(),
            _buildCarouselSlider(),
            _buildNewsStand(),
          ],
        ),
      ),
    );
  }
}
