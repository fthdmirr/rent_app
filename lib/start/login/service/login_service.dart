import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  final String _baseUrl =
      'https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976';

  //TODO: servisten gelen token döndürülecek
  Future<String?> getLogin(String email,String password) async {
    final uri = Uri.parse('$_baseUrl/users/sing-in');

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
        final result = json.decode(response.body) as Map<String,dynamic>;
        return result['session']['token'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
