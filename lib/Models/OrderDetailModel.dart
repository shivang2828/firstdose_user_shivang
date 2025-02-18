class OrderDetailModel {
  int? status;
  Data? data;
  String? message;

  OrderDetailModel({this.status, this.data, this.message});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  Null? orderDescription;
  Null? prescriptionId;
  Null? bill;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Null? merchantDetail;
  Address? address;
  Null? coupon;
  List<OrderItem>? orderItem;
  Null? prescription;
  List<Payment>? payment;

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
        this.merchantDetail,
        this.address,
        this.coupon,
        this.orderItem,
        this.prescription,
        this.payment});

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
    merchantDetail = json['merchant_detail'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    coupon = json['coupon'];
    if (json['order_item'] != null) {
      orderItem = <OrderItem>[];
      json['order_item'].forEach((v) {
        orderItem!.add(new OrderItem.fromJson(v));
      });
    }
    prescription = json['prescription'];
    if (json['payment'] != null) {
      payment = <Payment>[];
      json['payment'].forEach((v) {
        payment!.add(new Payment.fromJson(v));
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
    data['merchant_detail'] = this.merchantDetail;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['coupon'] = this.coupon;
    if (this.orderItem != null) {
      data['order_item'] = this.orderItem!.map((v) => v.toJson()).toList();
    }
    data['prescription'] = this.prescription;
    if (this.payment != null) {
      data['payment'] = this.payment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  int? userId;
  String? name;
  int? phoneNumber;
  String? country;
  String? state;
  String? city;
  String? pinCode;
  String? landmark;
  String? fullAddress;
  String? addressType;
  String? latitude;
  String? longitude;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  User? user;

  Address(
      {this.id,
        this.userId,
        this.name,
        this.phoneNumber,
        this.country,
        this.state,
        this.city,
        this.pinCode,
        this.landmark,
        this.fullAddress,
        this.addressType,
        this.latitude,
        this.longitude,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.user});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pinCode = json['pin_code'];
    landmark = json['landmark'];
    fullAddress = json['full_address'];
    addressType = json['address_type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pin_code'] = this.pinCode;
    data['landmark'] = this.landmark;
    data['full_address'] = this.fullAddress;
    data['address_type'] = this.addressType;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? userType;
  Null? name;
  Null? email;
  int? phoneNumber;
  Null? image;
  Null? permissions;
  String? status;
  String? deviceDetails;
  String? appVersion;
  String? apiVersion;
  String? deviceType;
  String? deviceId;
  String? lastLogin;
  Null? reasonForDeleteAccount;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.userType,
        this.name,
        this.email,
        this.phoneNumber,
        this.image,
        this.permissions,
        this.status,
        this.deviceDetails,
        this.appVersion,
        this.apiVersion,
        this.deviceType,
        this.deviceId,
        this.lastLogin,
        this.reasonForDeleteAccount,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    image = json['image'];
    permissions = json['permissions'];
    status = json['status'];
    deviceDetails = json['device_details'];
    appVersion = json['app_version'];
    apiVersion = json['api_version'];
    deviceType = json['device_type'];
    deviceId = json['device_id'];
    lastLogin = json['last_login'];
    reasonForDeleteAccount = json['reason_for_delete_account'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['image'] = this.image;
    data['permissions'] = this.permissions;
    data['status'] = this.status;
    data['device_details'] = this.deviceDetails;
    data['app_version'] = this.appVersion;
    data['api_version'] = this.apiVersion;
    data['device_type'] = this.deviceType;
    data['device_id'] = this.deviceId;
    data['last_login'] = this.lastLogin;
    data['reason_for_delete_account'] = this.reasonForDeleteAccount;
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

class Payment {
  String? title;
  String? amount;

  Payment({this.title, this.amount});

  Payment.fromJson(Map<String, dynamic> json) {
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
