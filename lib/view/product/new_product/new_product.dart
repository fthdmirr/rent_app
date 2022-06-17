import 'package:flutter/material.dart';
import 'package:rent_app/utils/widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              hintText: AppLocalizations.of(context).title,
              textInputType: TextInputType.text),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFieldInput(
              textEditingController: descriptionController,
              hintText: AppLocalizations.of(context).description,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange[200],
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                height: size.height * 0.05,
                width: size.width * 0.3,
                child: Text('İlanı Yayınla'),
              )),
        ],
      ),
    );
  }
}
