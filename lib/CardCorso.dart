import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/Corso.dart';
import 'navCorso.dart';

class CardCorso extends StatefulWidget{

  final Corso corso;
  const CardCorso(this.corso);
  @override
  _CardCorso createState() => _CardCorso();
}

class _CardCorso extends State<CardCorso> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:150,
      child:GestureDetector(
        onTap:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NavCorso();
          })
          );
        },
        child:Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Image.network(widget.corso.immagine,height:120, fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Align(
                      alignment: Alignment.centerLeft,
                      child:Text(widget.corso.categoria, style: TextStyle(fontSize: 12))
                    ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
                child:Text(
                  widget.corso.titolo,
                  style: TextStyle(color: Colors.black.withOpacity(0.6),
                  fontSize: 18),
                ),
            ),
            ],
          ),
        ),
      ),
    );
  }

}