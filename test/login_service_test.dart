import 'package:flutter_test/flutter_test.dart';
import 'package:rent_app/authentication/login/service/login_service.dart';
import 'package:rent_app/authentication/register/service/register_service.dart';

void main() {
  test('login Test', () async {
    final result =
        await LoginService().getLogin('629e5fd820c4239ee3391ee2');

    expect(result, true);
  });
}
