import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/signInPage.dart';

import 'authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:progetto_camilloni_tiseni_giri/nav.dart';

class Prova extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
                context.read<AuthenticationService>().signOut(context);
            },
            child: Text("Logout"),
          )
        ],
      ),
    );
  }
}