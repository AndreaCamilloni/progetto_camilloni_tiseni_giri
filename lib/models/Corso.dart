import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

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
  });

  String id;
  String categoria;
  String descrizione;
  List<Dispense> dispense;
  String immagine;
  List<Lezioni> lezioni;
  String titolo;

  factory Corso.fromJson(Map<String, dynamic> json) => Corso(
    id: json["id"],
    categoria: json["categoria"],
    descrizione: json["descrizione"],
    dispense: List<Dispense>.from(json["dispense"].map((x) => Dispense.fromJson(x))),
    immagine: json["immagine"],
    lezioni: List<Lezioni>.from(json["lezioni"].map((x) => Lezioni.fromJson(x))),
    titolo: json["titolo"],
  );
  /*
  Corso.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key!;
    descrizione = snapshot.value['descrizione'];
    categoria = snapshot.value['categoria'];
    dispense = snapshot.value['dispense'];
    immagine = snapshot.value['immagine'];
    titolo = snapshot.value['titolo'];
    lezioni = snapshot.value['lezioni'];
  }*/

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

class Dispense {
  Dispense({
    required this.id,
    required this.titolo,
  });

  String id;
  String titolo;

  factory Dispense.fromJson(Map<String, dynamic> json) => Dispense(
    id: json["id"],
    titolo: json["titolo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titolo": titolo,
  };
}

class Lezioni {
  Lezioni({
    required this.descrizione,
    required this.id,
    required this.titolo,
    required this.url,
  });

  String descrizione;
  String id;
  String titolo;
  String url;

  factory Lezioni.fromJson(Map<String, dynamic> json) => Lezioni(
    descrizione: json["descrizione"],
    id: json["id"],
    titolo: json["titolo"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "descrizione": descrizione,
    "id": id,
    "titolo": titolo,
    "url": url,
  };
}
