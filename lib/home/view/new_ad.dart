import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rent_app/utils/widget/custom_text_field.dart';

class AddNewAd extends StatefulWidget {
  const AddNewAd({Key? key}) : super(key: key);

  @override
  State<AddNewAd> createState() => _AddNewAdState();
}

class _AddNewAdState extends State<AddNewAd> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Yeni İlan Ekle',style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          TextFieldInput(textEditingController: _titleController, hintText: 'Başlık', textInputType: TextInputType.text),
          TextFieldInput(textEditingController: _descriptionController, hintText: 'Açıklama', textInputType: TextInputType.text),
        ],
      ),
      );
  }
}
