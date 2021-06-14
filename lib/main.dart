import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/nav.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/signInPage.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
import 'authentication_service.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
        create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Progetto Flutter',
        home: AuthenticationWrapper(),
      ),
    );

  }
}


/*questa classe è la prima che viene chiamata quando si fa partire l'app e
  quello che fa è controllare se c'è un utente loggato, se non c'è porta
  l'utente alla pagina di login, altrimenti lo porta alla home dell'app
 */
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser != null){
      return Nav();
    }
    return SignInPage();
  }
}
