import 'package:flutter_test/flutter_test.dart';
import 'package:rent_app/start/register/service/register_service.dart';

void main() {
  test('register Test', () async {
    final result =
        await RegisterService().postRegister('fatoo@gmail.com', '123456');

    expect(result, isNotNull);
  });
}
