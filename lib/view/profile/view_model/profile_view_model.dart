import 'package:flutter/material.dart';
import '../../authentication/register/view/register_view.dart';
import '../../authentication/user/model/user_model.dart';
import '../../home/model/home_model.dart';
import '../service/profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterView(),
          ),
          (route) => false);
    }
  }
}
