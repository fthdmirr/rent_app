import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';

enum AuthenticationStatusEnum { authenticated, unauthenticated, unknown }

class AuthenticationStatus extends ChangeNotifier {
  AuthenticationStatusEnum _status = AuthenticationStatusEnum.unknown;
  AuthenticationStatusEnum get status => _status;

  initStatus() async {
    final token = getIt<SharedPreferences>().getString('token');
    if (token != null && token.isNotEmpty) {
      _status = AuthenticationStatusEnum.authenticated;
    } else {
      _status = AuthenticationStatusEnum.unauthenticated;
    }
    notifyListeners();
  }

}
