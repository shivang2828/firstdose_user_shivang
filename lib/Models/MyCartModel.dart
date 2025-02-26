import 'package:get/get.dart';

class MyCartModel {
  int? status;
  CartData? data;
  String? message;

  MyCartModel({this.status, this.data, this.message});

  MyCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new CartData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}
// class CartData {
//   int? id;
//   int? userId;
//   String? cartSubTotal;
//   String? cartTotal;
//   String? deletedAt;
//   String? createdAt;
//   String? updatedAt;
//   Coupon? coupon;
//   List<CartItem>? cartItem;
//   List<Payments>? payments;
//
//   CartData(
//       {this.id,
//         this.userId,
//         this.cartSubTotal,
//         this.cartTotal,
//         this.deletedAt,
//         this.createdAt,
//         this.updatedAt,
//         this.cartItem,
//         this.coupon,
//         this.payments});
//
//   CartData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     cartSubTotal = json['cart_sub_total'];
//     cartTotal = json['cart_total'];
//     deletedAt = json['deleted_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     coupon =
//     json['coupon'] != null ? new Coupon.fromJson(json['coupon']) : null;
//     /* if (json['coupon'] != null) {
//       coupon = <Coupon>[];
//       json['coupon'].forEach((v) {
//         coupon!.add(new Coupon.fromJson(v));
//       });
//     }*/
//     if (json['cart_item'] != null) {
//       cartItem = <CartItem>[];
//       json['cart_item'].forEach((v) {
//         cartItem!.add(new CartItem.fromJson(v));
//       });
//     }
//     if (json['payments'] != null) {
//       payments = <Payments>[];
//       json['payments'].forEach((v) {
//         payments!.add(new Payments.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['cart_sub_total'] = this.cartSubTotal;
//     data['cart_total'] = this.cartTotal;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     // data['coupon'] = this.coupon;
//     if (this.coupon != null) {
//       data['coupon'] = this.coupon!.toJson();
//     }
//     // data['coupon'] = this.coupon!.map((v) => v.toJson());
//     // if (this.coupon != null) {
//     //   data['coupon'] = this.coupon!.map((v) => v.toJson()).toList();
//     // }
//     if (this.cartItem != null) {
//       data['cart_item'] = this.cartItem!.map((v) => v.toJson()).toList();
//     }
//     if (this.payments != null) {
//       data['payments'] = this.payments!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }



class CartData {
  RxInt id = 0.obs;
  int? userId;
  String? cartSubTotal;
  String? cartTotal;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  Coupon? coupon;
  List<CartItem>? cartItem;
  List<Payments>? payments;

  CartData(
      {int? id,
        this.userId,
        this.cartSubTotal,
        this.cartTotal,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.cartItem,
        this.coupon,
        this.payments}) {
    if (id != null) {
      this.id.value = id;
    }
  }

  CartData.fromJson(Map<String, dynamic> json) {
    id.value = json['id'] ?? 0;
    userId = json['user_id'];
    cartSubTotal = json['cart_sub_total'];
    cartTotal = json['cart_total'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;

    if (json['cart_item'] != null) {
      cartItem = <CartItem>[];
      json['cart_item'].forEach((v) {
        cartItem!.add(CartItem.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.value;
    data['user_id'] = userId;
    data['cart_sub_total'] = cartSubTotal;
    data['cart_total'] = cartTotal;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    if (cartItem != null) {
      data['cart_item'] = cartItem!.map((v) => v.toJson()).toList();
    }
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class CartItem {
  int? id;
  int? cartId;
  int? productId;
  var quantity = 0.obs;
  String? perProductPrice;
  String? totalProductPrice;
  String? perProductDiscount;
  String? original_price;
  String? discounted_price;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  Product? product;

  CartItem(
      {this.id,
        this.cartId,
        this.productId,
        required this.quantity,
        this.perProductPrice,
        this.totalProductPrice,
        this.perProductDiscount,
        this.original_price,
        this.discounted_price,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.product});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    quantity.value = json['quantity'];
    perProductPrice = json['per_product_price'];
    discounted_price = json['discounted_price'];
    original_price = json['original_price'];
    totalProductPrice = json['total_product_price'];
    perProductDiscount = json['per_product_discount'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cart_id'] = this.cartId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['per_product_price'] = this.perProductPrice;
    data['discounted_price'] = this.discounted_price;
    data['original_price'] = this.original_price;
    data['total_product_price'] = this.totalProductPrice;
    data['per_product_discount'] = this.perProductDiscount;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? categoryId;
  String? name;
  String? shortDescription;
  String? description;

  dynamic price;
  int? discountedPrice;
  int? ordering;
  String? status;
  String? images;
  String? soldOut;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  Category? category;

  Product(
      {this.id,
        this.categoryId,
        this.name,
        this.shortDescription,
        this.description,
        this.price,
        this.discountedPrice,
        this.ordering,
        this.status,
        this.images,
        this.soldOut,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];

    price = json['price'];
    discountedPrice = json['discounted_price'];
    ordering = json['ordering'];
    status = json['status'];
    images = json['images'];
    soldOut = json['sold_out'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    data['ordering'] = this.ordering;
    data['status'] = this.status;
    data['images'] = this.images;
    data['sold_out'] = this.soldOut;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.name,
        this.image,
        this.ordering,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    ordering = json['ordering'];
    status = json['status'];
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
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Payments {
  String? title;
  String? amount;

  Payments({this.title, this.amount});

  Payments.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['amount'] = this.amount;
    return data;
  }
}

class Coupon {
  int? id;
  String? header;
  String? tag;
  String? description;
  String? couponCode;
  String? couponType;
  String? discountAmount;
  String? minimumCartAmount;
  String? maxDiscountAmount;
  String? startDate;
  String? expireDate;
  String? termsConditions;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Coupon(
      {this.id,
        this.header,
        this.tag,
        this.description,
        this.couponCode,
        this.couponType,
        this.discountAmount,
        this.minimumCartAmount,
        this.maxDiscountAmount,
        this.startDate,
        this.expireDate,
        this.termsConditions,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    tag = json['tag'];
    description = json['description'];
    couponCode = json['coupon_code'];
    couponType = json['coupon_type'];
    discountAmount = json['discount_amount'];
    minimumCartAmount = json['minimum_cart_amount'];
    maxDiscountAmount = json['max_discount_amount'];
    startDate = json['start_date'];
    expireDate = json['expire_date'];
    termsConditions = json['terms_conditions'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['tag'] = this.tag;
    data['description'] = this.description;
    data['coupon_code'] = this.couponCode;
    data['coupon_type'] = this.couponType;
    data['discount_amount'] = this.discountAmount;
    data['minimum_cart_amount'] = this.minimumCartAmount;
    data['max_discount_amount'] = this.maxDiscountAmount;
    data['start_date'] = this.startDate;
    data['expire_date'] = this.expireDate;
    data['terms_conditions'] = this.termsConditions;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
