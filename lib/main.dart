import 'package:everything_flutter/helpers/routes.dart';
import 'package:everything_flutter/pages/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Everything Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.route,
      routes: RouteHandler().routes,
    );
  }
}
