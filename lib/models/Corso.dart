import 'dart:convert';
import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Documento.dart';
import 'package:progetto_camilloni_tiseni_giri/models/Lezione.dart';

Corso corsoFromJson(String str) => Corso.fromJson(json.decode(str));

String corsoToJson(Corso data) => json.encode(data.toJson());

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
  });

  String id;
  String categoria;
  String descrizione;
  List<Documento> dispense;
  String immagine;
  List<Lezione> lezioni;
  List<dynamic> recensioni;
  String titolo;

  factory Corso.fromJson(Map<String, dynamic> json) => Corso(
        id: json["id"],
        categoria: json["categoria"],
        descrizione: json["descrizione"],
        dispense: List<Documento>.from(
            json["dispense"].map((x) => Documento.fromJson(x))),
        immagine: json["immagine"],
        lezioni:
            List<Lezione>.from(json["lezioni"].map((x) => Lezione.fromJson(x))),
        titolo: json["titolo"],
    recensioni:
    List<dynamic>.from(json["recensioni"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoria": categoria,
        "descrizione": descrizione,
        "dispense": List<dynamic>.from(dispense.map((x) => x.toJson())),
        "immagine": immagine,
        "lezioni": List<dynamic>.from(lezioni.map((x) => x.toJson())),
        "titolo": titolo,
      };
}
