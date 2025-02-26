import 'package:get/get.dart';

class OrderModel {
  dynamic status;
  dynamic per_page_data;
  dynamic total_data;
  dynamic page;
  var data = [].obs;
  dynamic message;

  OrderModel(
      {this.status,
      required this.data,
      this.message,
      this.page,
      this.per_page_data,
      this.total_data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    page = json['page'];
    per_page_data = json['per_page_data'];
    total_data = json['total_data'];
    if (json['data'] != null) {
      data.value = <OrderData>[];
      json['data'].forEach((v) {
        data.add(new OrderData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_data'] = this.total_data;
    data['page'] = this.page;
    data['per_page_data'] = this.per_page_data;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class OrderData {
  dynamic id;
  dynamic userId;
  dynamic cartId;
  dynamic addressId;
  dynamic merchantDetailId;
  dynamic orderUniqueId;
  dynamic totalPaidAmount;
  dynamic order_type;
  dynamic orderSubTotal;
  dynamic orderTotal;
  dynamic couponId;
  dynamic totalCouponDiscountAmount;
  dynamic totalItemDiscount;
  dynamic orderStatus;
  dynamic order_description;
  dynamic paymentStatus;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;
  Prescription? prescription;
  List<OrderItem>? orderItem;

  OrderData(
      {this.id,
      this.userId,
      this.cartId,
      this.addressId,
      this.merchantDetailId,
      this.orderUniqueId,
      this.totalPaidAmount,
      this.order_type,
      this.orderSubTotal,
      this.orderTotal,
      this.couponId,
      this.totalCouponDiscountAmount,
      this.totalItemDiscount,
      this.order_description,
      this.orderStatus,
      this.paymentStatus,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.prescription,
      this.orderItem});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cartId = json['cart_id'];
    addressId = json['address_id'];
    merchantDetailId = json['merchant_detail_id'];
    orderUniqueId = json['order_unique_id'];
    totalPaidAmount = json['total_paid_amount'];
    order_type = json['order_type'];
    orderSubTotal = json['order_sub_total'];
    order_description = json['order_description'];
    orderTotal = json['order_total'];
    couponId = json['coupon_id'];
    totalCouponDiscountAmount = json['total_coupon_discount_amount'];
    totalItemDiscount = json['total_item_discount'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    prescription = json['prescription'] != null
        ? new Prescription.fromJson(json['prescription'])
        : null;
    if (json['order_item'] != null) {
      orderItem = <OrderItem>[];
      json['order_item'].forEach((v) {
        orderItem!.add(new OrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_type'] = this.order_type;
    data['cart_id'] = this.cartId;
    data['address_id'] = this.addressId;
    data['merchant_detail_id'] = this.merchantDetailId;
    data['order_unique_id'] = this.orderUniqueId;
    data['total_paid_amount'] = this.totalPaidAmount;
    data['order_sub_total'] = this.orderSubTotal;
    data['order_total'] = this.orderTotal;
    data['order_description'] = this.order_description;
    data['coupon_id'] = this.couponId;
    data['total_coupon_discount_amount'] = this.totalCouponDiscountAmount;
    data['total_item_discount'] = this.totalItemDiscount;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.prescription != null) {
      data['prescription'] = this.prescription!.toJson();
    }
    if (this.orderItem != null) {
      data['order_item'] = this.orderItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Prescription {
  int? id;
  int? userId;
  String? message;
  List<String>? files;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Prescription(
      {this.id,
      this.userId,
      this.message,
      this.files,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Prescription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    message = json['message'];
    files = (json['files'] == null) ? [] : json['files'].cast<String>();
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    data['files'] = this.files;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OrderItem {
  dynamic id;
  dynamic orderId;
  dynamic productId;
  dynamic totalPrice;
  dynamic totalDiscountedPrice;
  dynamic quantity;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;
  Order? order;
  Product? product;

  OrderItem(
      {this.id,
      this.orderId,
      this.productId,
      this.totalPrice,
      this.totalDiscountedPrice,
      this.quantity,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.order,
      this.product});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    totalPrice = json['total_price'];
    totalDiscountedPrice = json['total_discounted_price'];
    quantity = json['quantity'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['total_price'] = this.totalPrice;
    data['total_discounted_price'] = this.totalDiscountedPrice;
    data['quantity'] = this.quantity;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Order {
  dynamic id;
  dynamic userId;
  dynamic cartId;
  dynamic addressId;
  dynamic merchantDetailId;
  dynamic orderUniqueId;
  dynamic totalPaidAmount;
  dynamic orderSubTotal;
  dynamic orderTotal;
  dynamic couponId;
  dynamic totalCouponDiscountAmount;
  dynamic totalItemDiscount;
  dynamic orderStatus;
  dynamic paymentStatus;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;

  Order(
      {this.id,
      this.userId,
      this.cartId,
      this.addressId,
      this.merchantDetailId,
      this.orderUniqueId,
      this.totalPaidAmount,
      this.orderSubTotal,
      this.orderTotal,
      this.couponId,
      this.totalCouponDiscountAmount,
      this.totalItemDiscount,
      this.orderStatus,
      this.paymentStatus,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cartId = json['cart_id'];
    addressId = json['address_id'];
    merchantDetailId = json['merchant_detail_id'];
    orderUniqueId = json['order_unique_id'];
    totalPaidAmount = json['total_paid_amount'];
    orderSubTotal = json['order_sub_total'];
    orderTotal = json['order_total'];
    couponId = json['coupon_id'];
    totalCouponDiscountAmount = json['total_coupon_discount_amount'];
    totalItemDiscount = json['total_item_discount'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['cart_id'] = this.cartId;
    data['address_id'] = this.addressId;
    data['merchant_detail_id'] = this.merchantDetailId;
    data['order_unique_id'] = this.orderUniqueId;
    data['total_paid_amount'] = this.totalPaidAmount;
    data['order_sub_total'] = this.orderSubTotal;
    data['order_total'] = this.orderTotal;
    data['coupon_id'] = this.couponId;
    data['total_coupon_discount_amount'] = this.totalCouponDiscountAmount;
    data['total_item_discount'] = this.totalItemDiscount;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Product {
  dynamic id;
  dynamic categoryId;
  dynamic name;
  dynamic shortDescription;
  dynamic description;
  dynamic price;
  dynamic discountedPrice;
  dynamic drugInteractions;
  dynamic sideEffects;
  dynamic productManufactured;
  dynamic saltComposition;
  dynamic ordering;
  dynamic status;
  List<String>? images;
  dynamic soldOut;
  dynamic isPopular;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;
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
    images = (json['images'] == null) ? [] : json['images'].cast<String>();
    // = json['images'].cast<String>();
    soldOut = json['sold_out'];
    isPopular = json['is_popular'];
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
    return data;
  }
}

class Category {
  dynamic id;
  dynamic name;
  dynamic image;
  dynamic ordering;
  dynamic status;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;

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
