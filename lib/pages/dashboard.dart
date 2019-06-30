import 'package:carousel_slider/carousel_slider.dart';
import 'package:everything_flutter/helpers/graphql_queries.dart';
import 'package:everything_flutter/helpers/service_locator.dart';
import 'package:everything_flutter/models/graphql_response.dart';
import 'package:everything_flutter/models/news.dart';
import 'package:everything_flutter/scoped_model/dashboard.dart';
import 'package:everything_flutter/widgets/home_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
            HomeMenuItem(
              title: 'Widgets',
              imageURL: 'https://wirelesstrondheim.no/img/tutorial/intro.jpg',
            ),
            HomeMenuItem(
              title: 'Communities',
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
        Query(
          options: QueryOptions(document: GraphQLQueries.news),
          builder: (QueryResult result, {VoidCallback refetch}) {
            if (result.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (result.data == null) {
              return Center(child: Text("No Data Found !"));
            }
            print(result.data['news']);
            GraphQLResponse data = GraphQLResponse.fromMap(result.data);
            List<News> newsList = data.news;
            List<NewsItem> newsStack = [];
            newsList.forEach((News news) {
              newsStack.add(
                NewsItem(
                  title: news.title,
                  source: news.source.name,
                  link: news.link,
                  image: news.image,
                ),
              );
            });
            return Column(children: newsStack);
          },
        ),
        NewsItem(
          title: 'The 5 best macOS Catalina features',
          image: 'https://www.clickseed.com/wp-content/uploads/google-news.jpg',
          source: 'Twitter',
          time: '15 hours ago',
          link: 'https://flutter-news.com',
        ),
        NewsItem(
          title: 'The 5 best macOS Catalina features',
          image:
              'https://flutter-news.com/images/default-post-image-thumbnail.png',
          source: 'Twitter',
          time: '15 hours ago',
          link: 'https://flutter-news.com',
        ),
        NewsItem(
          title: 'The 5 best macOS Catalina features',
          image:
              'https://flutter-news.com/images/default-post-image-thumbnail.png',
          source: 'Twitter',
          time: '15 hours ago',
          link: 'https://flutter-news.com',
        )
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
