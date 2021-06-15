import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCorso extends StatefulWidget{
  @override
  _CardCorso createState() => _CardCorso();
}

class _CardCorso extends State<CardCorso> {
  String nomeCorso = "nomeCorso";
  String categoriaCorso = "categoria";
  String urlImmagine = "https://viagrandestudios.com/web/app/uploads/2017/07/inglese.jpg";
  String id_corso = "0";
  @override
  Widget build(BuildContext context) {
    return Container(
      width:150,
      height:200,
      child:Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.network(urlImmagine,height:120, fit: BoxFit.fill),
            Align(
                alignment: Alignment.centerLeft,
                child:Text(categoriaCorso, style: TextStyle(fontSize: 12))
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                nomeCorso,
                style: TextStyle(color: Colors.black.withOpacity(0.6),
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}