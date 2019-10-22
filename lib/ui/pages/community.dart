import 'package:everything_flutter/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:intl/intl.dart';
import 'package:everything_flutter/constants/test_data.dart';


class CommPage extends StatefulWidget {
  @override
  _CommPageState createState() => _CommPageState();
}

class _CommPageState extends State<CommPage> {



 

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
          
            //  _buildEvents(events)
          ],
        ),
      ),
    );



}



final _appBarTitle = Align(
  alignment: Alignment.centerRight,
  child: Text(
    "${DateFormat("MMM d, yyyy").format(DateTime.now())}",
    style: TextStyles.subtitle,
  ),
);

