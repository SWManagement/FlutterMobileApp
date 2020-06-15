import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key key}) : super(key: key);


  final opis = """
Kam naj odložim odpadek, da bo njegov vpliv na okolje minimalen? Ga moram
odložiti v smetnjak za embalažo ali med mešane odpadke? Kako naj vem, kateri
odpadki spadajo med nevarne in jih moram odpeljati v zbirni center? S takšnimi
in podobnimi dilemami se ljudje vsakodnevno srečujemo, razlog pa leži v vedno
večjih količinah različnih odpadkov. Z razvojem tehnologije, gospodarsko rastjo in
pojavom množičnega potrošništva odpadki in pravilno ravnanje z njimi (p)ostajajo
eden glavnih izzivov človeštva na poti do lepšega jutri. 
Aplikacija »Kam spada?« rešuje prav zgoraj opisane dileme in negotovosti. Njen
namen je širši javnosti omogočiti hiter in enostaven dostop do čim večjega števila
podatkov in informacij o ločevanju in zbiranju odpadkov. S pomočjo aplikacije
lahko uporabnik skenira črtne kode izdelkov, za katere ni prepričan v kateri
smetnjak sodijo. Aplikacija mu na podlagi podatkov, ki se nahajajo v bazi, ponudi
pravilni odgovor. S tem pripomore k lažjemu, hitrejšemu in bolj učinkovitemu
ravnanju z odpadki. Aplikacija tudi razlikuje med različnimi slovenskimi regijami,
saj se tudi sami smetnjaki po Sloveniji med seboj razlikujejo.
Kar pa je število različnih odpadkov praktično neomejeno, aplikacija deluje po
principu   množičnega   izvajanja   (Crowdsourcing).   To   pomeni,   da   ima   vsak
uporabnik možnost v bazo dodati nov odpadek in ob tem definirati, kam ga je
potrebno   odložiti.   Na   ta   način   lahko   vsak   posameznik   pripomore   k   boljši
uporabnosti aplikacije in ob enem k lepšemu okolju. 
Aplikacija »Kam spada?«, ki se nahaja pred vami, je bila razvita v sklopu projekta
Smart  Waste   Management  v   okviru   razpisa  Študentski  inovativni  projekti  za
družbeno korist (ŠIPK). 
""";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("O aplikaciji"),
      ),
      body:
        SingleChildScrollView(
            child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text:TextSpan(
                text: opis,
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