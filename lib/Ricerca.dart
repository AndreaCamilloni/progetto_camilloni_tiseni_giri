import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/CardCorso.dart';
import 'package:progetto_camilloni_tiseni_giri/database_utils.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Utente.dart';

import 'models/Corso.dart';

class Ricerca extends StatefulWidget{
  final String query;
  const Ricerca(this.query);
  _Ricerca createState() => _Ricerca();
}

class _Ricerca extends State<Ricerca>{

  List<Widget> corsiSearch = [];

  @override
  void initState() {
    super.initState();
    drawSearch(widget.query).then((cardsSearch){
      setState(() {
        corsiSearch = cardsSearch;
      });
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.query),
          leading: IconButton(icon: Icon(Icons.arrow_back_outlined),
              onPressed: (){
                Navigator.pop(context);
              }),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Condividi', 'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body:GridView.count(
                padding: EdgeInsets.all(20.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: (150 / 190),
                children: corsiSearch
        )
    );
  }
}

Future<List<Widget>> drawSearch(String query) async {
  List<Widget> cardSearch = [];
  List<Corso> corsi = await DatabaseUtils.getListaCorsi();
  for(var corso in corsi){
    if(corso.descrizione.contains(query) || corso.categoria.contains(query) || corso.titolo.contains(query)) {
      cardSearch.add(CardCorso(corso));
    }
  }
  return cardSearch;
}

//funzione che regola il menu nella topAppBar
handleClick(String value) {
  switch (value) {
    case 'Logout':
    //context.read<AuthenticationService>().signOut(context);
      break;
    case 'Settings':
      break;
  }
}