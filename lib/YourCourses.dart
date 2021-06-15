import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/CardCorso.dart';

class YourCourses extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GridView.count(
        padding: EdgeInsets.all(20.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: (150 / 200),
        children: <Widget>[
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
        ]
    );
  }
}