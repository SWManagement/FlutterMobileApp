import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/AppInfo.dart';
import 'package:pametno_z_odpadki/Constants.dart';
import 'package:pametno_z_odpadki/Navodila.dart';
import 'package:pametno_z_odpadki/Skeniraj.dart';
import 'package:pametno_z_odpadki/TechnicalHelp.dart';
import 'package:pametno_z_odpadki/Vpisi.dart';
import 'package:pametno_z_odpadki/main.dart';



final _formKey = GlobalKey<FormState>();

class Locevanje extends StatefulWidget {
  final int idx;
  Locevanje(this.idx);

  @override
  _Locevanje createState() => _Locevanje();
}

class _Locevanje extends State<Locevanje> with TickerProviderStateMixin{

  final List<Tab> myTopTabs = <Tab> [ 
    Tab(icon: Icon(Icons.nature_people),
        text: "Ločevanje",),
    Tab(icon: Icon(Icons.local_florist),
        text: "Moja rastlina",)
  ];

  TabController _tabController;
  int _selectedIndex;

  @override
  void initState() { 
    super.initState();
    _selectedIndex = widget.idx;
    _tabController = TabController(vsync: this, length: myTopTabs.length);
  }

  void dispose(){
    _tabController.dispose();
    super.dispose();
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
      appBar:AppBar(
      title: Text("Pametno z odpadki"),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected:  (result){
            if (result == Constants.Regija){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => izbiraRegije()));
            }else if(result == Constants.NavodilaZaUporabo){
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => Navodila()));
            }else if(result == Constants.OAplikaciji){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => AppInfo()));
            }else{
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => TechnicalHelp()));
            }
          },
          itemBuilder: (BuildContext context){
            return Constants.choices.map((String choice){
              return PopupMenuItem<String> (
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        )
      ],
      bottom: TabBar(
      controller: _tabController,
      tabs: myTopTabs,
      ),
     ),
      body:
      _widgetOptions.elementAt(_selectedIndex), // render kar je označeno,
      bottomNavigationBar: BottomNavigationBar(
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



