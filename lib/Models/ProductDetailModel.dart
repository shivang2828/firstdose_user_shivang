// import 'package:get/get.dart';
//
// class ProductDetailModel {
//   int? status;
//   Data? data;
//   String? message;
//
//     ProductDetailModel({this.status, this.data, this.message});
//
//   ProductDetailModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class Data {
//   List<Products>? products;
//
//   Data({this.products});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Products {
//   int? id;
//   int? categoryId;
//   String? name;
//   String? shortDescription;
//   String? description;
//   dynamic price;
//   String? discountedPrice;
//   String? salt_composition;
//   String? product_manufactured;
//   String? drug_interactions;
//   String? side_effects;
//   int? ordering;
//   var  cart_quantity = 0.obs;
//   // int? cart_id;
//   var cart_id = 0.obs;
//
//   String? status;
//   List<String>? images;
//   String? soldOut;
//   String? createdAt;
//   String? updatedAt;
//   Category? category;
//
//   Products(
//       {this.id,
//         this.categoryId,
//         this.name,
//         this.shortDescription,
//         this.description,
//         this.salt_composition,
//         this.product_manufactured,
//         this.side_effects,
//         this.price,
//         this.discountedPrice,
//         this.ordering,
//         this.drug_interactions,
//         required this.cart_quantity,
//         this.cart_id,
//         this.status,
//         this.images,
//         this.soldOut,
//         this.createdAt,
//         this.updatedAt,
//         this.category});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryId = json['category_id'];
//     name = json['name'] ?? '';
//     shortDescription = json['short_description'] ?? '';
//     description = json['description'] ?? '';
//     price = json['price'];
//     discountedPrice = json['discounted_price'] ?? '';
//     product_manufactured = json['product_manufactured'] ?? '';
//     drug_interactions = json['drug_interactions'] ?? '';
//     salt_composition = json['salt_composition'] ?? '';
//     side_effects = json['side_effects'] ?? '';
//     ordering = json['ordering'] ?? 0;
//     // cart_quantity = json['cart_quantity'] ?? 0;
//     // cart_quantity = (json['cart_quantity'] ?? 0).obs;
//     cart_quantity = RxInt(json['cart_quantity'] ?? 0);
//
//     cart_id = json['cart_id'] ?? 0;
//     status = json['status'] ?? '';
//     images = (json['images'] == null) ? [] : json['images'].cast<String>();
//     soldOut = json['sold_out'] ?? '';
//     createdAt = json['created_at'] ?? '';
//     updatedAt = json['updated_at'] ?? '';
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_id'] = this.categoryId;
//     data['name'] = this.name;
//     data['short_description'] = this.shortDescription;
//     data['description'] = this.description;
//     data['salt_composition'] = this.salt_composition;
//     data['side_effects'] = this.side_effects;
//     data['product_manufactured'] = this.product_manufactured;
//     data['drug_interactions'] = this.drug_interactions;
//     data['price'] = this.price;
//     data['discounted_price'] = this.discountedPrice;
//     data['ordering'] = this.ordering;
//     data['cart_quantity'] = this.cart_quantity;
//     data['status'] = this.status;
//     data['images'] = this.images;
//     data['sold_out'] = this.soldOut;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.category != null) {
//       data['category'] = this.category!.toJson();
//     }
//     return data;
//   }
// }
//
// class Category {
//   int? id;
//   String? name;
//   String? image;
//   int? ordering;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//
//   Category(
//       {this.id,
//         this.name,
//         this.image,
//         this.ordering,
//         this.status,
//         this.createdAt,
//         this.updatedAt});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     ordering = json['ordering'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['ordering'] = this.ordering;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
import 'package:get/get.dart';

class ProductDetailModel {
  int? status;
  Data? data;
  String? message;

  ProductDetailModel({this.status, this.data, this.message});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  List<Products>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? categoryId;
  String? name;
  String? shortDescription;
  String? description;
  dynamic price;
  String? discountedPrice;
  String? saltComposition;
  String? productManufactured;
  String? drugInteractions;
  String? sideEffects;
  int? ordering;
  var cartQuantity = 0.obs; // Observable field
  var cartId = 0.obs; // Observable field
  String? status;
  List<String>? images;
  String? soldOut;
  String? createdAt;
  String? updatedAt;
  Category? category;

  Products({
    this.id,
    this.categoryId,
    this.name,
    this.shortDescription,
    this.description,
    this.saltComposition,
    this.productManufactured,
    this.sideEffects,
    this.price,
    this.discountedPrice,
    this.ordering,
    this.drugInteractions,
    required this.cartQuantity,
    required this.cartId,
    this.status,
    this.images,
    this.soldOut,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'] ?? '';
    shortDescription = json['short_description'] ?? '';
    description = json['description'] ?? '';
    price = json['price'];
    discountedPrice = json['discounted_price'] ?? '';
    productManufactured = json['product_manufactured'] ?? '';
    drugInteractions = json['drug_interactions'] ?? '';
    saltComposition = json['salt_composition'] ?? '';
    sideEffects = json['side_effects'] ?? '';
    ordering = json['ordering'] ?? 0;
    cartQuantity.value = json['cart_quantity'] ?? 0; // Assigning observable value
    cartId.value = json['cart_id'] ?? 0; // Assigning observable value
    status = json['status'] ?? '';
    images = (json['images'] == null) ? [] : json['images'].cast<String>();
    soldOut = json['sold_out'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['salt_composition'] = saltComposition;
    data['side_effects'] = sideEffects;
    data['product_manufactured'] = productManufactured;
    data['drug_interactions'] = drugInteractions;
    data['price'] = price;
    data['discounted_price'] = discountedPrice;
    data['ordering'] = ordering;
    data['cart_quantity'] = cartQuantity.value; // Extracting observable value
    data['cart_id'] = cartId.value; // Extracting observable value
    data['status'] = status;
    data['images'] = images;
    data['sold_out'] = soldOut;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  int? ordering;
  String? status;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.ordering, this.status, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    ordering = json['ordering'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['ordering'] = ordering;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
