/*
  In questa classe ci sono tutti i metodi per recuperare dati dal database e utilizzarli nei vari modelli
*/

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Corso.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Documento.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Lezione.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Utente.dart';

class DatabaseUtils {
  static final _database = FirebaseDatabase.instance.reference();

  //prende l'utente loggato
  static Future<Utente> getUtenteLoggato() async{
    var firebaseUser = FirebaseAuth.instance.currentUser;
    Utente utenteLoggato = Utente(firstName: "",lastName: "", wishlist: [], iscrizioni: [], categoriePref: []);
    if (firebaseUser != null) {
        await _database.child("Users").child(firebaseUser.uid).once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        utenteLoggato = Utente(firstName: values['firstName'],lastName: values['lastName'], wishlist: [], iscrizioni: [], categoriePref: []);
      });
    }
    return utenteLoggato;
  }

  //prende la lista dei corsi
  static Future<List<Corso>> getListaCorsi() async {
    List<Corso> listaCorsi = [];
    await _database.child('Corsi').once().then((DataSnapshot snapshot) {

      for (var values in snapshot.value){
        List<Lezione> listaLezioni = [];
        List<Documento> listaDispense = [];
        for(var lezione in values["lezioni"]){
          listaLezioni.add(Lezione(descrizione: lezione["descrizione"], id: lezione["id"], titolo: lezione["titolo"], url: lezione["url"]));
        }
        if(values["dispense"] != null) {
          for (var doc in values["dispense"]) {
            listaDispense.add(Documento(id: doc["id"], titolo: doc["titolo"]));
          }
        }
        var corso = Corso(id: values["id"].toString(), categoria: values["categoria"], descrizione: values["descrizione"], dispense: listaDispense, immagine: values["immagine"], lezioni: listaLezioni, titolo: values["titolo"]);
        listaCorsi.add(corso);
        print(listaCorsi.length);
      }
    });

    if (listaCorsi.isEmpty){
      print("vuota");
    }
    print("arrivato al return");
    return listaCorsi;
  }
}