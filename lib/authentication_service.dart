/*
 Questa classe serve per definire tutti i meccanismi di autenticazione,
 contiene quindi metodi per il login, per la registrazione, per il logout,
 ecc...

 */



import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progetto_camilloni_tiseni_giri/nav.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progetto_camilloni_tiseni_giri/signInPage.dart';

import 'models/Utente.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final databaseRef = FirebaseDatabase.instance.reference();
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //funzione per effettuare il logout
  Future<void> signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => SignInPage()),
          (Route<dynamic> route) => false,
    );
  }

  //funzione per effetuare il login
  Future<String?> signIn(String email, String password, BuildContext context) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Nav()),
            (Route<dynamic> route) => false,
      );
      Fluttertoast.showToast(
        msg: "Login avvenuto correttamente",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );
      return "Sign in";
    } on FirebaseAuthException catch (e){

      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "Non è stato trovato nessun utente con quell'email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: "La password è errata",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      }
        else if (e.code =='invalid-email'){
        Fluttertoast.showToast(
          msg: "L'email ha un formato non valido",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      }
        else {
        Fluttertoast.showToast(
          msg: "Tutti i campi sono richiesti",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      }

      return e.message;
    }
  }

  //funzione per registrare un nuovo utente
  Future<String?> signUp(String email, String password, String nome, String cognome, BuildContext context) async{
    try {
      if(nome == "" || cognome == ""){
        Fluttertoast.showToast(
          msg: "Nome e cognome sono richiesti",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
        return "not registered";
      }
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      final User? firebaseUser = _firebaseAuth.currentUser;
      if(firebaseUser != null) {
        await databaseRef.child("Users").child(firebaseUser.uid).set({
          'firstname': nome,
          'lastName': cognome,
          'wishlist': [],
          'categoriePref': [],
          'iscrizioni': [],
        });
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Nav()),
            (Route<dynamic> route) => false,
      );
      Fluttertoast.showToast(
        msg: "Registrazione avvenuta con successo",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Fluttertoast.showToast(
          msg: "L'email ha un formato non valido",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      }
      else if (e.code == 'weak-password') {
        Fluttertoast.showToast(
        msg: "Scegli una password più sicura",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        );
      }
      else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: "L'email è già stata utilizzata",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
      }
      else {
        Fluttertoast.showToast(
          msg: "Tutti i campi sono richiesti",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
        return e.message;
      }
    }
  }
}