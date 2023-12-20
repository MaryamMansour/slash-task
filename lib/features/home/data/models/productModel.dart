import '../../domain/entities/product.dart';

class ResponeModel extends Respone{
  ResponeModel({
      this.statusCode, 
      this.message, 
      this.pagination, 
      this.data,});

  ResponeModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductModel.fromJson(v));
      });
    }
  }
  int? statusCode;
  String? message;
  Pagination? pagination;
  List<Product>? data;

}

class ProductModel extends Product {
  ProductModel({
      this.id, 
      this.name, 
      this.description, 
      this.subCategoryId, 
      this.brandId, 
      this.bostaSizeId, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.productRating,
      this.estimatedDaysPreparing,
      this.brands,
      this.productVariations,
      this.subCategories, 
      this.sizeChart,});

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    subCategoryId = json['sub_category_id'];
    brandId = json['brand_id'];
    bostaSizeId = json['bosta_size_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    productRating = json['product_rating'];
    estimatedDaysPreparing = json['estimated_days_preparing'];
    brands = json['Brands'] != null ? BrandModel.fromJson(json['Brands']) : null;
    if (json['ProductVariations'] != null) {
      productVariations = [];
      json['ProductVariations'].forEach((v) {
        productVariations?.add(ProductVariations.fromJson(v));
      });
    }
    subCategories = json['SubCategories'] != null ? SubCategories.fromJson(json['SubCategories']) : null;
    sizeChart = json['SizeChart'];
  }
  int? id;
  String? name;
  String? description;
  int? subCategoryId;
  int? brandId;
  int? bostaSizeId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? productRating;
  int? estimatedDaysPreparing;
  Brand? brands;
  List<ProductVariations>? productVariations;
  SubCategories? subCategories;
  dynamic sizeChart;


}



class ProductVariationsModel extends ProductVariations {
  ProductVariationsModel({
      this.id, 
      this.productId, 
      this.price, 
      this.quantity, 
      this.isDefault, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.productVariationStatusId, 
      this.productVarientImages,});

  ProductVariationsModel.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
    isDefault = json['is_default'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productVariationStatusId = json['product_variation_status_id'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = [];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages?.add(ProductVarientImages.fromJson(v));
      });
    }
  }
  int? id;
  int? productId;
  num? price;
  int? quantity;
  bool? isDefault;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? productVariationStatusId;
  List<ProductVarientImages>? productVarientImages;


}

class ProductVarientImagesModel extends ProductVarientImages {
  ProductVarientImagesModel({
      this.id, 
      this.imagePath, 
      this.productVarientId, 
      this.createdAt, 
      this.updatedAt,});

  ProductVarientImagesModel.fromJson(dynamic json) {
    id = json['id'];
    imagePath = json['image_path'];
    productVarientId = json['product_varient_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? imagePath;
  dynamic productVarientId;
  String? createdAt;
  String? updatedAt;


}



class BrandModel extends Brand {
  BrandModel({
      this.id, 
      this.brandName, 
      this.brandFacebookPageLink, 
      this.brandInstagramPageLink, 
      this.brandWebsiteLink, 
      this.brandMobileNumber, 
      this.brandEmailAddress, 
      this.taxIdNumber, 
      this.brandDescription, 
      this.brandLogoImagePath, 
      this.brandStatusId, 
      this.brandStoreAddressId, 
      this.brandCategoryId, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.brandSellerId, 
      this.brandId, 
      this.slashContractPath, 
      this.brandRating, 
      this.daysLimitToReturn, 
      this.planId,});

  BrandModel.fromJson(dynamic json) {
    id = json['id'];
    brandName = json['brand_name'];
    brandFacebookPageLink = json['brand_facebook_page_link'];
    brandInstagramPageLink = json['brand_instagram_page_link'];
    brandWebsiteLink = json['brand_website_link'];
    brandMobileNumber = json['brand_mobile_number'];
    brandEmailAddress = json['brand_email_address'];
    taxIdNumber = json['tax_id_number'];
    brandDescription = json['brand_description'];
    brandLogoImagePath = json['brand_logo_image_path'];
    brandStatusId = json['brand_status_id'];
    brandStoreAddressId = json['brand_store_address_id'];
    brandCategoryId = json['brand_category_id'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    brandSellerId = json['brand_seller_id'];
    brandId = json['brand_id'];
    slashContractPath = json['slash_contract_path'];
    brandRating = json['brand_rating'];
    daysLimitToReturn = json['days_limit_to_return'];
    planId = json['planId'];
  }
  int? id;
  String? brandName;
  dynamic brandFacebookPageLink;
  dynamic brandInstagramPageLink;
  dynamic brandWebsiteLink;
  String? brandMobileNumber;
  String? brandEmailAddress;
  dynamic taxIdNumber;
  String? brandDescription;
  String? brandLogoImagePath;
  int? brandStatusId;
  dynamic brandStoreAddressId;
  int? brandCategoryId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? brandSellerId;
  dynamic brandId;
  dynamic slashContractPath;
  int? brandRating;
  int? daysLimitToReturn;
  dynamic planId;


}

class Pagination {
  Pagination({
      this.pages,});

  Pagination.fromJson(dynamic json) {
    pages = json['pages'];
  }
  dynamic pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pages'] = pages;
    return map;
  }

}