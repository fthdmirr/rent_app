
import 'package:flutter/material.dart';
import 'package:rent_app/utils/widget/custom_text_field.dart';

import 'new_product_view_model.dart';

class AddProduct extends AddProductViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Yeni İlan Ekle',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          TextFieldInput(
              textEditingController: titleController,
              hintText: 'Başlık',
              textInputType: TextInputType.text),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFieldInput(
              textEditingController: descriptionController,
              hintText: 'Açıklama',
              textInputType: TextInputType.text),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFieldInput(
              textEditingController: cityController,
              hintText: 'İl',
              textInputType: TextInputType.text),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFieldInput(
              textEditingController: districtController,
              hintText: 'İlçe',
              textInputType: TextInputType.text),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFieldInput(
              textEditingController: priceController,
              hintText: 'Saatlik Ücret',
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.go),
          SizedBox(
            height: size.height * 0.04,
          ),
          GestureDetector(
              onTap: () {
                createProduct();
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text('İlanı Yayınla'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange[200],
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                height: size.height * 0.05,
                width: size.width * 0.3,
              )),
        ],
      ),
    );
  }
}
