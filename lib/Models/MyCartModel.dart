class MyCartModel {
  int? status;
  Data? data;
  String? message;

  MyCartModel({this.status, this.data, this.message});

  MyCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? cartSubTotal;
  String? cartTotal;
  Null couponId;
  String? couponDiscountAmount;
  Null couponDiscountType;
  Null deletedAt;
  String? createdAt;
  String? updatedAt;
  List<CartItem>? cartItem;

  Data(
      {this.id,
        this.userId,
        this.cartSubTotal,
        this.cartTotal,
        this.couponId,
        this.couponDiscountAmount,
        this.couponDiscountType,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.cartItem});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cartSubTotal = json['cart_sub_total'];
    cartTotal = json['cart_total'];
    couponId = json['coupon_id'];
    couponDiscountAmount = json['coupon_discount_amount'];
    couponDiscountType = json['coupon_discount_type'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['cart_item'] != null) {
      cartItem = <CartItem>[];
      json['cart_item'].forEach((v) {
        cartItem!.add(CartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['cart_sub_total'] = cartSubTotal;
    data['cart_total'] = cartTotal;
    data['coupon_id'] = couponId;
    data['coupon_discount_amount'] = couponDiscountAmount;
    data['coupon_discount_type'] = couponDiscountType;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (cartItem != null) {
      data['cart_item'] = cartItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItem {
  int? id;
  int? cartId;
  int? productId;
  int? quantity;
  String? perProductPrice;
  String? totalProductPrice;
  String? perProductDiscount;
  Null deletedAt;
  String? createdAt;
  String? updatedAt;
  Product? product;

  CartItem(
      {this.id,
        this.cartId,
        this.productId,
        this.quantity,
        this.perProductPrice,
        this.totalProductPrice,
        this.perProductDiscount,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.product});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    perProductPrice = json['per_product_price'];
    totalProductPrice = json['total_product_price'];
    perProductDiscount = json['per_product_discount'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cart_id'] = cartId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['per_product_price'] = perProductPrice;
    data['total_product_price'] = totalProductPrice;
    data['per_product_discount'] = perProductDiscount;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
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
  int? price;
  int? discountedPrice;
  Null drugInteractions;
  Null sideEffects;
  Null productManufactured;
  Null saltComposition;
  int? ordering;
  String? status;
  String? images;
  String? soldOut;
  String? isPopular;
  Null deletedAt;
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
        this.category});

  Product.fromJson(Map<String, dynamic> json) {
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
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['price'] = price;
    data['discounted_price'] = discountedPrice;
    data['drug_interactions'] = drugInteractions;
    data['side_effects'] = sideEffects;
    data['product_manufactured'] = productManufactured;
    data['salt_composition'] = saltComposition;
    data['ordering'] = ordering;
    data['status'] = status;
    data['images'] = images;
    data['sold_out'] = soldOut;
    data['is_popular'] = isPopular;
    data['deleted_at'] = deletedAt;
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
  String? showOnApp;
  Null deletedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['ordering'] = ordering;
    data['status'] = status;
    data['show_on_app'] = showOnApp;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
