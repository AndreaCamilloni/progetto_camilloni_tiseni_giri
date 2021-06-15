import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/signInPage.dart';

import 'authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:progetto_camilloni_tiseni_giri/nav.dart';

class AreaUtente extends StatelessWidget {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.00),
        child: Column(
          children: [
            Text("I tuoi dati:",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height:30),
            TextFormField(
              controller: firstnameController,
              decoration: InputDecoration(
                labelText: 'Il tuo nome',
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
          ],
        ),
      )
    );
  }
}