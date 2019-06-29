import 'package:everything_flutter/widgets/title_bar.dart';
import 'package:flutter/material.dart';

// TODO : Work on this
class TutorialsPage extends StatelessWidget {
  const TutorialsPage({Key key}) : super(key: key);
  static const route = "/tutorials";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TitleBar(title: "Tutorials"),
        ],
      ),
    );
  }
}
