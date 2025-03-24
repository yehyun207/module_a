import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../presentation/screens/main_screen.dart';
import '../../presentation/screens/profile_target_screen.dart';

class AuthRepository {

  final Client client = Client();

  final url = 'http://api.db.pe.kr:51091/api';

  Future<String?> signIn(String id, String password, BuildContext context) async {

    final body = {
      'mberId': id,
      'mberPassword': password,
    };

    final response = await client.post(
      Uri.parse('http://api.db.pe.kr:51091/api/authenticate/signin'),
      body: jsonEncode(body),
      headers: { 'Content-Type' : 'application/json' }
    );

    if(response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
    }
  }

  Future<bool?> signUp(String id, String password, String name,BuildContext context) async {

    final body = {
      'mberId': id,
      'mberPassword': password,
      'mberNm': name
    };

    final response = await client.post(
        Uri.parse('${url}/authenticate/signup'),
        body: body,
    );

    if(response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileTargetScreen()));
    }
  }
}