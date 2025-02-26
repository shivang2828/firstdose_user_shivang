// import 'package:get/get.dart';
//
// class ProductModel {
//   int? status;
//   int? perPageData;
//   int? totalData;
//   String? page;
//   Data? data;
//   String? message;
//
//   ProductModel(
//       {this.status,
//         this.perPageData,
//         this.totalData,
//         this.page,
//         this.data,
//         this.message});
//
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     perPageData = json['per_page_data'];
//     totalData = json['total_data'];
//     page = json['page'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['per_page_data'] = this.perPageData;
//     data['total_data'] = this.totalData;
//     data['page'] = this.page;
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
//   int? price;
//   String? discountedPrice;
//   Null? drugInteractions;
//   Null? sideEffects;
//   Null? productManufactured;
//   Null? saltComposition;
//   int? ordering;
//   String? status;
//   String? images;
//   String? soldOut;
//   String? isPopular;
//   Null? deletedAt;
//   String? createdAt;
//   String? updatedAt;
//   Category? category;
//   String? originalPrice;
//   int? addedInWishlisht;
//   int? cartQuantity;
//   int? cartId;
//   RxBool buttonProcessing = false.obs;
//
//   Products(
//       {this.id,
//         this.categoryId,
//         this.name,
//         this.shortDescription,
//         this.description,
//         this.price,
//         this.discountedPrice,
//         this.drugInteractions,
//         this.sideEffects,
//         this.productManufactured,
//         this.saltComposition,
//         this.ordering,
//         this.status,
//         this.images,
//         this.soldOut,
//         this.isPopular,
//         this.deletedAt,
//         this.createdAt,
//         this.updatedAt,
//         this.category,
//         this.originalPrice,
//         this.addedInWishlisht,
//         this.cartQuantity,
//         this.cartId});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryId = json['category_id'];
//     name = json['name'];
//     shortDescription = json['short_description'];
//     description = json['description'];
//     price = json['price'];
//     discountedPrice = json['discounted_price'];
//     drugInteractions = json['drug_interactions'];
//     sideEffects = json['side_effects'];
//     productManufactured = json['product_manufactured'];
//     saltComposition = json['salt_composition'];
//     ordering = json['ordering'];
//     status = json['status'];
//     images = json['images'];
//     soldOut = json['sold_out'];
//     isPopular = json['is_popular'];
//     deletedAt = json['deleted_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//     originalPrice = json['original_price'];
//     addedInWishlisht = json['added_in_wishlisht'];
//     cartQuantity = json['cart_quantity'];
//     cartId = json['cart_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_id'] = this.categoryId;
//     data['name'] = this.name;
//     data['short_description'] = this.shortDescription;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['discounted_price'] = this.discountedPrice;
//     data['drug_interactions'] = this.drugInteractions;
//     data['side_effects'] = this.sideEffects;
//     data['product_manufactured'] = this.productManufactured;
//     data['salt_composition'] = this.saltComposition;
//     data['ordering'] = this.ordering;
//     data['status'] = this.status;
//     data['images'] = this.images;
//     data['sold_out'] = this.soldOut;
//     data['is_popular'] = this.isPopular;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.category != null) {
//       data['category'] = this.category!.toJson();
//     }
//     data['original_price'] = this.originalPrice;
//     data['added_in_wishlisht'] = this.addedInWishlisht;
//     data['cart_quantity'] = this.cartQuantity;
//     data['cart_id'] = this.cartId;
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
//   String? showOnApp;
//   Null? deletedAt;
//   String? createdAt;
//   String? updatedAt;
//
//   Category(
//       {this.id,
//         this.name,
//         this.image,
//         this.ordering,
//         this.status,
//         this.showOnApp,
//         this.deletedAt,
//         this.createdAt,
//         this.updatedAt});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     ordering = json['ordering'];
//     status = json['status'];
//     showOnApp = json['show_on_app'];
//     deletedAt = json['deleted_at'];
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
//     data['show_on_app'] = this.showOnApp;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ProductModel {
  int? status;
  dynamic per_page_data;
  dynamic total_data;
  dynamic page;
  Data? data;

  String? message;

  ProductModel(
      {this.status,
        this.data,
        this.message,
        this.total_data,
        this.per_page_data,
        this.page});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    page = json['page'];
    per_page_data = json['per_page_data'];
    total_data = json['total_data'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_data'] = this.total_data;
    data['page'] = this.page;
    data['per_page_data'] = this.per_page_data;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<ProductsListing>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsListing>[];
      json['products'].forEach((v) {
        products!.add(new ProductsListing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsListing {
  int? id;
  int? categoryId;
  var cart_quantity = 0.obs;
  var cart_id = 0.obs;
  String? name;
  String? shortDescription;
  String? description;
  dynamic price;
  String? discountedPrice;
  String? original_price;
  int? ordering;
  String? status;
  String? images;
  String? soldOut;
  String? createdAt;
  String? updatedAt;
  var added_in_wishlisht = 0.obs;
  RxBool buttonProcessing = false.obs;
  Category? category;

  ProductsListing(
      {this.id,
        this.categoryId,
        required this.cart_id,
        required this.cart_quantity,
        this.name,
        this.shortDescription,
        this.description,
        this.price,
        this.discountedPrice,
        this.original_price,
        this.ordering,
        this.status,
        this.images,
        this.soldOut,
        this.createdAt,
        this.updatedAt,
        required this.added_in_wishlisht,
        required this.buttonProcessing,
        this.category});

  ProductsListing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    cart_quantity.value = json['cart_quantity'];
    cart_id.value = json['cart_id'] ?? 0;
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    original_price = json['original_price'];
    ordering = json['ordering'];
    status = json['status'];
    images = json['images'];
    // images = json['images'].cast<String>();
    soldOut = json['sold_out'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    added_in_wishlisht.value = json['added_in_wishlisht'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['cart_quantity'] = this.cart_quantity;
    data['cart_id'] = this.cart_id.value;
    data['name'] = this.name;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['original_price'] = this.original_price;
    data['ordering'] = this.ordering;
    data['status'] = this.status;
    data['images'] = this.images;
    data['sold_out'] = this.soldOut;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['added_in_wishlisht'] = this.added_in_wishlisht;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
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

  Category(
      {this.id,
        this.name,
        this.image,
        this.ordering,
        this.status,
        this.createdAt,
        this.updatedAt});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['ordering'] = this.ordering;
    data['status'] = this.status;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
