import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCorso extends StatefulWidget {
  @override
  _InfoCorso createState() => _InfoCorso();

}
class _InfoCorso extends State<InfoCorso> {
  bool _isFavorite = false;
  bool _isIscritto = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                    "https://viagrandestudios.com/web/app/uploads/2017/07/inglese.jpg",
                    height: 200, fit: BoxFit.fill),
                Padding(
                  padding:EdgeInsets.only(left:8.0,top:4.0,right:8.0),
                  child:Row(
                      children: [
                        Expanded(
                          flex:6,
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "nomeCorso",
                              style: TextStyle(color: Colors.black.withOpacity(0.6),
                                  fontSize: 30),
                            ),
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child:Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(onPressed: () {
                                  setState(() => _isFavorite = !_isFavorite);
                              },
                                  icon:Icon(_isFavorite ? Icons.favorite: Icons.favorite_outline))
                          )
                        )
                      ]
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left:8.0,top:10.0,right:8.0),
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                    "Categoria",
                    style: TextStyle(color: Colors.black.withOpacity(0.6),
                    fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left:8.0,top:20.0,right:8.0),
                  child:Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Descrizione:",
                          style: TextStyle(color: Colors.black.withOpacity(0.6),
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "La descrizione del corso",
                          style: TextStyle(color: Colors.black.withOpacity(0.6),
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left:8.0,top:20.0,right:8.0),
                  child:Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Docente:",
                          style: TextStyle(color: Colors.black.withOpacity(0.6),
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Il Docente del corso",
                          style: TextStyle(color: Colors.black.withOpacity(0.6),
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left:8.0,top:20.0,right:8.0),
                  child:Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Numero Lezioni:",
                          style: TextStyle(color: Colors.black.withOpacity(0.6),
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "30",
                          style: TextStyle(color: Colors.black.withOpacity(0.6),
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left:8.0,top:20.0,right:8.0),
                  child:Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Prezzo:",
                          style: TextStyle(color: Colors.black.withOpacity(0.6),
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "150€",
                          style: TextStyle(color: Colors.black.withOpacity(0.6),
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left:8.0,top:20.0,right:8.0,bottom: 20.0),
                  child:OutlinedButton(
                    onPressed: () {
                      setState(() => _isIscritto = !_isIscritto);
                    },
                    child: _isIscritto ? Text("ANNULLA ISCRIZIONE", style: TextStyle(color:Colors.red)):Text("ISCRIVITI", style: TextStyle(color:Colors.blue))
                  )
                )
              ],
            )
        )
    );
  }
}
