import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/view/home_view.dart';
import '../service/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  TextEditingController get email => _emailController;
  TextEditingController get password => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;

  bool isDone = true;

  login(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final response = await _getLoginResult();

      _responseActions(context, response ?? '');

      notifyListeners();
    }
  }

  _getLoginResult() async {
    _changeStatus;
    final result = await LoginService().getLogin(email.text, password.text);
    _changeStatus;

    return result;
  }

  get _changeStatus {
    isDone = !isDone;
    notifyListeners();
  }

  Future<void> _responseActions(BuildContext context, String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    if (token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Error"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text("Success"),
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
          (route) => false);
    }
  }
}
