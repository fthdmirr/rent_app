import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatusEnum { authenticated, unauthenticated, unknown }

class AuthenticationStatus extends ChangeNotifier {
  AuthenticationStatusEnum _status = AuthenticationStatusEnum.unknown;
  AuthenticationStatusEnum get status => _status;

  initStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      _status = AuthenticationStatusEnum.authenticated;
    } else {
      _status = AuthenticationStatusEnum.unauthenticated;
    }
    notifyListeners();
  }

}
