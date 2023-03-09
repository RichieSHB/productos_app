import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBSWZ4Rwhf3vtMALZeK0k-QnFF71ablGYM';

  Future<String?> createrUser(String email, String password) async {
    final Map<String, dynamic> authdata = {
      'email': email,
      'password': password,
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authdata));
    final Map<String, dynamic> decodeResp = jsonDecode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future login(String email, String password) async {
    final Map<String, dynamic> authdata = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authdata));
    final Map<String, dynamic> decodeResp = jsonDecode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }
}
