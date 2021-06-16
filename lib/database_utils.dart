/*
  In questa classe ci sono tutti i metodi per recuperare dati dal database e utilizzarli nei vari modelli
*/

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Corso.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Documento.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Lezione.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Utente.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DatabaseUtils {
  static final _database = FirebaseDatabase.instance.reference();
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //prende l'utente loggato
  static Future<Utente> getUtenteLoggato() async{
    var firebaseUser = FirebaseAuth.instance.currentUser;
    Utente utenteLoggato = Utente(firstName: "",lastName: "", wishlist: [], iscrizioni: [], categoriePref: []);
    if (firebaseUser != null) {
        await _database.child("Users").child(firebaseUser.uid).once().then((DataSnapshot snapshot) {
          var values = snapshot.value;
          List<String> wishlist = [];
          List<String> categoriePref = [];
          List<String> iscrizioni = [];
          if(values['wishlist'] != null) {
            for (var wish in values['wishlist']) {
              wishlist.add(wish);
            }
          }
          if(values['categoriePref'] != null) {
            for (var cat in values['categoriePref']) {
              categoriePref.add(cat);
            }
          }
          if(values['iscrizioni'] != null) {
            for (var iscr in values['iscrizioni']) {
              iscrizioni.add(iscr);
            }
          }
        utenteLoggato = Utente(firstName: values['firstName'],lastName: values['lastName'],wishlist: wishlist, iscrizioni: iscrizioni, categoriePref: categoriePref);
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
        List<double> listaRecensioni = [];
        for(var lezione in values["lezioni"]){
          listaLezioni.add(Lezione(descrizione: lezione["descrizione"], id: lezione["id"], titolo: lezione["titolo"], url: lezione["url"]));
        }
        if(values["dispense"] != null) {
          for (var doc in values["dispense"]) {
            listaDispense.add(Documento(id: doc["id"], titolo: doc["titolo"]));
          }
        }
        /*if(values["recensioni"] != null) {
          for (var doc in values["recensioni"]) {
            listaRecensioni.add(doc);
          }
        }*/
        var corso = Corso(id: values["id"].toString(), categoria: values["categoria"], descrizione: values["descrizione"], dispense: listaDispense, immagine: values["immagine"], lezioni: listaLezioni, titolo: values["titolo"],recensioni: []);
        listaCorsi.add(corso);
      }
    });
    return listaCorsi;
  }

  //funzione che aggiorna gli attributi dell'utente loggato
  static void updateUser(String firstName, String lastName) {
    final User? firebaseUser = _firebaseAuth.currentUser;
    Map<String, dynamic> changeMap = {};
    changeMap['firstName'] = firstName;
    changeMap['lastName'] = lastName;
    _database.child('Users').child(firebaseUser!.uid).update(changeMap);
    Fluttertoast.showToast(
      msg: "Modifiche salvate",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
    );
  }

  //funzione che prende tutte le diverse categorie esistenti nel database
  static Future<Set<String>> getAllCategories() async {
    Set<String> categorie = Set();
    await getListaCorsi().then((corsi){
      for (var corso in corsi){
        categorie.add(corso.categoria);
      }
    });
    return categorie;
  }

  //funzione che ritorna il corso di cui passo l'id
  static Future<Corso> getCorso(String id) async {
    Corso corso = Corso(id: "", categoria: "", descrizione: "", dispense: [], immagine: "", lezioni: [], titolo: "", recensioni: []);
    await getListaCorsi().then((corsi){
      for (var c in corsi){
        if (c.id == id){
          corso = c;
          break;
        }
      }
    });
    return corso;
  }
}
