import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


import '../../home/core/network/project_network_manager.dart';
import '../../home/model/home_model.dart';

import 'product.dart';

abstract class AddProductViewModel extends State<Product> {
  final Dio dio = ProjectNetworkManager.instance.dio;


  List<ProductModel> models = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  //Uint8List? image;

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    cityController.dispose();
    districtController.dispose();
    descriptionController.dispose();
    priceController.dispose();
  }

  void createProduct() async {
    try {
      final response = await dio.post(
        '/products/posts',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: {
          'userId': '62a0dfe194bc9fa0719b227d',
          'name': titleController.text,
          'description': descriptionController.text,
          'price': int.parse(priceController.text),
          'city': cityController.text,
          'district': districtController.text,
          'productImages': ['https://i.hizliresim.com/lyrhvse.jpeg'],
        },
      );
      setState(() {
        models.add(ProductModel.fromJson(response.data));
      });
      
    } catch (e) {}
  }
}
