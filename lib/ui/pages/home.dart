import 'package:everything_flutter/constants/app_colors.dart';
import 'package:everything_flutter/constants/strings.dart';
import 'package:everything_flutter/constants/test_data.dart';
import 'package:everything_flutter/constants/theme_data.dart';
import 'package:everything_flutter/helpers/screen_util.dart';
import 'package:everything_flutter/model/news.dart';
import 'package:everything_flutter/ui/widgets/menu_card.dart';
import 'package:everything_flutter/ui/widgets/news_item.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:intl/intl.dart';
import 'package:snaplist/snaplist.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE
  
  @override
  void initState() {
//    model.dispose(FetchNewsData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    ScreenUtil()..init(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      body: _buildBody(),
      drawer: _buildDrawer(),
    );
  }


  @widget
  Widget _buildBody() => SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _timelineTitle,
          _buildMenuCards(),
          _buildNewsFeedBar(),
          _buildNewsStand(news)
        ],
        ),
      ),
    );
  
  @widget
  Widget _buildNewsFeedBar() => Padding(
    padding: ScreenUtil.getPaddingLTRB(4, 2, 4, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Your News Feed",
          style: TextStyles.miniTitle,
          ),
        GestureDetector(
          onTap : () {
            _scaffoldKey.currentState.openDrawer(); // CHANGE THIS LINE
          },
          child: Icon(
            Icons.more_vert,
            size: ScreenUtil.getFullScreen(12),
            ),
          ),
      ],
      ),
    );
}

List<News> news = [newsItem, newsItemTwo];


final _timelineTitle = Text(
  "Your Timeline",
  style: TextStyles.title,
  );


@widget
Container _buildMenuCards() => Container(
      height: ScreenUtil.getHeight(35),
      width: double.infinity,
      child: SnapList(
        builder: (context, index, data) => MenuCard(
          height: ScreenUtil.getHeight(40),
          width: ScreenUtil.getWidth(65),
          margin: ScreenUtil.getPaddingLTRB(2, 1, 0, 0),
          borderRadius: ScreenUtil.getBorderRadiusCircular(12),
          imageAsset: imageAssets[index],
          color: AppColors.pastelColors[index],
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: ScreenUtil.getPaddingAll(10),
              decoration: BoxDecoration(
                borderRadius: ScreenUtil.getBorderRadiusCircular(12),
                color: Colors.white70,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    menuCardTitles[index],
                    style: TextStyle(
                      fontSize: ScreenUtil.getTextSize(13),
                      fontWeight: FontWeight.w800,
                      color: AppColors.titleColors[index],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, menuCardTitles[index]),
                    child: Container(
                      padding: ScreenUtil.getPaddingAll(8),
                      decoration: BoxDecoration(
                          borderRadius: ScreenUtil.getBorderRadiusCircular(12),
                          color: AppColors.buttonColors[index],
                          boxShadow: [
                            new BoxShadow(
                              color: AppColors.buttonColors[index],
                              blurRadius: 8.0,
                            ),
                          ]),
                      child: Icon(Icons.arrow_forward_ios,
                          size: ScreenUtil.getTextSize(13),
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        count: 4,
        sizeProvider: (index, data) =>
            Size(ScreenUtil.getWidth(65), ScreenUtil.getHeight(35)),
        separatorProvider: (index, data) =>
            Size(ScreenUtil.getWidth(1), ScreenUtil.getHeight(5)),
      ),
    );

@widget
Drawer _buildDrawer() => Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Custom Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('First layout'),
          ),
          ListTile(
            title: Text('Communicate'),
            //without leading =)
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share layout'),
          )
        ],
      ),
    );

@widget
AppBar _buildAppBar() => AppBar(
      title: _appBarTitle,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      brightness: Brightness.light,
      // or use Brightness.dark
      backgroundColor: Colors.grey[50],
    );

final _appBarTitle = Align(
  alignment: Alignment.centerRight,
  child: Text(
    "${DateFormat("MMM d, yyyy").format(DateTime.now())}",
    style: TextStyles.subtitle,
  ),
);

@widget
Widget _buildNewsStand(List<News> newsList) {
  List<Widget> _columnItems = [];
  for (var news in newsList) {
    _columnItems.add(NewsItem(news));
//    _columnItems.add(Divider());
  }
  return Column(children: _columnItems);
}

Widget _getInformationMessage(String message) {
  return Center(
    child: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
    ),
  );
}

//              StreamBuilder(
//                stream: model.homeState,
//                builder: (context, snapshot) {
//                  if (snapshot.hasError) {
//                    return _getInformationMessage(snapshot.error.toString());
//                  }
//
//                  var homeState = snapshot.data;
//
//                  if (!snapshot.hasData || homeState is BusyHomeState) {
//                    return Center(child: CircularProgressIndicator());
//                  }
//
//                  if (homeState is NewsFetchedHomeState) {
//                    if (!homeState.hasData) {
//                      return _getInformationMessage(
//                          'No data found! Please try again!');
//                    }
//                  }
//
//                  return _buildNewsStand(homeState.data);
//                },
//              )
