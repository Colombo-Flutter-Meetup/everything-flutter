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
import 'package:snaplist/snaplist_view.dart';

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: _buildBody(),
    );
  }


@widget
Widget _buildBody() => SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _widgetsTitle,
            _buildMenuCards(),
            _buildWidgetBar(),
            _buildWidgets(widgets)
          ],
        ),
      ),
    );


final _widgetsTitle = Text(
  "Widgets Of The Week",
  style: TextStyles.title,
);



@widget
  Widget _buildWidgetBar() => Padding(
    padding: ScreenUtil.getPaddingLTRB(4, 2, 4, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Previous Widgets",
          style: TextStyles.miniTitle,
          ),
        // GestureDetector(
        //   onTap : () {
        //     _scaffoldKey.currentState.openDrawer(); // CHANGE THIS LINE
        //   },
        //   child: Icon(
        //     Icons.more_vert,
        //     size: ScreenUtil.getFullScreen(12),
        //     ),
        //   ),
      ],
      ),
    );

List<News> widgets = [widget1, widget2];


@widget
Widget _buildWidgets(List<News> newsList) {
  List<Widget> _columnItems = [];
  for (var widget in newsList) {
    _columnItems.add(NewsItem(widget));
//    _columnItems.add(Divider());
  }
  return Column(children: _columnItems);
}

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: ScreenUtil.getPaddingAll(11),
                  child: Container(
                    padding: ScreenUtil.getPaddingAll(10),
                    decoration: BoxDecoration(
                      borderRadius: ScreenUtil.getBorderRadiusCircular(12),
                      color: Colors.white70,
                    ),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "#WidgetOfTheDay",
                              style: TextStyle(
                                fontSize: ScreenUtil.getTextSize(12),
                                fontWeight: FontWeight.w800,
                                color: AppColors.titleColors[index],
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              widgetDays[index],
                              style: TextStyle(
                                fontSize: ScreenUtil.getTextSize(13),
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //  SizedBox(height: ScreenUtil.getHeight(4)),
             Padding(
                  padding: ScreenUtil.getPaddingAll(11),
                  child: Container(
                    padding: ScreenUtil.getPaddingAll(10),
                    decoration: BoxDecoration(
                      borderRadius: ScreenUtil.getBorderRadiusCircular(12),
                      color: Colors.white70,
                    ),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widgetNames[index],
                            style: TextStyle(
                              fontSize: ScreenUtil.getTextSize(13),
                              fontWeight: FontWeight.w800,
                              color: AppColors.titleColors[index],
                            ),
                          ),
                          
                          SizedBox(height: ScreenUtil.getHeight(0.5)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, menuCardTitles[index]),
                                child: Container(
                                  padding: ScreenUtil.getPaddingAll(8),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        ScreenUtil.getBorderRadiusCircular(8),
                                    color: AppColors.buttonColors[index],
                                    boxShadow: [
                                      new BoxShadow(
                                        color: AppColors.buttonColors[index],
                                        blurRadius: 8.0,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text("View",style: TextStyle(fontSize: ScreenUtil.getTextSize(11)),),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: ScreenUtil.getTextSize(13),
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        count: 3,
        sizeProvider: (index, data) =>
            Size(ScreenUtil.getWidth(65), ScreenUtil.getHeight(35)),
        separatorProvider: (index, data) =>
            Size(ScreenUtil.getWidth(1), ScreenUtil.getHeight(5)),
      ),
    );
///////////////////////////////////////


  @widget
  AppBar myAppBar(BuildContext context) => AppBar(
        title: _appBarTitle,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey[50],
      );

  static final _appBarTitle = Align(
    alignment: Alignment.centerRight,
    child: Text(
      "${DateFormat("MMM d, yyyy").format(DateTime.now())}",
      style: TextStyles.subtitle,
    ),
  );
}
