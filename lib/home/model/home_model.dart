import 'package:json_annotation/json_annotation.dart';

import '../core/base_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? sId;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? price;
  String? description;
  List<String>? productImages;
  String? userId;
  String? district;
  String? city;
  String? productType;

  ProductModel(
      {this.sId,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.price,
      this.description,
      this.productImages,
      this.userId,
      this.district,
      this.city,
      this.productType});

factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(this);
  }
}

@JsonSerializable()
class BaseResponseProduct extends BaseResponseModel {
  List<ProductModel>? result;

  BaseResponseProduct({this.result});

  factory BaseResponseProduct.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BaseResponseProductToJson(this);
  }
}
