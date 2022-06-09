import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rent_app/product_detail/model/product_model.dart';
import 'package:rent_app/utils/constant/service_constants.dart';

abstract class IProductDetailService {
  final Dio dio;

  IProductDetailService(this.dio);

  Future<Product?> fetchProductItemWithId(String id);
}

enum _ProductDetailPath { products }

enum _ProductDetailQueryPath { userId }

class ProductDetailService extends IProductDetailService {
  ProductDetailService(super.dio);
  @override
  final dio = Dio(BaseOptions(baseUrl: "https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976"));

  @override
  Future<Product?> fetchProductItemWithId(String userId) async {
    try {
      const String baseUrl = ServiceConstant.baseUrl;
      final response = await dio
          .get("https://c1-na.altogic.com/e:629a6b6a9cf83b3805522976/${_ProductDetailPath.products.name}/${userId}");

      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return Product.fromJson(data);
        }
      }
      return null;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
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
