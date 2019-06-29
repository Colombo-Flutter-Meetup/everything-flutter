import 'package:flutter/material.dart';

import '../pages/categories/communities.dart';
import '../pages/categories/events.dart';
import '../pages/categories/tutorials.dart';
import '../pages/categories/widgets.dart';
import '../pages/dashboard.dart';
import '../pages/login.dart';
import '../pages/splash.dart';

class RouteHandler {
  final Map<String, WidgetBuilder> routes = {
    SplashScreen.route: (BuildContext context) => SplashScreen(),
    DashboardPage.route: (BuildContext context) => DashboardPage(),
    LoginPage.route: (BuildContext context) => LoginPage(),
    EventsPage.route: (BuildContext context) => EventsPage(),
    CommunitesPage.route: (BuildContext context) => CommunitesPage(),
    TutorialsPage.route: (BuildContext context) => TutorialsPage(),
    WidgetsPage.route: (BuildContext context) => WidgetsPage(),
  };
}
