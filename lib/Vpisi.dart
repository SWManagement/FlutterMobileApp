
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/Constants.dart';

final _formKey = GlobalKey<FormState>();

class Vpisi extends StatefulWidget {
  const Vpisi({
    Key key,
  }) : super(key: key);

  @override
  _VpisiState createState() => _VpisiState();
}



class _VpisiState extends State<Vpisi> {
  Constants constants = new Constants();
  String _izbranaRegija = "";
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _izbranaRegija = Constants.constRegija;
  }

    @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }


  najdiOdpadek(String odpadek){
    return Firestore.instance.collection("Odpadki")
    .where("odpadek", isEqualTo: odpadek)
    .getDocuments();
  }

  createResultDialog(BuildContext context, odpadek){
    var query = najdiOdpadek(odpadek);
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
        }

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
    return Center(
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Kam spada?",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: new TextFormField(
                            cursorColor:Colors.lightGreen,
                            textAlign: TextAlign.center,
                            controller: myController,
                            decoration: InputDecoration(hintText: "Vpiši ime izdelka ali odpadka."),
                            validator: (value){
                              if (value.isEmpty){
                                return "Prosim izpolnite polje.";
                              }else{
                                return null;
                              }
                            },
                             ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:25.0),
                          child: new ButtonTheme(
                              minWidth: constants.getButtonWidth(context),
                              height: constants.getButtonHeight(),
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0)),
                              child: RaisedButton(
                              onPressed: (){
                              if(_formKey.currentState.validate()){
                                createResultDialog(context, myController.text.toLowerCase().trim());
                              }
                            },
                              child: Text("Pokaži ustrezen zabojnik!", style: TextStyle(color: Colors.white,
                              fontSize: 18),),
                              ),
                          ),
                        )
                        ],
                      ),
                    ),
          ),
          ),
    );
  }
}