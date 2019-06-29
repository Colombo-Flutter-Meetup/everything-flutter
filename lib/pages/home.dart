import 'package:carousel_slider/carousel_slider.dart';
import 'package:everything_flutter/helpers/app_colors.dart';
import 'package:everything_flutter/helpers/graphql_queries.dart';
import 'package:everything_flutter/helpers/utils.dart';
import 'package:everything_flutter/models/graphql_response.dart';
import 'package:everything_flutter/models/news.dart';
import 'package:everything_flutter/widgets/home_menu_item.dart';
import 'package:everything_flutter/widgets/menu_item.dart';
import 'package:everything_flutter/widgets/news_item.dart';
import 'package:everything_flutter/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

// TODO : Improve this page
class HomePage extends StatefulWidget {
  static const route = "/cc";
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Function wp;
  Function hp;
  int _selectedPageNumber = 0;
  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: scaler.getHeight(11)),
            Container(
              width: scaler.getWidth(90),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    child: Text(
                      "Timeline",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.DART_BLUE,
                        fontSize: scaler.getTextSize(22),
                        height: 0.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 3.0, 10.0, 10.0),
                    child: Text(
                      "See stuff around you!",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                          fontSize: scaler.getTextSize(12),
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),

            // MenuItem(),
            CarouselSlider(
              height: scaler.getHeight(40),
              enlargeCenterPage: true,
              onPageChanged: (int pageNumber) {
                setState(() {
                  _selectedPageNumber = pageNumber;
                });
              },
              viewportFraction: MediaQuery.of(context).size.width / 600,
              initialPage: 0,
              enableInfiniteScroll: true,
              items: [
                HomeMenuItem(title: scaler.getHeight(40).toString()),
                HomeMenuItem(title: "Communities"),
                HomeMenuItem(title: "Tutorials"),
                HomeMenuItem(title: "Widgets"),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "News",
                textScaleFactor: wp(0.7),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Query(
              options: QueryOptions(document: GraphQLQueries.news),
              builder: (QueryResult result, {VoidCallback refetch}) {
                if (result.loading) {
                  return Container(
                    padding: EdgeInsets.all(50.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (result.data == null) {
                  return Center(child: Text("No Data Found !"));
                }

                GraphQLResponse graphQLResponse =
                    GraphQLResponse.fromMap(result.data);

                return _buildNewsColumn(graphQLResponse.news);
              },
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15.0),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.EXQUISITE_TURQUOISE,
                        AppColors.DART_BLUE,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    "View Previous News",
                    textScaleFactor: wp(0.35),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNewsColumn(List<News> newsList) {
    List<Widget> widgets = [];
    newsList.forEach(
      (News news) {
        widgets.add(
          NewsItem(
            title: news.title,
            source: news.source.name,
            time: news.time,
            image: news.image,
            link: news.link,
          ),
        );
      },
    );
    return Column(
      children: widgets,
    );
  }
}
// Stack(
//               children: <Widget>[
//                 Container(
//                   height: 90,
//                 ),
//                 Positioned(
//                   top: 20,
//                   left: 20,
//                   child: Text(
//                     "Timeline",
//                     textScaleFactor: wp(1),
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.DART_BLUE,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 62,
//                   left: 40,
//                   child: Text(
//                     "See stuff around you!",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
