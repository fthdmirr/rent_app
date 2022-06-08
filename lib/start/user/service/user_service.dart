import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rent_app/utils/constant/service_constants.dart';

class UserService {
  Future<int> sendPhoto(File file, String fileName, String token) async {
    final url = Uri.parse('${ServiceConstant.baseUrl}/users/upload-photo');
    final request = http.MultipartRequest('POST', url);
    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: fileName,
        // contentType: MediaType('image', 'jpeg'),
      ),
    );

    request.headers.addAll(
      {
        'Content-Type': 'multipart/form-data',
        'Session': token,
      },
    );

    final respone = await request.send();

    return respone.statusCode;
  }

  sendNameInfos(String firstName, String lastName) async {
    final uri = Uri.parse('${ServiceConstant.baseUrl}/users/sing-up');

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'firstName': firstName,
          'lastName': lastName,
        }),
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;
        return result['session']['token'];
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
