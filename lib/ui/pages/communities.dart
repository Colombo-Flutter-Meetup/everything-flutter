import 'package:everything_flutter/constants/text_styles.dart';
import 'package:everything_flutter/model/news.dart';
import 'package:everything_flutter/ui/widgets/communty_item.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:intl/intl.dart';
import 'package:everything_flutter/constants/test_data.dart';


class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {



 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      appBar: _buildAppBar(),
      body: _buildBody(),
      
    );
  }

  @widget
AppBar _buildAppBar() => AppBar(
      title: _appBarTitle,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      brightness: Brightness.light,
      // or use Brightness.dark
      backgroundColor: Colors.grey[50],
    );


  @widget
  Widget _buildBody() => SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _tutorialsTitle,
            _buildTutes(comm)
            //  _buildEvents(events)
          ],
        ),
      ),
    );



}


List<News> comm = [comm1,comm2,comm3];


final _tutorialsTitle = Text(
  "Communities",
  style: TextStyles.title,
  );


@widget
Widget _buildTutes(List<News> newsList) {
  List<Widget> _columnItems = [];
  for (var news in newsList) {
    _columnItems.add(CommItem(news));
//    _columnItems.add(Divider());
  }
  return Column(children: _columnItems);
}

final _appBarTitle = Align(
  alignment: Alignment.centerRight,
  child: Text(
    "${DateFormat("MMM d, yyyy").format(DateTime.now())}",
    style: TextStyles.subtitle,
  ),
);

