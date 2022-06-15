import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? profilePicture;
  final List<String>? productList;

  User(this.firstName, this.lastName, this.profilePicture, this.productList, this.id);

  String get fullName=> '$firstName $lastName';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}
