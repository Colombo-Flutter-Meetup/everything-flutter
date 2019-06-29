import 'package:everything_flutter/widgets/title_bar.dart';
import 'package:flutter/material.dart';

// TODO : Improve this page 
class EventsPage extends StatelessWidget {
  const EventsPage({Key key}) : super(key: key);
  static const route = "/events";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TitleBar(title: "Events"),
        ],
      ),
    );
  }
}
