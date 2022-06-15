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

import 'package:flutter/material.dart';

import 'product_detail.dart';

class ProductDetailViewModel extends State<ProductDetail> {
  
  
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
