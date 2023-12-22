class ProductDetails {
  ProductDetails({
      this.data, 
      this.message, 
      this.statusCode,});

  ProductDetails.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }
  Data? data;
  String? message;
  int? statusCode;
  ProductDetails copyWith({
    Data? data,
    String? message,
    int? statusCode,
  }) {
    return ProductDetails(
      data: data ?? this.data,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
    );
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.description, 
      this.brandId, 
      this.productRating,
      this.variations, 
      this.avaiableProperties, 
      this.brandName, 
      this.brandImage,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    brandId = json['brand_id'];
    productRating = json['product_rating'];
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations?.add(Variations.fromJson(v));
      });
    }
    if (json['avaiableProperties'] != null) {
      avaiableProperties = [];
      json['avaiableProperties'].forEach((v) {
        avaiableProperties?.add(AvaiableProperties.fromJson(v));
      });
    }
    brandName = json['brandName'];
    brandImage = json['brandImage'];
  }
  int? id;
  String? name;
  String? description;
  int? brandId;
  int? productRating;
  List<Variations>? variations;
  List<AvaiableProperties>? avaiableProperties;
  String? brandName;
  String? brandImage;

  Data copyWith({
    int? id,
    String? name,
    String? description,
    int? brandId,
    int? productRating,
    List<Variations>? variations,
    List<AvaiableProperties>? avaiableProperties,
    String? brandName,
    String? brandImage,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      brandId: brandId ?? this.brandId,
      productRating: productRating ?? this.productRating,
      variations: variations ?? this.variations,
      avaiableProperties: avaiableProperties ?? this.avaiableProperties,
      brandName: brandName ?? this.brandName,
      brandImage: brandImage ?? this.brandImage,
    );
  }

}

class AvaiableProperties {
  AvaiableProperties({
      this.property, 
      this.values,});

  AvaiableProperties.fromJson(dynamic json) {
    property = json['property'];
    if (json['values'] != null) {
      values = [];
      json['values'].forEach((v) {
        values?.add(Values.fromJson(v));
      });
    }
  }
  String? property;
  List<Values>? values;


}

class Values {
  Values({
      this.value, 
      this.id,});

  Values.fromJson(dynamic json) {
    value = json['value'];
    id = json['id'];
  }
  String? value;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['id'] = id;
    return map;
  }

}

class Variations {
  Variations({
      this.id, 
      this.price, 
      this.quantity, 
      this.inStock, 
      this.productVarientImages, 
      this.productPropertiesValues, 
   });

  Variations.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    inStock = json['inStock'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = [];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages?.add(ProductVarientImages2.fromJson(v));
      });
    }
    if (json['productPropertiesValues'] != null) {
      productPropertiesValues = [];
      json['productPropertiesValues'].forEach((v) {
        productPropertiesValues?.add(ProductPropertiesValues.fromJson(v));
      });
    }

  }
  int? id;
  int? price;
  int? quantity;
  bool? inStock;
  List<ProductVarientImages2>? productVarientImages;
  List<ProductPropertiesValues>? productPropertiesValues;

  Variations copyWith({
    int? id,
    int? price,
    int? quantity,
    bool? inStock,
    List<ProductVarientImages2>? productVarientImages,
    List<ProductPropertiesValues>? productPropertiesValues,
  }) {
    return Variations(
      id: id ?? this.id,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      inStock: inStock ?? this.inStock,
      productVarientImages: productVarientImages ?? this.productVarientImages,
      productPropertiesValues: productPropertiesValues ?? this.productPropertiesValues,
    );
  }



}

class ProductPropertiesValues {
  ProductPropertiesValues({
      this.value, 
      this.property,});

  ProductPropertiesValues.fromJson(dynamic json) {
    value = json['value'];
    property = json['property'];
  }
  String? value;
  String? property;



}

class ProductVarientImages2 {
  ProductVarientImages2({
      this.id, 
      this.imagePath,});

  ProductVarientImages2.fromJson(dynamic json) {
    id = json['id'];
    imagePath = json['image_path'];
  }
  int? id;
  String? imagePath;



}

