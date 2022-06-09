import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:rent_app/utils/constant/service_constants.dart';

import '../model/user_model.dart';

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
        contentType: MediaType('image', 'jpg'),
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

  Future<User?> sendNameInfos(
      String id, String firstName, String lastName) async {
    final uri = Uri.parse('${ServiceConstant.baseUrl}/users/$id');

    try {
      final response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode({
          'firstName': firstName,
          'lastName': lastName,
        }),
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;

        return User.fromJson(result);
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
