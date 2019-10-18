import 'package:everything_flutter/constants/strings.dart';
import 'package:everything_flutter/constants/text_styles.dart';
import 'package:everything_flutter/constants/theme_data.dart';
import 'package:everything_flutter/helpers/screen_util.dart';
import 'package:everything_flutter/ui/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:intl/intl.dart';
import 'package:snaplist/snaplist.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

@widget
Widget _buildBody() => SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _eventsTitle,
            _buildMenuCards(),
          ],
        ),
      ),
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
              child: Container(
                child: Column(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      eventCardTitles[index],
                      style: TextStyle(
                        fontSize: ScreenUtil.getTextSize(12),
                        fontWeight: FontWeight.w800,
                        color: AppColors.titleColors[index],
                      ),
                    ),
                    Text(
                      eventCardSubtitles[index],
                      style: TextStyle(
                        fontSize: ScreenUtil.getTextSize(10),
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: ScreenUtil.getHeight(0.5)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, menuCardTitles[index]),
                        child: Container(
                          padding: ScreenUtil.getPaddingAll(8),
                          decoration: BoxDecoration(
                            borderRadius:
                                ScreenUtil.getBorderRadiusCircular(12),
                            color: AppColors.buttonColors[index],
                            boxShadow: [
                              new BoxShadow(
                                color: AppColors.buttonColors[index],
                                blurRadius: 8.0,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: ScreenUtil.getTextSize(12),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

final _eventsTitle = Text(
  "Events",
  style: TextStyles.title,
);
