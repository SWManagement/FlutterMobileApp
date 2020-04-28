import "package:flutter/material.dart";

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
        Navigator.pop(context);
        action();
      },
    );
  }

  _vpisi(){
    print("vpisi"); // TODO -> vpisi in locuj
  }

  _skeniraj(){
    print("Skeniraj"); // TODO -> Skeniraj in locuj
  }
}