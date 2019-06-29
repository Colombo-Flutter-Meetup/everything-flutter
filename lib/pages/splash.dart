import 'dart:async';
import 'dart:math';

import 'package:everything_flutter/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/animation/animated_background.dart';
import '../widgets/animation/animated_wave.dart';
import 'home.dart';

// TODO : Improve this page
class SplashScreen extends StatefulWidget {
  static const route = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimeout();
    ScreenScaler()..init(context);
  }

  Future handleTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    final isSignedIn = prefs.getBool('isSignedIn') ?? false;
    if (isSignedIn) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          DashboardPage.route, (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
          DashboardPage.route, (Route<dynamic> route) => false);
    }
  }

  startTimeout() async {
    var duration = const Duration(seconds: 4);
    return new Timer(duration, handleTimeout);
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: AnimatedBackground()),
          onBottom(AnimatedWave(
            height: 180,
            speed: 1.0,
          )),
          onBottom(AnimatedWave(
            height: 120,
            speed: 0.9,
            offset: pi,
          )),
          onBottom(AnimatedWave(
            height: 220,
            speed: 1.2,
            offset: pi / 2,
          )),
          Positioned.fill(
            child: CenteredText(),
          ),
        ],
      ),
    );
  }
}

class CenteredText extends StatelessWidget {
  const CenteredText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ),
        SizedBox(height: 35.0),
        Text("We're setting up things for you!",
            style: TextStyle(color: Colors.white), textScaleFactor: 1.5)
      ],
    );
  }
}
