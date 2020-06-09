import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/Constants.dart';

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

  @override
  void initState() { 
    super.initState();
  }

  void scan(BuildContext context) async {
  var result = await BarcodeScanner.scan();
  setState(() {
    _scanBarcode = "Nazadnje ste skenirali kodo " + result.rawContent;
  });
  createResultDialog(context); 
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