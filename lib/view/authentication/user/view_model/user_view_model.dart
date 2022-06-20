import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/view/tab_view.dart';
import '../../../../locator.dart';
import '../model/user_model.dart';
import '../service/user_service.dart';

class UserViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  TextEditingController get getNameController => nameController;
  TextEditingController get getLastNameController => lastNameController;

  final _service = UserService();

  User? user;

  bool isDone = true;

  getPhotoFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imageFile = File(file.path);
    }
    notifyListeners();
  }

  sendInfosToServiceAndNavigateToHome(BuildContext context) async {
    _changeStatus;
    final token = getIt<SharedPreferences>().getString('token');
    final userId = getIt<SharedPreferences>().getString('id');
    
    final int? statusCode =
        await _service.sendPhoto(imageFile!, basename(imageFile!.path), token ?? '');
        

    user = await _service.sendNameInfos(
      userId ?? '',
      nameController.text,
      lastNameController.text,
    );

    _changeStatus;

    if (user != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const TabView(),
          ),
          (route) => false);
    }
  }

  get _changeStatus {
    isDone = !isDone;
    notifyListeners();
  }
}
