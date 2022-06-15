// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      sId: json['sId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      description: json['description'] as String?,
      productImages: (json['productImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userId: json['userId'] as String?,
      district: json['district'] as String?,
      city: json['city'] as String?,
      productType: json['productType'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'productImages': instance.productImages,
      'userId': instance.userId,
      'district': instance.district,
      'city': instance.city,
      'productType': instance.productType,
    };

BaseResponseProduct _$BaseResponseProductFromJson(Map<String, dynamic> json) =>
    BaseResponseProduct(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..countInfo = json['countInfo'] == null
        ? null
        : InfoModel.fromJson(json['countInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$BaseResponseProductToJson(
        BaseResponseProduct instance) =>
    <String, dynamic>{
      'countInfo': instance.countInfo,
      'result': instance.result,
    };
