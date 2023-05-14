import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

// This code defines the AuthService class responsible for handling user authentication.
class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDNc1AEd7vZEnadYZxCYZs-A3tsShfekBg';
  final storage = const FlutterSecureStorage();

  // Creates a new user account with the provided email and password.
  // Returns an error message if there is an error, otherwise returns null.
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url =
        Uri.https(_baseUrl, "/v1/accounts:signUp", {'key': _firebaseToken});
    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResponse = json.decode(response.body);
    if (decodedResponse.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodedResponse['idToken']);
      return null;
    } else {
      return decodedResponse['error']['message'];
    }
  }

  // Logs in an existing user with the provided email and password.
  // Returns an error message if there is an error, otherwise returns null.
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(
        _baseUrl, "/v1/accounts:signInWithPassword", {'key': _firebaseToken});
    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResponse = json.decode(response.body);
    if (decodedResponse.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodedResponse['idToken']);
      return null;
    } else {
      return decodedResponse['error']['message'];
    }
  }

  // Logs out the currently authenticated user by deleting the stored token.
  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  // Reads the stored token and returns it.
  // If no token is found, an empty string is returned.
  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
