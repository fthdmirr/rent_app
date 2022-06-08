import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterService {
  final String _baseUrl =
      'https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976';
      
  Future<String?> postRegister(String email, String password) async {
    final uri = Uri.parse('$_baseUrl/users/sing-up');

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
        final result = jsonDecode(response.body) as Map<String,dynamic>;
        return result['session']['token'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
