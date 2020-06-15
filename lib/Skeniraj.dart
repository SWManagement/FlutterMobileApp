import 'package:barcode_scan/barcode_scan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Skeniraj extends StatefulWidget {
    const Skeniraj({
    Key key,
  }) : super(key: key);
  @override
  _SkenirajState createState() => _SkenirajState();
}

class _SkenirajState extends State<Skeniraj> {
  String _scanBarcode = "Skeniraj izdelke in jih pravilno ločuj!";
  Constants constants = new Constants();
  String _izbranaRegija = "";

  @override
  void initState() { 
    super.initState();
    _izbranaRegija = Constants.constRegija;
  }

  void scan(BuildContext context) async {
  var result = await BarcodeScanner.scan();
  setState(() {
    _scanBarcode = "Nazadnje ste skenirali kodo " + result.rawContent;
  });
  createResultDialog(context, result.rawContent); 
}

  najdiOdpadek(String koda){
    return Firestore.instance.collection("Odpadki")
    .where("koda", isEqualTo: koda)
    .getDocuments();
  }

    addPoint() async{
    final prefs = await SharedPreferences.getInstance();
    final newCounter = (prefs.getInt("counter") ?? 0) + 1;
    prefs.setInt("counter", newCounter);
  }

  createResultDialog(BuildContext context, String koda){
    var query = najdiOdpadek(koda);
    String kanta;
    String barva;
    Color  color;
    query.then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty){
        kanta = docs.documents[0].data["kanta"];
        switch (kanta) {
          case "embalaža":
            barva = "yellow";
            color = Colors.yellow[300];
            break;
          case "BIO odpadki":
            barva = "brown";
            color = Colors.brown[300];
            break;
          case "papir":
            if (_izbranaRegija == "Osrednjeslovenska" || _izbranaRegija == "Gorenjska"){
              barva = "blue";
              color = Colors.blue[300];
            }else{
              barva = "red";
              color = Colors.red[300];
            }
            break;
          case "steklo":
          if (_izbranaRegija == "Osrednjeslovenska"){
            barva = "green";
            color = Colors.green[300];
          }else{
            barva = "white";
            color = Colors.white;
          }
          break;
          case "ostali odpadki":
            barva = "black";
            color = Colors.grey[300];
            break;
          case "zbirni center":
            barva = "zbirni";
            color = Colors.lime[300];
            break;
        }// end switch

        addPoint();

        return showDialog(context: context, builder: (context){
        return SimpleDialog(
        title: Text("Vaš odpadek sodi v:",
        textAlign: TextAlign.start,
        textScaleFactor: 1.2,),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height:  MediaQuery.of(context).size.height * 0.4,
            child: Image(image: AssetImage("assets/images/$barva.png"),),
            padding: EdgeInsets.all(20.0),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(kanta.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),),
            color: color,
            padding: EdgeInsets.all(20.0),
            )
        ],
      );
      });
      } else{
          return showDialog(context: context, builder: (context){
          return SimpleDialog(
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Odpadka žal ne poznam",
            textAlign: TextAlign.start,
            textScaleFactor: 1.2,),
          )
        );
      });
    }
  });        
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Text("Kam spada?",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36
                            ),
                        ),
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:12.0),
          child: 
          Text("$_scanBarcode",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
            )
          ),
        ),
      ),
      Center(child:
      Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        child: ButtonTheme(
          minWidth: constants.getButtonWidth(context),
          height: constants.getButtonHeight(),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0)),
          child: RaisedButton(
          onPressed: () => scan(context),
          child: Text("Skeniraj izdelek", style: TextStyle(color: Colors.white,
                          fontSize: 18))),
          ),
        )
      ),
    ],);
  }
}