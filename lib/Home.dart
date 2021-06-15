import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/CardCorso.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
     return ListView(
          children:<Widget> [
            Column(
              children:[
                Align(
                    alignment: Alignment.centerLeft,
                    child:Text("Popolari", style: TextStyle(fontSize: 24))
                ),
                Container(
                height:200.0,
                child:ListView(
                  scrollDirection: Axis.horizontal,
                  children: listPopolari(),
                  ),
                ),
              ],
            ),
            Column(
              children:[
                Align(
                    alignment: Alignment.centerLeft,
                    child:Text("Consigliati", style: TextStyle(fontSize: 24))
                ),
                Container(
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
                Align(
                    alignment: Alignment.centerLeft,
                    child:Text("Aggiunti di Recente", style: TextStyle(fontSize: 24))
                ),
                Container(
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
  return[
    CardCorso(),
    CardCorso(),
    CardCorso(),
    CardCorso(),
    CardCorso()
  ];
}
//Funzione che disegna i corsi popolari
List<Widget> listConsigliati(){
  return[
    CardCorso(),
    CardCorso(),
    CardCorso(),
    CardCorso(),
    CardCorso()
  ];
}
//Funzione che disegna i corsi popolari
List<Widget> listAggiuntiRecente(){
  return[
    CardCorso(),
    CardCorso(),
    CardCorso(),
    CardCorso(),
    CardCorso()
  ];
}


