import 'package:flutter_test/flutter_test.dart';
import 'package:rent_app/authentication/register/service/register_service.dart';

void main() {
  test('register Test', () async {
    final result =
        await RegisterService().postRegister('testrrrtttt@gmail.com', '123456');

    expect(result, true);
  });
}
