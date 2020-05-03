
import 'package:pametno_z_odpadki/AppInfo.dart';
import 'package:pametno_z_odpadki/Navodila.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/Constants.dart';
import 'package:pametno_z_odpadki/Modal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pametno z odpadki',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget{
  final Modal modal = new Modal();
  final double _buttonW = 250.0;
  final double _buttonH = 65.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Pametno z odpadki"),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (result){
            if (result == Constants.Regija){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => izbiraRegije()));
            }else{
              //TODO -> tehnična pomoč
              print("Izbrali ste tehnično pomoč");
            }
          },
          itemBuilder: (BuildContext context){
            return Constants.choices.map((String choice){
              return PopupMenuItem<String> (
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        )
      ],
    ),
    body: new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height:  MediaQuery.of(context).size.height * 0.4,
            child: Image.asset("assets/images/logo.png"),
            ),
          ButtonTheme(
            minWidth: _buttonW,
            height: _buttonH,
            child: RaisedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                   (context) => Navodila() ));
              }, 
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text("Navodila za uporabo",
                style: TextStyle(fontSize: 18,
                color: Colors.white ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          ButtonTheme(
            minWidth: _buttonW,
            height: _buttonH,
            child: RaisedButton(
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                   (context) => AppInfo() ));
              } , 
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text("O aplikaciji",
                style: TextStyle(fontSize: 18,
                color: Colors.white ),
                ),
              ),
            ),
          ),
        ],
      )
    ),
    floatingActionButton: Container(
        height: 75.0,
        width: 90.0,
        child: FittedBox(
          child: FloatingActionButton( 
            onPressed: () => modal.mainBottomSheet(context),
            child: new Icon(Icons.restore_from_trash), 
          ),
        ),
      ),
    );
  }
}


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




