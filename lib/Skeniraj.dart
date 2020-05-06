import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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

startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            "#ff6666", "Cancel", true, ScanMode.BARCODE)
        .listen((barcode){
          print(barcode);
        });
  }

Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("$_scanBarcode"),
      RaisedButton(
      onPressed: () => scanBarcodeNormal(),
      child: Text("Start barcode scan")),
      
      RaisedButton(onPressed: () => startBarcodeScanStream(), child: Text("Barcode stream"),),
    ],);
  }
}