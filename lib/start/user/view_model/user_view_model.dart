import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_app/home/view/home_view.dart';
import 'package:rent_app/start/user/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  TextEditingController get getNameController => nameController;
  TextEditingController get getLastNameController => lastNameController;

  final _service = UserService();

  getPhotoFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imageFile = File(file.path);
    }
    notifyListeners();
  }

  sendInfosToServiceAndNavigateToHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final int statusCode =
        await _service.sendPhoto(imageFile!, 'fileName', token ?? '');

    if (statusCode == 200) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
          (route) => false);
    }
  }
}
