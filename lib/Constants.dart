class Constants{
  // Nastavitve
  static const String Regija = "Izbira Regije";
  static const String TehnicnaPomoc = "Kontaktiraj tehnično pomoč";
  // Regije
  static const String Osrednjeslovenska = "Osrednjeslovenska";
  static const String Dolenska = "Dolenska";
  static const String Gorenska = "Gorenska";
  static const String Stajerska = "Štajerska";
  static const String Primorska = "Primorska";

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