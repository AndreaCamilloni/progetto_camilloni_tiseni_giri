import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/CardCorso.dart';

import 'models/Corso.dart';

class Catalogo extends StatelessWidget{
  final TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return ListView.builder(
        padding: EdgeInsets.only(top:10, left:10, bottom:10),
        itemCount: 11,
        itemBuilder: (context,index) {
          if (index == 0) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: searchBarController,
                    decoration: InputDecoration(
                      labelText: 'Cerca',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child:Column(
                    children:[
                      Container(
                      height: 50,
                      child:ListView(
                          scrollDirection: Axis.horizontal,
                          children: listOfChips1()
                        ),
                      ),
                      Container(
                        height: 50,
                        child:ListView(
                            scrollDirection: Axis.horizontal,
                            children: listOfChips2()
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            );
          }
          return Column(
            children:[
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child:Text("Top in", style: TextStyle(fontSize: 24))
              ),
              Container(
                height:200.0,
                child:ListView(
                  scrollDirection: Axis.horizontal,
                  children: listAggiuntiRecente(),
                ),
              )
            ],
          );
        }
    );
  }
}

List<Widget> listCorsiCat(){
  List<Column> categorie = [];
  for(int i = 0; i < 10; i++){
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
    );
  }
  return categorie;
}

List<Widget> listOfChips1(){
    List<Widget> chips = [];
    for (int i = 0; i < 6; i++){
      chips.add(
        Padding(
          padding: const EdgeInsets.all(2.0),
          child:ActionChip(
            label: Text('Categoria'),
            onPressed: () {},
          ),
        ),
      );
    }
    return chips;
}
List<Widget> listOfChips2(){
  List<Widget> chips = [];
  for (int i = 0; i < 6; i++){
    chips.add(Padding(
      padding: const EdgeInsets.all(2.0),
      child:ActionChip(
        label: Text('Categoria'),
        onPressed: () {},
      ),
    ));
  }
  return chips;
}
List<Widget> listPopolari(){
  return[
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
  ];
}
//Funzione che disegna i corsi popolari
List<Widget> listConsigliati(){
  return[
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
  ];
}
//Funzione che disegna i corsi popolari
List<Widget> listAggiuntiRecente(){
  return[
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
    CardCorso(Corso(id:"", categoria: "", descrizione: "", dispense: [], immagine:"", lezioni: [], titolo: "")),
  ];
}