import 'dart:convert';

class Documento {
  Documento({
    required this.id,
    required this.titolo,
  });
  String id;
  String titolo;
  factory Documento.fromJson(Map<String, dynamic> json) => Documento(
    id: json["id"],
    titolo: json["titolo"],
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "titolo": titolo,
  };
}