import 'dart:convert';
import 'dart:io';
import 'package:progetto_camilloni_tiseni_giri/utilities/keys.dart';

class APIService{

  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';

}