import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_camilloni_tiseni_giri/database_utils.dart';


import 'models/Corso.dart';

class InfoCorso extends StatefulWidget {
  final Corso corso;

  const InfoCorso(this.corso);
  @override
  _InfoCorso createState() => _InfoCorso();

}
class _InfoCorso extends State<InfoCorso> {
  bool _isFavorite = false;
  bool _isIscritto = false;

  initState(){
    DatabaseUtils.getUtenteLoggato().then((utente){
      if(utente.wishlist.contains(widget.corso.id))
        _isFavorite = true;
      if(utente.wishlist.contains(widget.corso.id))
        _isIscritto = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                    widget.corso.immagine,
                    height: 200, fit: BoxFit.fitWidth),
                Padding(
                  padding:EdgeInsets.only(left:8.0,top:4.0,right:8.0),
                  child:Row(
                      children: [
                        Expanded(
                          flex:6,
                          child:Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.corso.titolo,
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
                                  DatabaseUtils.updateWishlist(widget.corso.id);
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
                    widget.corso.categoria,
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
                          widget.corso.descrizione,
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
                          widget.corso.docente,
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
                          widget.corso.lezioni.length.toString(),
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
                          widget.corso.prezzo,
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
                      DatabaseUtils.updateIscrizioni(widget.corso.id);
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
