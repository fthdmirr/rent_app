import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../utils/constant/service_constants.dart';
import '../model/user_model.dart';

class UserService {
  Future<int?> sendPhoto(File file, String fileName, String token) async {
    final url = Uri.parse('${ServiceConstant.baseUrl}/users/profile-photo');

    try {
      final request = http.MultipartRequest('POST', url);

      request.headers.addAll(
        {
          'Content-Type': 'multipart/form-data',
          'Session': token,
        },
      );

      request.files.add(
        http.MultipartFile(
          'profileImage',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: fileName,
          contentType: MediaType('image', 'png'),
        ),
      );

      final respone = await request.send();

      return respone.statusCode;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> sendNameInfos(
      String id, String firstName, String lastName) async {
    final uri = Uri.parse('${ServiceConstant.baseUrl}/users/$id');

    try {
      final response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json'},
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
