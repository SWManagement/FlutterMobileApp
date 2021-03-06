import 'package:flutter/cupertino.dart';

class Constants{
  // Nastavitve
  static const String Regija = "Izbira Regije";
  static const String TehnicnaPomoc = "Kontaktiraj tehnično pomoč";
  // Regije
  static const String Osrednjeslovenska = "Osrednjeslovenska";
  static const String Dolenska = "Dolenjska";
  static const String Gorenska = "Gorenjska";
  static const String Stajerska = "Štajerska";
  static const String Primorska = "Primorska";
  // Izbrana regija
  static String constRegija = regije[0];

  // Button W & H

  double getButtonWidth(context){
    return MediaQuery.of(context).size.width * 0.7;
  }
  double getButtonHeight(){
    return 65.0;
  }

  static const List<String> regije = <String>[
    Osrednjeslovenska,
    Dolenska,
    Gorenska,
    Stajerska,
    Primorska
  ];

  static const List<String> choices = <String>[
    Regija,
    TehnicnaPomoc
  ];
}