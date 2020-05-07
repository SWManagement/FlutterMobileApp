import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pametno_z_odpadki/main.dart';


class Skeniraj extends StatefulWidget {
    const Skeniraj({
    Key key,
  }) : super(key: key);
  @override
  _SkenirajState createState() => _SkenirajState();
}

class _SkenirajState extends State<Skeniraj> {
  String _scanBarcode = "Unknown";

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
    return Column(children: <Widget>[
      Text("$_scanBarcode"),
      RaisedButton(
      onPressed: () => main(),
      child: Text("Start barcode scan")),
    ],);
  }
}