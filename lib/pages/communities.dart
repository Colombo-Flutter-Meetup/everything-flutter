import 'package:everything_flutter/widgets/title_bar.dart';
import 'package:flutter/material.dart';

// TODO : Improve this page 
class CommunitesPage extends StatelessWidget {
  const CommunitesPage({Key key}) : super(key: key);
  static const route = "/communities";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TitleBar(title: "Communities"),
        ],
      ),
    );
  }
}
