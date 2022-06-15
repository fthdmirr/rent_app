import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../home/model/home_model.dart';


enum _ProductDetailPath { products }

class ProductDetailService {
  final String _baseUrl =
      "https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976";
  ProductModel model = ProductModel();

  Future<ProductModel?> fetchProductDetail(String id) async {
    final uri = Uri.parse('$_baseUrl/${_ProductDetailPath.products.name}/$id');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;

        model = ProductModel.fromJson(result);
        return model;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error);
      print(type);
    }
  }
}
