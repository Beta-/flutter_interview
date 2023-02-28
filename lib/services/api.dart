import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';

class ApiService {
  // API Service
  //
  // Init:
  // Create singleton
  static final ApiService _apiService = ApiService._internal();
  factory ApiService() {
    return _apiService;
  }
  ApiService._internal();

  // Handle request here
  Future<Map<String, dynamic>> handleRequest(
    String url,
    RequestMethod method,
  ) async {
    // Get our api key:
    String apiKeyString =
        await rootBundle.loadString("assets/json/api_key.json");
    String apiKey = jsonDecode(apiKeyString)['key'];
    log("$url\n\n$method\n\nAPI KEY: $apiKey");
    final serverResponse = await http.get(Uri.parse(url), headers: {
      "X-RapidAPI-Key": apiKey,
      "X-RapidAPI-Host": "unogsng.p.rapidapi.com",
    });

    log("Server Response: ${serverResponse.body}");
    return {};
  }
}

enum RequestMethod { GET, POST }
