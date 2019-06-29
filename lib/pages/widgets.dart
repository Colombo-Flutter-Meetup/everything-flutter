import 'package:everything_flutter/widgets/title_bar.dart';
import 'package:flutter/material.dart';

// TODO : Work on this
class WidgetsPage extends StatelessWidget {
  const WidgetsPage({Key key}) : super(key: key);
  static const route = "/widgets";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TitleBar(title: "Widgets"),
        ],
      ),
    );
  }
}
