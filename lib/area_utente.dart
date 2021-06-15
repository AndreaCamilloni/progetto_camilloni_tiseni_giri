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

  @override
  Widget build(BuildContext context){


    DatabaseUtils.getUtenteLoggato().then((value) => print(value.firstName));
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.00),
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
                labelText: "",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: lastnameController,
              decoration: InputDecoration(
                labelText: 'Il tuo cognome',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut(context);
              },
              child: Text("Logout"),
            ),
          ],
        ),
      )
    );
  }
}