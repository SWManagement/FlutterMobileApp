import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/Skeniraj.dart';
import 'package:pametno_z_odpadki/Vpisi.dart';



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
    Skeniraj(),
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



