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
  String _izbranaRegija = "";
  @override
  void initState() {
    super.initState();
    _izbranaRegija = Constants.constRegija;
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              minWidth: 265.0,
                              height: 75.0,
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0)),
                              child: RaisedButton(
                              onPressed: (){
                              if(_formKey.currentState.validate()){
                                Scaffold
                                .of(context)
                                .showSnackBar(SnackBar(content: Text("Iščem zabojnik!")));
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