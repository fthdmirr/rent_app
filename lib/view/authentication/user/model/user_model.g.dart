// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['profilePicture'] as String?,
      (json['productList'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['_id'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePicture': instance.profilePicture,
      'productList': instance.productList,
    };
