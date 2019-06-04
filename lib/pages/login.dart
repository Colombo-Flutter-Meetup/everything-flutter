import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const route = "/login";
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Login Page"),
      ),
    );
  }
}
