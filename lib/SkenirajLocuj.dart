import 'package:flutter/material.dart';

class SkenirajLocuj extends StatefulWidget {
  @override
  _SkenirajLocujState createState() => _SkenirajLocujState();
}

class _SkenirajLocujState extends State<SkenirajLocuj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text("Skeniraj in ločuj")
        ,
      ),
      body: Center(
        child: 
        Text("Activity"),
        ),
    );
  }
}