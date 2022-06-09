// ignore_for_file: unnecessary_new

class Product {
  String? sId;
  String? createdAt;
  String? updatedAt;
  String? name;
  double? unitPrice;
  String? description;
  List<String>? productImages;
  String? category;
  String? productType;
  String? userId;
  String? district;
  String? city;

  Product(
      {this.sId,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.unitPrice,
      this.description,
      this.productImages,
      this.category,
      this.productType,
      this.userId,
      this.district,
      this.city});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    unitPrice = json['unitPrice'];
    description = json['description'];
    productImages = json['productImages'].cast<String>();
    category = json['category'];
    productType = json['productType'];
    userId = json['userId'];
    district = json['district'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['name'] = name;
    data['unitPrice'] = unitPrice;
    data['description'] = description;
    data['productImages'] = productImages;
    data['category'] = category;
    data['productType'] = productType;
    data['userId'] = userId;
    data['district'] = district;
    data['city'] = city;
    return data;
  }
}
