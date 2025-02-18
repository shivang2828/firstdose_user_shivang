// // class WishListModel {
// //   int? status;
// //   Data? data;
// //   String? message;
// //
// //   WishListModel({this.status, this.data, this.message});
// //
// //   WishListModel.fromJson(Map<String, dynamic> json) {
// //     status = json['status'];
// //     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
// //     message = json['message'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['status'] = this.status;
// //     if (this.data != null) {
// //       data['data'] = this.data!.toJson();
// //     }
// //     data['message'] = this.message;
// //     return data;
// //   }
// // }
// //
// // class Data {
// //   List<Products>? products;
// //
// //   Data({this.products});
// //
// //   Data.fromJson(Map<String, dynamic> json) {
// //     if (json['products'] != null) {
// //       products = <Products>[];
// //       json['products'].forEach((v) {
// //         products!.add(new Products.fromJson(v));
// //       });
// //     }
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.products != null) {
// //       data['products'] = this.products!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Products {
// //   int? id;
// //   int? categoryId;
// //   String? name;
// //   Null? shortDescription;
// //   String? description;
// //   int? price;
// //   String? discountedPrice;
// //   Null? drugInteractions;
// //   Null? sideEffects;
// //   Null? productManufactured;
// //   Null? saltComposition;
// //   int? ordering;
// //   String? status;
// //   String? images;
// //   String? soldOut;
// //   String? isPopular;
// //   Null? deletedAt;
// //   String? createdAt;
// //   String? updatedAt;
// //   Category? category;
// //   String? originalPrice;
// //   int? cartQuantity;
// //   int? cartId;
// //
// //   Products(
// //       {this.id,
// //         this.categoryId,
// //         this.name,
// //         this.shortDescription,
// //         this.description,
// //         this.price,
// //         this.discountedPrice,
// //         this.drugInteractions,
// //         this.sideEffects,
// //         this.productManufactured,
// //         this.saltComposition,
// //         this.ordering,
// //         this.status,
// //         this.images,
// //         this.soldOut,
// //         this.isPopular,
// //         this.deletedAt,
// //         this.createdAt,
// //         this.updatedAt,
// //         this.category,
// //         this.originalPrice,
// //         this.cartQuantity,
// //         this.cartId});
// //
// //   Products.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     categoryId = json['category_id'];
// //     name = json['name'];
// //     shortDescription = json['short_description'];
// //     description = json['description'];
// //     price = json['price'];
// //     discountedPrice = json['discounted_price'];
// //     drugInteractions = json['drug_interactions'];
// //     sideEffects = json['side_effects'];
// //     productManufactured = json['product_manufactured'];
// //     saltComposition = json['salt_composition'];
// //     ordering = json['ordering'];
// //     status = json['status'];
// //     images = json['images'];
// //     soldOut = json['sold_out'];
// //     isPopular = json['is_popular'];
// //     deletedAt = json['deleted_at'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     category = json['category'] != null
// //         ? new Category.fromJson(json['category'])
// //         : null;
// //     originalPrice = json['original_price'];
// //     cartQuantity = json['cart_quantity'];
// //     cartId = json['cart_id'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['category_id'] = this.categoryId;
// //     data['name'] = this.name;
// //     data['short_description'] = this.shortDescription;
// //     data['description'] = this.description;
// //     data['price'] = this.price;
// //     data['discounted_price'] = this.discountedPrice;
// //     data['drug_interactions'] = this.drugInteractions;
// //     data['side_effects'] = this.sideEffects;
// //     data['product_manufactured'] = this.productManufactured;
// //     data['salt_composition'] = this.saltComposition;
// //     data['ordering'] = this.ordering;
// //     data['status'] = this.status;
// //     data['images'] = this.images;
// //     data['sold_out'] = this.soldOut;
// //     data['is_popular'] = this.isPopular;
// //     data['deleted_at'] = this.deletedAt;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     if (this.category != null) {
// //       data['category'] = this.category!.toJson();
// //     }
// //     data['original_price'] = this.originalPrice;
// //     data['cart_quantity'] = this.cartQuantity;
// //     data['cart_id'] = this.cartId;
// //     return data;
// //   }
// // }
// //
// // class Category {
// //   int? id;
// //   String? name;
// //   String? image;
// //   int? ordering;
// //   String? status;
// //   String? showOnApp;
// //   Null? deletedAt;
// //   String? createdAt;
// //   String? updatedAt;
// //
// //   Category(
// //       {this.id,
// //         this.name,
// //         this.image,
// //         this.ordering,
// //         this.status,
// //         this.showOnApp,
// //         this.deletedAt,
// //         this.createdAt,
// //         this.updatedAt});
// //
// //   Category.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     name = json['name'];
// //     image = json['image'];
// //     ordering = json['ordering'];
// //     status = json['status'];
// //     showOnApp = json['show_on_app'];
// //     deletedAt = json['deleted_at'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['name'] = this.name;
// //     data['image'] = this.image;
// //     data['ordering'] = this.ordering;
// //     data['status'] = this.status;
// //     data['show_on_app'] = this.showOnApp;
// //     data['deleted_at'] = this.deletedAt;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     return data;
// //   }
// // }
//
// class WishListModel {
//   int? status;
//   Data? data;
//   String? message;
//
//   WishListModel({this.status, this.data, this.message});
//
//   WishListModel.fromJson(Map<String, dynamic> json) {
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
//   int? cartQuantity;
//   int? cartId;
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


class WishListModel {
  int? status;
  List<Data>? data;
  String? message;

  WishListModel({this.status, this.data, this.message});

  WishListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
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
        products!.add(new Products.fromJson(v));
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

class Products {
  int? id;
  int? categoryId;
  String? name;
  String? shortDescription;
  String? description;
  int? price;
  String? discountedPrice;
  Null? drugInteractions;
  Null? sideEffects;
  Null? productManufactured;
  Null? saltComposition;
  int? ordering;
  String? status;
  String? images;
  String? soldOut;
  String? isPopular;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Category? category;
  String? originalPrice;
  int? cartQuantity;

  Products(
      {this.id,
        this.categoryId,
        this.name,
        this.shortDescription,
        this.description,
        this.price,
        this.discountedPrice,
        this.drugInteractions,
        this.sideEffects,
        this.productManufactured,
        this.saltComposition,
        this.ordering,
        this.status,
        this.images,
        this.soldOut,
        this.isPopular,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.originalPrice,
        this.cartQuantity});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    drugInteractions = json['drug_interactions'];
    sideEffects = json['side_effects'];
    productManufactured = json['product_manufactured'];
    saltComposition = json['salt_composition'];
    ordering = json['ordering'];
    status = json['status'];
    images = json['images'];
    soldOut = json['sold_out'];
    isPopular = json['is_popular'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    originalPrice = json['original_price'];
    cartQuantity = json['cart_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['drug_interactions'] = this.drugInteractions;
    data['side_effects'] = this.sideEffects;
    data['product_manufactured'] = this.productManufactured;
    data['salt_composition'] = this.saltComposition;
    data['ordering'] = this.ordering;
    data['status'] = this.status;
    data['images'] = this.images;
    data['sold_out'] = this.soldOut;
    data['is_popular'] = this.isPopular;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['original_price'] = this.originalPrice;
    data['cart_quantity'] = this.cartQuantity;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  int? ordering;
  String? status;
  String? showOnApp;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.name,
        this.image,
        this.ordering,
        this.status,
        this.showOnApp,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    ordering = json['ordering'];
    status = json['status'];
    showOnApp = json['show_on_app'];
    deletedAt = json['deleted_at'];
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
    data['show_on_app'] = this.showOnApp;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
