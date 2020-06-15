import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rastlina extends StatefulWidget {
  Rastlina({Key key}) : super(key: key);

  @override
  _RastlinaState createState() => _RastlinaState();
}

class _RastlinaState extends State<Rastlina> {

  int _userPoints;

  getUserPoints() async{
    final prefs = await SharedPreferences.getInstance();
    final newCounter = prefs.getInt("counter") ?? 0;
    setState(() {
      _userPoints = newCounter;
    });
  }

  // Future<String> getStopnja() async{
  //   String result;
  //     if (_userPoints < 3){
  //       result = "01.png";
  //     } else if(_userPoints >= 3 && _userPoints < 7){
  //       result = "02.png";
  //     } else if(_userPoints >= 7 && _userPoints < 15){
  //       result = "03.png";
  //     } else {
  //       result = "04.png";
  //     }
  //     return PATHTOROZA + result;
  // }


  void initState() { 
    super.initState();
    getUserPoints();
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
                    child: Image.asset("assets/images/roza01.png"),
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