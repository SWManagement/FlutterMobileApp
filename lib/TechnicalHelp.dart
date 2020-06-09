import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TechnicalHelp extends StatelessWidget {
  const TechnicalHelp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tehnična pomoč"),
      ),
      body: Column(children: <Widget>[
        Text("Tehnična pomoč") 
      ],),
    );

  }
}