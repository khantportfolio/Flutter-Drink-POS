import 'package:dio/dio.dart';
import 'dart:io';

class RequestRawMaterialVO {
  int? rawMaterialId;
  String? name;
  int? categoryId;
  int? brandId;
  int? supplierId;
  int? inStockQty;
  String? unit;
  int? reorderQty;
  int? purchasePrice;
  String? currency;
  int? toppingFlag;
  int? toppingSalesAmount;
  int? toppingSalesPrice;
  int? toppingDeliPrice;
  File? toppingPhotoPath;
  String? url;
  int? specialFlag;
  String? createdAt;
  String? updatedAt;

  RequestRawMaterialVO(
      {this.rawMaterialId,
      this.name,
      this.categoryId,
      this.brandId,
      this.supplierId,
      this.inStockQty,
      this.unit,
      this.reorderQty,
      this.purchasePrice,
      this.currency,
      this.toppingFlag,
      this.toppingSalesAmount,
      this.toppingSalesPrice,
      this.toppingDeliPrice,
      this.toppingPhotoPath,
      this.url,
      this.specialFlag,
      this.createdAt,
      this.updatedAt});

  RequestRawMaterialVO.fromJson(Map<String, dynamic> json) {
    rawMaterialId = json['raw_material_id'];
    name = json['name'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    supplierId = json['supplier_id'];
    inStockQty = json['instock_qty'];
    unit = json['unit'];
    reorderQty = json['reorder_qty'];
    purchasePrice = json['purchase_price'];
    currency = json['currency'];
    toppingFlag = json['topping_flag'];
    toppingSalesAmount = json['topping_sales_amount'];
    toppingSalesPrice = json['topping_sales_price'];
    toppingDeliPrice = json['topping_deli_price'];
    url = json['topping_photo_path'];
    specialFlag = json['special_flag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw_material_id'] = this.rawMaterialId;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['supplier_id'] = this.supplierId;
    data['instock_qty'] = this.inStockQty;
    data['unit'] = this.unit;
    data['reorder_qty'] = this.reorderQty;
    data['purchase_price'] = this.purchasePrice;
    data['currency'] = this.currency;
    data['topping_flag'] = this.toppingFlag;
    data['topping_sales_amount'] = this.toppingSalesAmount;
    data['topping_sales_price'] = this.toppingSalesPrice;
    data['topping_deli_price'] = this.toppingDeliPrice;
    data['topping_photo_path'] = this.url;
    data['special_flag'] = this.specialFlag;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
