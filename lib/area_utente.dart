import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/database_utils.dart';
import 'package:progetto_camilloni_tiseni_giri/signInPage.dart';

import 'authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:progetto_camilloni_tiseni_giri/nav.dart';

import 'models/Utente.dart';

class AreaUtente extends StatelessWidget{
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  List<Widget> listOfChips1 = [];
  List<Widget> listOfChips2 = [];
  @override
  Widget build(BuildContext context){

    DatabaseUtils.getUtenteLoggato().then((utente){
      firstnameController.text = utente.firstName;
      lastnameController.text = utente.lastName;

      populateChips(utente).then((chips){
        listOfChips1 = [];
        listOfChips2 = [];
        for(int i=0; i< chips.length; i++){
          if(i%2 == 0) {
            listOfChips1.add(chips.elementAt(i));
          }
          else {
            listOfChips2.add(chips.elementAt(i));
          }
        }
        print(listOfChips1.length);
        print(listOfChips2.length);
      });
    });



    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 10.00, left: 10.00, right:10.00),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("I tuoi dati:",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height:10),
              TextFormField(
                controller: firstnameController,
                decoration: InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: lastnameController,
                decoration: InputDecoration(
                  labelText: 'Cognome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height:10),
              Text("Le tue categorie preferite:",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height:10),
              Container(
                height: 50,
                child:ListView(
                    scrollDirection: Axis.horizontal,
                    children: listOfChips1,
                ),
              ),
              Container(
                height: 50,
                child:ListView(
                    scrollDirection: Axis.horizontal,
                    children: listOfChips2,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut(context);
                },
                child: Text("Logout"),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () {
                    DatabaseUtils.updateUser(firstnameController.text, lastnameController.text);
                  },
                  child: Text("Salva le modifiche"),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

//questa funzione popola le chips con le categorie prese dal db, e "checka" quelle preferite dell'utente
Future<List<Widget>> populateChips(Utente utente) async{
  List<Widget> chips = [];
  List<String> categoriePref = utente.categoriePref;
  bool checked = false;
  await DatabaseUtils.getAllCategories().then((categorie){
    for(int i = 0; i<categorie.length; i++){
      checked = false;
      if(categoriePref != [])
        for(var cat in categoriePref) {
          if (categorie.elementAt(i) == cat)
            checked = true;
        }
        chips.add(
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: FilterChip(
              label: Text(categorie.elementAt(i)),
              selected: checked,
              onSelected: (bool value) {
              },
            ),
          ),
        );
    }
  }
  );
  return chips;
}