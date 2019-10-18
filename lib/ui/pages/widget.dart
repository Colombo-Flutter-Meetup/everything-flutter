import 'package:everything_flutter/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:intl/intl.dart';

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

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
