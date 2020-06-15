import 'package:flutter/material.dart';

class Navodila extends StatelessWidget {
  const Navodila({Key key}) : super(key: key);

  final navodila = 
  """
Na zavihku ločevanje imate dva načina, in sicer ločevanje z vpisovanjem ali skeniranje črtne kode izdelka. Med načinoma preskakujete preko spodnjih gumbov.
Na zavihku moja rastlina vsak uporabnik zbira točke in nadgrajuje svojo rastlino. Več kot uporabljaš aplikacijo lepša je tvoja rastlina.
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navodila za uporabo"),
      ),
      body:
        SingleChildScrollView(
            child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text:TextSpan(
                text: navodila,
                style: TextStyle(
                  textBaseline: TextBaseline.ideographic,
                  fontSize: 22,
                  color: Colors.black,
                  )
              ) ,),
            ),
          ),
        )
        
    );
  }
}