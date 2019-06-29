import 'package:flutter/material.dart';

/* Used when the GraphQL response is null  */
// TODO : Improve this page 
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("No Data Found !"),
      ),
    );
  }
}
