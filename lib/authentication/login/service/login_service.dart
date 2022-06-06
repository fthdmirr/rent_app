import 'package:http/http.dart' as http;

class LoginService {
  final String _baseUrl =
      'https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976';

  //TODO: servisten gelen token döndürülecek
  Future<bool> getLogin(String userID) async {
    final uri = Uri.parse('$_baseUrl/users/$userID');

    try {
      final response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
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
