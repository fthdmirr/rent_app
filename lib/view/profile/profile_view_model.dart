import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication/user/model/user_model.dart';
import '../home/model/home_model.dart';
import 'service/profile_service.dart';

class ProfileViewModel extends ChangeNotifier {
  List<ProductModel> products = [];
  bool isDone = true;
  User? user;

  final _service = ProfileService();

  Future<void> init() async {
    user = await _service.getUser();
    if (user != null && (user?.productList ?? []).isNotEmpty) {
      await _initiliazeProductList();
    }
    notifyListeners();
  }

  Future<void> _initiliazeProductList() async {
    _changeStatus;
    products = await _service.getUserProduct(user?.productList ?? []);

    _changeStatus;

    notifyListeners();
  }

  get _changeStatus {
    isDone = false;
    notifyListeners();
  }

  logoutAndNavigateToRegister(BuildContext context) async {
    final result = await _service.logOut();

    if (result) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', '');

      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, 'registerViewRoute', (route) => false);
    }
  }
}
