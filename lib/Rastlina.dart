import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rastlina extends StatefulWidget {
  Rastlina({Key key}) : super(key: key);

  @override
  _RastlinaState createState() => _RastlinaState();
}

class _RastlinaState extends State<Rastlina> {

  int _userPoints;

  void initState() { 
    super.initState();
    _userPoints = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(    
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: <Widget>[
            Center(
              child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height:  MediaQuery.of(context).size.height * 0.4,
                    child: Image.asset("assets/images/roza04.png"),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Število ločenih odpadkov z pomočjo aplikacije",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$_userPoints",
              style: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.bold),
                )
            )
          ],
      ),
    );
  }
}