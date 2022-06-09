import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class InfoModel {
  int? count;
  int? totalPages;
  int? currentPage;
  int? pageSize;

  InfoModel({this.count, this.totalPages, this.currentPage, this.pageSize});
  
  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return _$InfoModelFromJson(json);
  }
}

@JsonSerializable()
class BaseResponseModel {
  InfoModel? countInfo;

  BaseResponseModel({this.countInfo});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson(json);
  }
}
