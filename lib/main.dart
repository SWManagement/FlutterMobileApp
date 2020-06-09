
import 'package:pametno_z_odpadki/AppInfo.dart';
import 'package:pametno_z_odpadki/IzbiraRegije.dart';
import 'package:pametno_z_odpadki/Locevanje.dart';
import 'package:pametno_z_odpadki/Navodila.dart';
import 'package:pametno_z_odpadki/Rastlina.dart';
import 'package:pametno_z_odpadki/TechnicalHelp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:pametno_z_odpadki/Constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pametno z odpadki',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TabViewController(),
    );
  }
}

class TabViewController extends StatefulWidget {
  @override
  _TabViewControllerState createState() => _TabViewControllerState();
}

class _TabViewControllerState extends State<TabViewController> with TickerProviderStateMixin {

  final List<Tab> myTopTabs = <Tab> [ 
    Tab(icon: Icon(Icons.nature_people),
        text: "Ločevanje",),
    Tab(icon: Icon(Icons.local_florist),
        text: "Moja rastlina",)
  ];


  int _selectedTab;
  TabController _tabController;
  @override
  void initState() { 
    super.initState();
    
    _selectedTab = 0;
    _tabController = TabController(vsync: this, length: myTopTabs.length);
  }

  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  void onTabTapped(int index){
    setState(() {
      _selectedTab = index;
    });
  }
  static List<Widget> _tabOptions = <Widget>[
    Locevanje(0),
    Rastlina(),
  ];



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
      onTap: (idx){
        print(idx);
        onTabTapped(idx);
        }
      )
      ),
      body: _tabOptions.elementAt(_selectedTab),
    );
}
}