import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/auth/signup"), // Android emulator fix
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print('Signup error: $e');
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8000/auth/login"), // Android emulator fix
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print('Login error: $e');
    }
  }
}
