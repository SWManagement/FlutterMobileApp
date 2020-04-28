import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/Constants.dart';

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
        children: <Widget>[
          Text(
            "Body"
          )
        ],
      )
    ),
    );
  }

  void onChoiceAction(String choice){
    if (choice == Constants.Regija){
      print("Regija"); // -> funkcija za izbiro regije  TODO
    }
    else{
      print("Tehnicna pomoc"); // -> funkcija za Tehnično pomoč TODO
    }
  }
}

