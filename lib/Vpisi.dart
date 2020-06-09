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
  @override
  void initState() {
    super.initState();
    _izbranaRegija = Constants.constRegija;
  }

  createResultDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: Text("Vaš odpadek sodi v:",
        textAlign: TextAlign.start,
        textScaleFactor: 1.2,),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height:  MediaQuery.of(context).size.height * 0.4,
            child: Image(image: AssetImage("assets/images/smetnjak_rumen.png"),),
            padding: EdgeInsets.all(20.0),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text("Embalažo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),),
            color: Colors.yellow[300],
            padding: EdgeInsets.all(20.0),
            )
        ],
      );
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
                                createResultDialog(context);
                              }
                            },
                              child: Text("Poišči ustrezen zabojnik!", style: TextStyle(color: Colors.white,
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