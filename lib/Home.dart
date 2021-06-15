import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/CardCorso.dart';
import 'package:progetto_camilloni_tiseni_giri/database_utils.dart';

import 'models/Corso.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context){
     return ListView(
          children:<Widget> [
            Column(
              children:[
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child:Text("Popolari", style: TextStyle(fontSize: 24))
                ),
                Container(
                height:200.0,
                padding: EdgeInsets.only(top:10, left:10, bottom:10),
                  child:ListView(
                    scrollDirection: Axis.horizontal,
                    children: listPopolari(),
                  ),
                ),
              ],
            ),
            Column(
              children:[
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child:Text("Consigliati", style: TextStyle(fontSize: 24))
                ),
                Container(
                  padding: EdgeInsets.only(top:10, left:10, bottom:10),
                  height:200.0,
                  child:ListView(
                    scrollDirection: Axis.horizontal,
                    children: listConsigliati(),
                  ),
                ),
              ],
            ),
            Column(
              children:[
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child:Text("Aggiunti di Recente", style: TextStyle(fontSize: 24))
                ),
                Container(
                  padding: EdgeInsets.only(top:10, left:10, bottom:10),
                  height:200.0,
                  child:ListView(
                    scrollDirection: Axis.horizontal,
                    children: listAggiuntiRecente(),
                  ),
                ),
              ],
            ),
          ],
        );
  }
}
//Funzione che disegna i corsi popolari
List<Widget> listPopolari(){
  List<CardCorso> cardCorsi = [];
  DatabaseUtils.getListaCorsi().then((corsi){
      for (Corso corso in corsi){
        cardCorsi.add(CardCorso(corso));
      }
  });
  return cardCorsi;
  return[
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
  ];
}
//Funzione che disegna i corsi consigliati per l'utente in base alle categori preferite
List<Widget> listConsigliati(){
  return[
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
  ];
}
//Funzione che disegna i corsi aggiunti di recente
List<Widget> listAggiuntiRecente(){
  return[
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
  ];
}


