import 'package:flutter/material.dart';

class Navodila extends StatelessWidget {
  const Navodila({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navodila za uporabo"),
      ),
      body: Column(children: <Widget>[
        Text("Navodila")  // TODO -> navodila za uporabo
      ],),
    );
  }
}