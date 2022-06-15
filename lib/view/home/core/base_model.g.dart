// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      count: json['count'] as int?,
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      pageSize: json['pageSize'] as int?,
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'count': instance.count,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
    };

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) =>
    BaseResponseModel(
      countInfo: json['countInfo'] == null
          ? null
          : InfoModel.fromJson(json['countInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) =>
    <String, dynamic>{
      'countInfo': instance.countInfo,
    };
