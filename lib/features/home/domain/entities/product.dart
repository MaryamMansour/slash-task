class Respone {
  Respone({
      this.message,
      this.product,});

  Respone.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      product = [];
      json['data'].forEach((v) {
        product?.add(Product.fromJson(v));
      });
    }
  }

  String? message;
  List<Product>? product;



}

class Product {
  Product({
      this.id,
      this.name,
      this.description,
      this.productRating,
      this.brands,
      this.productVariations,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    productRating = json['product_rating'];
    brands = json['Brands'] != null ? Brand.fromJson(json['Brands']) : null;
    if (json['ProductVariations'] != null) {
      productVariations = [];
      json['ProductVariations'].forEach((v) {
        productVariations?.add(ProductVariations.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? description;
  double? productRating;
  Brand? brands;
  List<ProductVariations>? productVariations;


}

class SubCategories {
  SubCategories({
      this.id, 
      this.name, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.categoryId, 
      this.imagePath,});

  SubCategories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    categoryId = json['category_id'];
    imagePath = json['image_path'];
  }
  int? id;
  String? name;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? categoryId;
  String? imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['deletedAt'] = deletedAt;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['category_id'] = categoryId;
    map['image_path'] = imagePath;
    return map;
  }

}

class ProductVariations {
  ProductVariations({
      this.id, 
      this.productId, 
      this.price, 
      this.quantity,
      this.productVarientImages,});

  ProductVariations.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
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
  bool? inStock;
  List<ProductVarientImages>? productVarientImages;


}

class ProductVarientImages {
  ProductVarientImages({
      this.imagePath,});

  ProductVarientImages.fromJson(dynamic json) {
    imagePath = json['image_path'];
  }

  String? imagePath;



}


class Brand {
  Brand({
      this.id, 
      this.brandName,
      this.brandLogoImagePath,
     });

  Brand.fromJson(dynamic json) {
    id = json['id'];
    brandName = json['brand_name'];
    brandLogoImagePath = json['brand_logo_image_path'];

  }
  int? id;
  String? brandName;
  String? brandLogoImagePath;


}
