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
  final double _buttonW = 300.0;
  final double _buttonH = 75.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Pametno z odpadki"),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: onChoiceAction,
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
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Body"
          ),
          SizedBox(height: 20),
          ButtonTheme(
            minWidth: _buttonW,
            height: _buttonH,
            child: RaisedButton(
              onPressed: (){},
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text("Navodila za uporabo",
                style: TextStyle(fontSize: 25,
                color: Colors.white ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ButtonTheme(
            minWidth: _buttonW,
            height: _buttonH,
            child: RaisedButton(
              onPressed: (){},
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text("O aplikaciji",
                style: TextStyle(fontSize: 25,
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

// onChoice za nastavitve na vrhu
  void onChoiceAction(String choice){
    if (choice == Constants.Regija){
      print("Regija"); // -> funkcija za izbiro regije  TODO
    }
    else{
      print("Tehnicna pomoc"); // -> funkcija za Tehnično pomoč TODO
    }
  }
}


