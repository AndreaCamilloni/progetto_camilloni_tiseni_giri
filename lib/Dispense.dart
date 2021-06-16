import 'package:flutter/material.dart';
import 'models/Corso.dart';
import 'models/Documento.dart';
import 'package:url_launcher/url_launcher.dart';

class Dispense extends StatefulWidget {
  final Corso corso;

  const Dispense(this.corso);

  _Dispense createState() => _Dispense();
}
class _Dispense extends State<Dispense>{

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: getDispense(widget.corso)
    );
  }

  List<Widget> getDispense(Corso corso){
    List<Widget> listaDispense = [];
    for(Documento doc in corso.dispense) {
      listaDispense.add(Card(
          child:ListTile(
            leading:Icon(Icons.insert_drive_file),
            title: Text(doc.titolo, style: TextStyle(fontSize: 14)),
            tileColor: Colors.white54,
            onTap:(){
                _launchURL(doc.url);
            }
          )
        )
      );
    }
    return listaDispense;
  }
  void _launchURL(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}