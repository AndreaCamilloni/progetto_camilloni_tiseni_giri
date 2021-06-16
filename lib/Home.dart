import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/CardCorso.dart';
import 'package:progetto_camilloni_tiseni_giri/database_utils.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Utente.dart';

import 'models/Corso.dart';

class Home extends StatefulWidget{

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{
  List<Widget> popolari = [];
  List<Widget> consigliati = [];
  List<Widget> recenti = [];

  @override
  Widget build(BuildContext context){

      listPopolari().then((cardCorsi){
        setState(() {
          popolari = cardCorsi;
        });
      });
      listConsigliati().then((cardCorsi){
        setState(() {
          consigliati = cardCorsi;
        });
      });
      listAggiuntiRecente().then((cardCorsi){
        setState(() {
          recenti = cardCorsi;
        });
      });

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
                height:220.0,
                padding: EdgeInsets.only(top:10, left:10, bottom:10),
                  child:ListView(
                    scrollDirection: Axis.horizontal,
                    children: popolari,
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
                    children: consigliati,
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
                    children: recenti,
                  ),
                ),
              ],
            ),
          ],
        );
  }
}
//Funzione che disegna i corsi popolari
Future<List<Widget>> listPopolari() async {
  List<Widget> cardCorsi = [];
  List<Corso> corsi = await DatabaseUtils.getListaCorsi();
      for (Corso corso in corsi){
        cardCorsi.add(CardCorso(corso));
      }
  return cardCorsi;
}
//Funzione che disegna i corsi consigliati per l'utente in base alle categori preferite
Future<List<Widget>> listConsigliati() async {
    List<Widget> cardCorsi = [];
    Utente currUser = await DatabaseUtils.getUtenteLoggato();
    List<Corso> corsi = await DatabaseUtils.getListaCorsi();
    for (Corso corso in corsi){
      if(currUser.categoriePref.contains(corso.categoria)){
        cardCorsi.add(CardCorso(corso));
      }
    }
    return cardCorsi;
}
//Funzione che disegna i corsi aggiunti di recente
Future<List<Widget>> listAggiuntiRecente() async {
  List<Widget> cardCorsi = [];
  List<Corso> corsi = await DatabaseUtils.getListaCorsi();
  List<Corso> ultimiCinque = corsi.sublist(corsi.indexOf(corsi.last)-4,corsi.indexOf(corsi.last)+1);
  for (Corso corso in ultimiCinque){
    cardCorsi.add(CardCorso(corso));
  }
  return cardCorsi;
}


