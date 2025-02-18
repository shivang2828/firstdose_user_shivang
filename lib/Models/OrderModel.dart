class OrderModel {
  int? status;
  int? perPageData;
  int? totalData;
  String? page;
  List<Data>? data;
  String? message;

  OrderModel(
      {this.status,
        this.perPageData,
        this.totalData,
        this.page,
        this.data,
        this.message});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    perPageData = json['per_page_data'];
    totalData = json['total_data'];
    page = json['page'];
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
    data['per_page_data'] = this.perPageData;
    data['total_data'] = this.totalData;
    data['page'] = this.page;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? orderType;
  int? userId;
  int? cartId;
  int? addressId;
  Null? merchantDetailId;
  String? orderUniqueId;
  String? totalPaidAmount;
  String? orderSubTotal;
  String? orderTotal;
  Null? couponId;
  String? totalCouponDiscountAmount;
  String? totalItemDiscount;
  String? orderStatus;
  Null? masterId;
  String? paymentStatus;
  String? orderDescription;
  int? prescriptionId;
  Null? bill;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Prescription? prescription;
  List<OrderItem>? orderItem;

  Data(
      {this.id,
        this.orderType,
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
        this.masterId,
        this.paymentStatus,
        this.orderDescription,
        this.prescriptionId,
        this.bill,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.prescription,
        this.orderItem});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderType = json['order_type'];
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
    masterId = json['master_id'];
    paymentStatus = json['payment_status'];
    orderDescription = json['order_description'];
    prescriptionId = json['prescription_id'];
    bill = json['bill'];
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
    data['order_type'] = this.orderType;
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
    data['master_id'] = this.masterId;
    data['payment_status'] = this.paymentStatus;
    data['order_description'] = this.orderDescription;
    data['prescription_id'] = this.prescriptionId;
    data['bill'] = this.bill;
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
    files = json['files'].cast<String>();
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
  int? id;
  int? orderId;
  int? productId;
  String? totalPrice;
  String? totalDiscountedPrice;
  int? quantity;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
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
  int? id;
  String? orderType;
  int? userId;
  int? cartId;
  int? addressId;
  Null? merchantDetailId;
  String? orderUniqueId;
  String? totalPaidAmount;
  String? orderSubTotal;
  String? orderTotal;
  Null? couponId;
  String? totalCouponDiscountAmount;
  String? totalItemDiscount;
  String? orderStatus;
  Null? masterId;
  String? paymentStatus;
  Null? orderDescription;
  Null? prescriptionId;
  Null? bill;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
        this.orderType,
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
        this.masterId,
        this.paymentStatus,
        this.orderDescription,
        this.prescriptionId,
        this.bill,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderType = json['order_type'];
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
    masterId = json['master_id'];
    paymentStatus = json['payment_status'];
    orderDescription = json['order_description'];
    prescriptionId = json['prescription_id'];
    bill = json['bill'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_type'] = this.orderType;
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
    data['master_id'] = this.masterId;
    data['payment_status'] = this.paymentStatus;
    data['order_description'] = this.orderDescription;
    data['prescription_id'] = this.prescriptionId;
    data['bill'] = this.bill;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  Null? drugInteractions;
  Null? sideEffects;
  Null? productManufactured;
  Null? saltComposition;
  int? ordering;
  String? status;
  List<String>? images;
  String? soldOut;
  String? isPopular;
  Null? deletedAt;
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
    images = json['images'].cast<String>();
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
