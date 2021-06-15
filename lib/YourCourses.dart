import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/CardCorso.dart';

class YourCourses extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GridView.count(
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          CardCorso(),
          ),
          Container(
            height:200,
            width:150,
            child:CardCorso(),
          ),
          Container(
            height:200,
            width:150,
            child:CardCorso(),
          ),
          Container(
            height:200,
            width:150,
            child:CardCorso(),
          )
        ]
    );
  }
}