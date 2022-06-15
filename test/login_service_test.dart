import 'package:flutter_test/flutter_test.dart';
import 'package:rent_app/view/authentication/login/service/login_service.dart';

void main() {
  test('login Test', () async {
    final result =
        await LoginService().getLogin('x','x');

    expect(result, true);
  });
}
