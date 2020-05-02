import "package:flutter/material.dart";
import 'package:pametno_z_odpadki/SkenirajLocuj.dart';
import 'package:pametno_z_odpadki/VpisiLocuj.dart';

class Modal{
  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _createTile(context, "Vpiši in ločuj", Icons.create, _vpisi),
            _createTile(context, "Skeniraj in ločuj", Icons.camera_enhance, _skeniraj)
            ],
          );
        }
      );
  }


  ListTile _createTile(BuildContext context, String name, IconData icon, Function action){
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: (){
        String where = action();
        if (where == "vpisi"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VpisiLocuj()));
        } else {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SkenirajLocuj()));
        }
      },
    );
  }

  _vpisi(){
    return "vpisi"; // TODO -> vpisi in locuj
  }

  _skeniraj(){
    return "skeniraj"; // TODO -> Skeniraj in locuj
  }
}