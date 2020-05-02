import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class VpisiLocuj extends StatefulWidget {
  @override
  _VpisiLocujState createState() => _VpisiLocujState();
}

class _VpisiLocujState extends State<VpisiLocuj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vpiši in ločuj")
        ,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
                  child: Container(
            margin: new EdgeInsets.all(20.0),
            child: Padding(
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
                    child: TextFormField(
                    cursorColor:Colors.lightGreen,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Vpiši ime izdelka ali odpadka."),
                    validator: (value){
                      if (value.isEmpty){
                        return "Prosim vnesite izdelek";
                      }else{
                        return null;
                      }
                    },
                     ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:25.0),
                  child: ButtonTheme(
                      minWidth: 265.0,
                      height: 75.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      child: RaisedButton(
                      onPressed: (){
                      if(_formKey.currentState.validate()){
                        // TODO -> Process data 
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
        ),
    );
  }
}