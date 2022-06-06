import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterService {
  final String _baseUrl =
      'https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976';
      
  Future<bool> postRegister(String email, String password) async {
    final uri = Uri.parse('$_baseUrl/users');

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }
    return false;
  }
}
