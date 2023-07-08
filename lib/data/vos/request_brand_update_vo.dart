class RequestBrandUpdateVO {
  int? brandId;
  String? brandCode;
  String? name;
  int? categoryId;
  int? supplierId;
  String? countryOfOrigin;
  String? createdAt;
  String? updatedAt;

  RequestBrandUpdateVO(
      {this.brandId,
      this.brandCode,
      this.name,
      this.categoryId,
      this.supplierId,
      this.countryOfOrigin,
      this.createdAt,
      this.updatedAt});

  RequestBrandUpdateVO.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandCode = json['brand_code'];
    name = json['name'];
    categoryId = json['category_id'];
    supplierId = json['supplier_id'];
    countryOfOrigin = json['country_of_origin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['brand_code'] = this.brandCode;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['supplier_id'] = this.supplierId;
    data['country_of_origin'] = this.countryOfOrigin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
