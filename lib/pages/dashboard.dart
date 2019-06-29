import 'package:carousel_slider/carousel_slider.dart';
import 'package:everything_flutter/helpers/service_locator.dart';
import 'package:everything_flutter/scoped_model/dashboard.dart';
import 'package:everything_flutter/widgets/home_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:scoped_model/scoped_model.dart';

import '../helpers/app_colors.dart';
import '../widgets/news_item.dart';

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
    return ScopedModelDescendant<DashboardModel>(
      builder: (context, child, model) {
        return CarouselSlider(
          height: _scaler.getHeight(40),
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          onPageChanged: (int index) => model.setSelectedPageIndex(index),
          items: <Widget>[
            HomeMenuItem(
              title: 'Events',
              imageURL:
                  'https://ministrypass.com/wp-content/uploads/2016/10/Artistic-Fall-Events.jpg',
            ),
            HomeMenuItem(
              title: 'Tutorials',
              imageURL: 'https://wirelesstrondheim.no/img/tutorial/intro.jpg',
            ),
          ],
        );
      },
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

    return ScopedModel<DashboardModel>(
      model: locator<DashboardModel>(),
      child: Scaffold(
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
      ),
    );
  }
}
