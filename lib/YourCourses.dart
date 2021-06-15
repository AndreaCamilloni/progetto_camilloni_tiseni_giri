import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/CardCorso.dart';

import 'models/Corso.dart';

class YourCourses extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GridView.count(
        padding: EdgeInsets.all(20.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: (150 / 190),
        children: <Widget>[
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
          CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
        ]
    );
  }
}