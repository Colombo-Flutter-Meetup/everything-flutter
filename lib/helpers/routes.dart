import 'package:everything_flutter/pages/communities.dart';
import 'package:everything_flutter/pages/events.dart';
import 'package:everything_flutter/pages/home.dart';
import 'package:everything_flutter/pages/login.dart';
import 'package:everything_flutter/pages/splash.dart';
import 'package:everything_flutter/pages/tutorials.dart';
import 'package:everything_flutter/pages/widgets.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  final Map<String, WidgetBuilder> routes = {
    SplashScreen.route: (BuildContext context) => SplashScreen(),
    HomePage.route: (BuildContext context) => HomePage(),
    LoginPage.route: (BuildContext context) => LoginPage(),
    EventsPage.route: (BuildContext context) => EventsPage(),
    CommunitesPage.route: (BuildContext context) => CommunitesPage(),
    TutorialsPage.route: (BuildContext context) => TutorialsPage(),
    WidgetsPage.route: (BuildContext context) => WidgetsPage(),
  };
}
