import 'package:flutter/material.dart';
import 'package:rent_app/authentication/register/service/register_service.dart';
import 'package:rent_app/home/view/home/home.dart';
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

      _responseActions(context, response);

      notifyListeners();
    }
  }

  Future<bool> _getRegisterResult() async {
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

  void _responseActions(BuildContext context, bool response) {
    if (!response) {
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
            builder: (context) => Home(),
          ),
          (route) => false);
    }
  }
}
