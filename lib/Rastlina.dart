import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rastlina extends StatefulWidget {
  Rastlina({Key key}) : super(key: key);

  @override
  _RastlinaState createState() => _RastlinaState();
}

class _RastlinaState extends State<Rastlina> {
    void initState() { 
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("heloo"),),);
  }
}