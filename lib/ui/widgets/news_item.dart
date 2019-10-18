import 'package:everything_flutter/constants/text_styles.dart';
import 'package:everything_flutter/helpers/screen_util.dart';
import 'package:everything_flutter/helpers/utils.dart';
import 'package:everything_flutter/model/news.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final News _news;
  
  NewsItem(this._news);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.launchURL(_news.link);
      },
      child: Padding(
        padding: ScreenUtil.getPaddingAll(8.0),
        child: Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: ScreenUtil.getPaddingAll(5),
                child: ClipRRect(
                  borderRadius: ScreenUtil.getBorderRadiusCircular(10.0),
                  child: Image.network(
                    _news.image,
                    height: ScreenUtil.getHeight(13),
                    width: ScreenUtil.getWidth(25),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: ScreenUtil.getHeight(14),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_news.title,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.cardTitle),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              _news.source.name.toUpperCase(),
                              style: TextStyles.blueSubtitle,
                            ),
                            Text(
                              timeago.format(_news.time),
                              style: TextStyles.subtitle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
