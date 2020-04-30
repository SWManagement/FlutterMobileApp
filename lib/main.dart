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
              }, // TODO -> navodila za uporabo
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
                   (context) => oAplikaciji() ));
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



// onChoice za nastavitve na vrhu
  void onChoiceAction(String choice){
    if (choice == Constants.Regija){
      //navigate to izbira regije

    }
    else{
      print("Tehnicna pomoc"); //  TODO -> funkcija za Tehnično pomoč
    }
  }

}



class izbiraRegije extends StatefulWidget {
  @override
  _izbiraRegijeState createState() => _izbiraRegijeState();
}

class _izbiraRegijeState extends State<izbiraRegije> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Izbira regije") ,
        ),
        body: Column(
          children: <Widget>[
            Text("izberi")
          ],),  
    );
  }
}

class oAplikaciji extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("O aplikaciji"),
      ),
      body: Column(children: <Widget>[
        Text("o app")  // TODO -> O aplikaciji
      ],),
    );
  }
}


class Navodila extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Navodila za uporabo"),
      ),
      body: Column(children: <Widget>[
        Text("o app")  // TODO -> O aplikaciji
      ],),
    );
  }
}


