import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant/service_constants.dart';
import '../../authentication/user/model/user_model.dart';
import '../../home/model/home_model.dart';
import '../../../locator.dart';

class ProfileService {
  Future<bool> logOut() async {
    try {
      final token = getIt<SharedPreferences>().getString('token');

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

  Future<User?> getUser() async {
    final id = getIt<SharedPreferences>().getString('id');
    final url = Uri.parse('${ServiceConstant.baseUrl}/users/$id');
    final response = await http.get(url);
    User? user;
    if (response.statusCode == 200) {
      user = User.fromJson(json.decode(response.body));
    }
    return user;
  }

  Future<List<ProductModel>> getUserProduct(List<String> ids) async {
    List<ProductModel> products = [];

    for (String id in ids) {
      final url = Uri.parse('${ServiceConstant.baseUrl}/products/$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        products
            .add(ProductModel.fromJson(response.body as Map<String, dynamic>));
      }
    }

    return products;
  }
}
