// // ignore_for_file: unnecessary_new

// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:rent_app/home/core/network/project_network_manager.dart';
// import 'package:rent_app/home/model/home_model.dart';
// import 'package:rent_app/product_detail/view/product_detail.dart';

// abstract class ProductDetailViewModel extends State<ProductDetail> {
//   final Dio dio = ProjectNetworkManager.instance.dio;

//   List<ProductModel> model = <ProductModel>[];

//   Future<void> fetchProductDetail(String Id) async {
//     try {
//       final response = await dio.get("/e:629a6b6a9cf83b3805522976/products/$Id");

//       if (response.statusCode == HttpStatus.ok) {
//         final data = response.data;
//         if (data is Map<String, dynamic>) {
//           final baseProductModel = BaseResponseProduct.fromJson(data);
//           model = baseProductModel.result ?? [];
//         }
//       }
//       setState(() {});
//     } catch (e) {
//       print(e);
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent_app/product_detail/view/product_detail.dart';

import '../../home/model/home_model.dart';

class ProductDetailViewModel extends State<ProductDetail> {
  final String _baseUrl =
      "https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976";
  ProductModel model = ProductModel();

  Future<void> fetchProductDetail(String id) async {
    final uri = Uri.parse('${_baseUrl}/products/$id');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;

        model = ProductModel.fromJson(result);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
