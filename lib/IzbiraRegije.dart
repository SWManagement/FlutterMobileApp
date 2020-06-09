import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> _getRegijaFromSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String regija = prefs.getString("izbranaRegija");
    if (regija == null){
      Constants.constRegija = Constants.regije[0];
      return Constants.regije[0];
    }else{
      Constants.constRegija = regija;
      return regija;
    }
}

Future<void> _spremembaRegije(String regija) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("izbranaRegija", regija);
    Constants.constRegija = regija;
}

class izbiraRegije extends StatefulWidget {
  @override
  _izbiraRegijeState createState() => _izbiraRegijeState();
}


class _izbiraRegijeState extends State<izbiraRegije> {
  int _group = 1;
  String _izbranaRegija = "";

  @override
  void initState() { 
    super.initState();
    _displayRegija();
  }

  Future<void> _displayRegija() async {
    String regija = await _getRegijaFromSharedPrefs();
    setState(() {
      _izbranaRegija = regija;
   });
  }

  // TODO -> da se označi gumbek
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Izbira regije") ,
        ),
        body: 
        ListView(
          padding: EdgeInsets.all(12.0),
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
                "Izbira: $_izbranaRegija",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
                  ),
                ),
              ),
            RadioListTile(
                title: Text("Osrednjeslovenska"),
                value: Constants.regije[0],
                groupValue: _group,
                activeColor: Colors.greenAccent,
                onChanged: (T){
                  setState(() {
                    _spremembaRegije(T);
                    _displayRegija();
                  });
                },
              ),
                RadioListTile(
                title: Text("Dolenjska"),
                value: Constants.regije[1],
                groupValue: _group,
                activeColor: Colors.greenAccent,
                onChanged: (T){
                  setState(() {
                    _spremembaRegije(T);
                    _displayRegija();
                  });
                },
              ),
                RadioListTile(
                title: Text("Gorenjska"),
                value: Constants.regije[2],
                groupValue: _group,
                activeColor: Colors.greenAccent,
                onChanged: (T){
                  setState(() {
                    _spremembaRegije(T);
                    _displayRegija();
                  });
                },
              ),
                RadioListTile(
                title: Text("Štajerska"),
                value: Constants.regije[3],
                groupValue: _group,
                activeColor: Colors.greenAccent,
                onChanged: (T){
                  setState(() {
                    _spremembaRegije(T);
                    _displayRegija();
                  });
                },
              ),
                RadioListTile(
                title: Text("Primorska"),
                value: Constants.regije[4],
                groupValue: _group,
                activeColor: Colors.greenAccent,
                onChanged: (T){
                  setState(() {
                    _spremembaRegije(T);
                    _displayRegija();
                  });
                },
              )
          ],
        )
    );
  }
}