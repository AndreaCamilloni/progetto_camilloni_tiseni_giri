import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progetto Flutter',
      home: Nav(),
    );

  }
}
