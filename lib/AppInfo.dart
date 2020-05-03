import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("O aplikaciji"),
      ),
      body: Column(children: <Widget>[
        Text("o app")  // TODO -> O aplikaciji
      ],),
    );
  }
}