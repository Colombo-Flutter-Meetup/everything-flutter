import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

import '../helpers/app_colors.dart';
import '../helpers/graphql_queries.dart';
import '../helpers/service_locator.dart';
import '../scoped_model/dashboard.dart';
import '../widgets/home_menu_item.dart';

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
              imageURL: 'assets/images/dashboard_widgets_notch.png',
            ),
            HomeMenuItem(
              title: 'Tutorials',
              imageURL: 'assets/images/dashboard_widgets_notch.png',
            ),
            HomeMenuItem(
              title: 'Widgets',
              imageURL: 'assets/images/dashboard_widgets_notch.png',
            ),
            HomeMenuItem(
              title: 'Communities',
              imageURL: 'assets/images/dashboard_widgets_notch.png',
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "News",
                  style: TextStyle(
                    fontSize: _scaler.getTextSize(17),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    fontSize: _scaler.getTextSize(12),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            )),
        //     print(result.data);
        // GraphQLResponse data =
        //     GraphQLResponse.fromJson(json.encode(result.data));
        // print(data.news[0].title);
        // List<News> newsList = data.news;

        // List<NewsItem> newsStack = [];
        // newsList.forEach((News news) {
        //   newsStack.add(
        //     NewsItem(
        //       title: news.title,
        //       source: news.source.name,
        //       link: news.link,
        //       image: news.image,
        //     ),
        //   );
        // });
        // return Column(children: newsStack);

        Query(
            options: QueryOptions(document: GraphQLQueries.news),
            builder: (QueryResult result, {VoidCallback refetch}) {
              print(result.data);
              if (result.loading) {
                return Center(child: CircularProgressIndicator());
              }
              if (result.data == null) {
                return Center(child: Text("No Data Found !"));
              }
              return Container();
            }),
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
