/*
  In questa classe ci sono tutti i metodi per recuperare dati dal database e utilizzarli nei vari modelli
*/

import 'dart:collection';
import 'dart:convert';
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
        List<num> listaRecensioni = [];
        for(var lezione in values["lezioni"]){
          listaLezioni.add(Lezione(descrizione: lezione["descrizione"], id: lezione["id"], titolo: lezione["titolo"], url: lezione["url"]));
        }
        
        if(values["dispense"] != null) {
          for (var doc in values["dispense"]) {
            listaDispense.add(Documento(id: doc["id"], titolo: doc["titolo"], url: doc['url']));
          }
        }
        
        if(values["recensioni"]!= null) {
          Map<String,num> mapRecensioni = Map.castFrom(values["recensioni"]);
          mapRecensioni.forEach((key, value) {
            listaRecensioni.add(value);
          });
        }
        //costruisco la somma degli elemnti della lista di recensioni
        num sum = 0;
        for(num recensione in listaRecensioni) {
          sum+=recensione;
        }
        num avg = 0;
        //faccio la media
        if(listaRecensioni.length != 0) {
          avg = sum/listaRecensioni.length;
        }

        //print("media: " + "$avg " + "id_corso: " "${values['id']}");
        var corso = Corso(id: values["id"].toString(), categoria: values["categoria"], descrizione: values["descrizione"], dispense: listaDispense, immagine: values["immagine"], lezioni: listaLezioni, titolo: values["titolo"],recensioni: listaRecensioni,avg:avg, docente: values["docente"] != null? values["docente"]:"Sconosciuto", prezzo: values["prezzo"] != null? values["prezzo"]: "Corso gratuito");
        listaCorsi.add(corso);
      }
    });
    return listaCorsi;
  }

  //funzione che aggiorna gli attributi dell'utente loggato
  static void updateUser(String firstName, String lastName, Set<String> categorie) {
    final User? firebaseUser = _firebaseAuth.currentUser;
    Map<String, dynamic> changeMap = {};
    List<String> cat = [];
    for(var c in categorie){
      cat.add(c);
    }

    changeMap['firstName'] = firstName;
    changeMap['lastName'] = lastName;
    changeMap['categoriePref'] = cat;
    _database.child('Users').child(firebaseUser!.uid).update(changeMap);
    Fluttertoast.showToast(
      msg: "Modifiche salvate",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
    );
  }

  //funzione che aggiunge il corso alla wishlist se non c'è già, se c'è gia lo elimina
  static void updateWishlist(String idCorso){
    final User? firebaseUser = _firebaseAuth.currentUser;
    Map<String, dynamic> changeMap = {};
    getUtenteLoggato().then((utente) {
      for(var i=0; i<utente.wishlist.length; i++){
        changeMap[i.toString()] = utente.wishlist[i];
      }
      var found = false;
      var keyDaRimuovere;
      changeMap.forEach((key, value) {
        if(value==idCorso){
          keyDaRimuovere = key;
          found = true;
        }
      });
      if(found) {
        changeMap.remove(keyDaRimuovere);
        Map<String, dynamic> tmpMap = Map();
        int it = 0;
        changeMap.forEach((key, value) {
          tmpMap[it.toString()] = value;
          it++;
        });
        changeMap = tmpMap;
      }
      else{
        int id = 0;
        changeMap.forEach((key, value) { id++; });
        changeMap[id.toString()] = idCorso;
      }
      _database.child('Users').child(firebaseUser!.uid).child('wishlist').set(changeMap);
    });
  }

  //funzione che aggiunge il corso alle iscrizioni se non c'è già, se c'è gia lo elimina
  static void updateIscrizioni(String idCorso){
    final User? firebaseUser = _firebaseAuth.currentUser;
    Map<String, dynamic> changeMap = {};
    getUtenteLoggato().then((utente) {
      for(var i=0; i<utente.iscrizioni.length; i++){
        changeMap[i.toString()] = utente.iscrizioni[i];
      }
      var found = false;
      var keyDaRimuovere;
      changeMap.forEach((key, value) {
        if(value==idCorso){
          keyDaRimuovere = key;
          found = true;
        }
      });
      if(found) {
        changeMap.remove(keyDaRimuovere);
        Map<String, dynamic> tmpMap = Map();
        int it = 0;
        changeMap.forEach((key, value) {
          tmpMap[it.toString()] = value;
          it++;
        });
        changeMap = tmpMap;
      }
      else{
        int id = 0;
        changeMap.forEach((key, value) { id++; });
        changeMap[id.toString()] = idCorso;
      }
      _database.child('Users').child(firebaseUser!.uid).child('iscrizioni').set(changeMap);
    });
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
    Corso corso = Corso(id: "", categoria: "", descrizione: "", dispense: [], immagine: "", lezioni: [], titolo: "", recensioni: [],avg:0.0, docente: "", prezzo:"");
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

  // funzione che estrae dai corsi i corsi a cui è iscritto un certo utente
  static Future<List<Corso>> getIscrizioni() async{
    List<Corso> iscrizioni = [];
    Utente currUser = await getUtenteLoggato();
    await getListaCorsi().then((corsi){
      for(Corso corso in corsi){
        if(currUser.iscrizioni.contains(corso.id)){
          iscrizioni.add(corso);
        }
      }
    });
    return iscrizioni;
  }
}

