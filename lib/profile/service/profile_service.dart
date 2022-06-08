import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constant/service_constants.dart';

class ProfileService {
  Future<bool> logOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final url = Uri.parse('${ServiceConstant.baseUrl}/users/sing-out');
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json', 'Session': '$token'});
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

  getUserProduct(List<String> ids) async {
    List products = [];

    for (String id in ids) {
      final url = Uri.parse('${ServiceConstant.baseUrl}/products/$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        products.add(response.body);
      }
    }
  }
}
