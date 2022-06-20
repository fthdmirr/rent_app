import 'package:flutter/material.dart';
import 'package:rent_app/utils/constant/router_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../locator.dart';
import '../service/register_service.dart';

class RegisterViewModel extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  TextEditingController get email => _emailController;
  TextEditingController get password => _passwordController;
  TextEditingController get repeatPassword => _repeatPasswordController;
  GlobalKey<FormState> get formKey => _formKey;

  bool isDone = true;

  Future register(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final response = await _getRegisterResult();

      _responseActions(
          context, response?['token'] ?? '', response?['userId'] ?? '');

      notifyListeners();
    }
  }

  Future<Map<String, dynamic>?> _getRegisterResult() async {
    _changeStatus;
    final result =
        await RegisterService().postRegister(email.text, password.text);
    _changeStatus;

    return result;
  }

  get _changeStatus {
    isDone = !isDone;
    notifyListeners();
  }

  Future<void> _responseActions(
      BuildContext context, String token, String id) async {
    if (token.isNotEmpty) {
      getIt<SharedPreferences>().setString('token', token);
      getIt<SharedPreferences>().setString('id', id);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text("Success"),
      ));
      Navigator.pushNamedAndRemoveUntil(
          context, userViewRoute, (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Error"),
      ));
    }
  }
}
