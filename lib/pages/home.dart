import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Function wp;
  Function hp;
  @override
  Widget build(BuildContext context) {
    wp = Screen(MediaQuery.of(context).size).wp;
    hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      appBar: AppBar(
        title: Text("To Be Removed"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "Main Page",
          )
        ],
      ),
    );
  }
}
