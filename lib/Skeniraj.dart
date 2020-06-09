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
  String _scanBarcode = "Skeniraj izdeleke in jih pravilno ločuj!";
  Constants constants = new Constants();

  @override
  void initState() { 
    super.initState();
  }

  void main() async {
  var result = await BarcodeScanner.scan();
  setState(() {
    _scanBarcode = result.rawContent;
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
          onPressed: () => main(),
          child: Text("Skeniraj izdelek", style: TextStyle(color: Colors.white,
                          fontSize: 18))),
          ),
        )
      ),
    ],);
  }
}