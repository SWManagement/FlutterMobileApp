import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


final _formKey = GlobalKey<FormState>();

class Locevanje extends StatefulWidget {
  final int idx;
  Locevanje(this.idx);

  @override
  _Locevanje createState() => _Locevanje();
}

class _Locevanje extends State<Locevanje> {
  int _selectedIndex;
  @override
  void initState() { 
    super.initState();
    _selectedIndex = widget.idx;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Vpisi(),
    Text("skeniraj")
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ločevanje"),
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // render kar je označeno
      bottomNavigationBar:BottomNavigationBar(
        selectedFontSize: 18,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            title: Text("Vpiši")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_enhance),
            title: Text("Skeniraj")
          ),  
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      )
    );
  }
}

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
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Trenutno ločuješ v $_izbranaRegija regija",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                            fontSize: 18,
                            color: Colors.black
                            ),
                            ),
                        ),
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
        );
  }
}



