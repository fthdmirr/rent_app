import 'package:flutter/material.dart';
import '../service/profile_service.dart';
import '../../start/register/view/register_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends ChangeNotifier {
  logoutAndNavigateToRegister(BuildContext context) async {
    final result = await ProfileService().logOut();

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
