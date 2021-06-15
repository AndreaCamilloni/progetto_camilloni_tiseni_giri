/*Pagina di login*/

import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/signInPage.dart';

import 'authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:progetto_camilloni_tiseni_giri/nav.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('ProgettoFlutter'),
        ),
      body: Container(
        margin: const EdgeInsets.only(left: 50.0, right: 50.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Scegli una email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 50),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Scegli una password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signUp(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      context
                  );
                },
                child: Text("Registrati"),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignInPage()),
                  );
                },
                child: Text("vai al login"),
              )
            ],
          )

        ],
      ),
      )
    );

  }
}