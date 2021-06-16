import 'dart:convert';
import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Documento.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Lezione.dart';

class Corso {
  Corso({
    required this.id,
    required this.categoria,
    required this.descrizione,
    required this.dispense,
    required this.immagine,
    required this.lezioni,
    required this.titolo,
    required this.recensioni,
    required this.avg,
    required this.prezzo,
    required this.docente,
  });

  String id;
  String categoria;
  String descrizione;
  List<Documento> dispense;
  String immagine;
  List<Lezione> lezioni;
  List<num> recensioni;
  num avg;
  String titolo;
  String docente;
  String prezzo;
}
