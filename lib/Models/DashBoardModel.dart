class DashBoardModel {
  int? status;
  Data? data;
  String? message;

  DashBoardModel({this.status, this.data, this.message});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
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
  List<Null>? banners;
  List<Categories>? categories;
  List<PopularProducts>? popularProducts;

  Data({this.banners, this.categories, this.popularProducts});

  Data.fromJson(Map<String, dynamic> json) {
    // if (json['banners'] != null) {
    //   banners = <Null>[];
    //   json['banners'].forEach((v) {
    //     banners!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['popular_products'] != null) {
      popularProducts = <PopularProducts>[];
      json['popular_products'].forEach((v) {
        popularProducts!.add(PopularProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (this.banners != null) {
    //   data['banners'] = this.banners!.map((v) => v?.toJson()).toList();
    // }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (popularProducts != null) {
      data['popular_products'] =
          popularProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;
  int? ordering;
  String? status;
  String? showOnApp;
  Null deletedAt;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
        this.name,
        this.image,
        this.ordering,
        this.status,
        this.showOnApp,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
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

class PopularProducts {
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
  Categories? category;
  int? addedInWishlisht;

  PopularProducts(
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
        this.addedInWishlisht});

  PopularProducts.fromJson(Map<String, dynamic> json) {
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
        ? Categories.fromJson(json['category'])
        : null;
    addedInWishlisht = json['added_in_wishlisht'];
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
    data['added_in_wishlisht'] = addedInWishlisht;
    return data;
  }
}
