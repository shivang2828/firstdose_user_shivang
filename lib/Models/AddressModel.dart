// class AddressModel {
//   int? status;
//   List<Data>? data;
//   String? message;
//
//   AddressModel({this.status, this.data, this.message});
//
//   AddressModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = message;
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   int? userId;
//   String? name;
//   int? phoneNumber;
//   String? country;
//   String? state;
//   String? city;
//   String? pinCode;
//   String? landmark;
//   String? fullAddress;
//   String? addressType;
//   String? latitude;
//   String? longitude;
//   Null deletedAt;
//   String? createdAt;
//   String? updatedAt;
//   User? user;
//
//   Data(
//       {this.id,
//         this.userId,
//         this.name,
//         this.phoneNumber,
//         this.country,
//         this.state,
//         this.city,
//         this.pinCode,
//         this.landmark,
//         this.fullAddress,
//         this.addressType,
//         this.latitude,
//         this.longitude,
//         this.deletedAt,
//         this.createdAt,
//         this.updatedAt,
//         this.user});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     name = json['name'];
//     phoneNumber = json['phone_number'];
//     country = json['country'];
//     state = json['state'];
//     city = json['city'];
//     pinCode = json['pin_code'];
//     landmark = json['landmark'];
//     fullAddress = json['full_address'];
//     addressType = json['address_type'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     deletedAt = json['deleted_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['name'] = name;
//     data['phone_number'] = phoneNumber;
//     data['country'] = country;
//     data['state'] = state;
//     data['city'] = city;
//     data['pin_code'] = pinCode;
//     data['landmark'] = landmark;
//     data['full_address'] = fullAddress;
//     data['address_type'] = addressType;
//     data['latitude'] = latitude;
//     data['longitude'] = longitude;
//     data['deleted_at'] = deletedAt;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     return data;
//   }
// }
//
// class User {
//   int? id;
//   String? userType;
//   Null name;
//   Null email;
//   int? phoneNumber;
//   Null image;
//   Null permissions;
//   String? status;
//   String? deviceDetails;
//   String? appVersion;
//   String? apiVersion;
//   String? deviceType;
//   String? deviceId;
//   String? lastLogin;
//   Null reasonForDeleteAccount;
//   Null deletedAt;
//   String? createdAt;
//   String? updatedAt;
//
//   User(
//       {this.id,
//         this.userType,
//         this.name,
//         this.email,
//         this.phoneNumber,
//         this.image,
//         this.permissions,
//         this.status,
//         this.deviceDetails,
//         this.appVersion,
//         this.apiVersion,
//         this.deviceType,
//         this.deviceId,
//         this.lastLogin,
//         this.reasonForDeleteAccount,
//         this.deletedAt,
//         this.createdAt,
//         this.updatedAt});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userType = json['user_type'];
//     name = json['name'];
//     email = json['email'];
//     phoneNumber = json['phone_number'];
//     image = json['image'];
//     permissions = json['permissions'];
//     status = json['status'];
//     deviceDetails = json['device_details'];
//     appVersion = json['app_version'];
//     apiVersion = json['api_version'];
//     deviceType = json['device_type'];
//     deviceId = json['device_id'];
//     lastLogin = json['last_login'];
//     reasonForDeleteAccount = json['reason_for_delete_account'];
//     deletedAt = json['deleted_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_type'] = userType;
//     data['name'] = name;
//     data['email'] = email;
//     data['phone_number'] = phoneNumber;
//     data['image'] = image;
//     data['permissions'] = permissions;
//     data['status'] = status;
//     data['device_details'] = deviceDetails;
//     data['app_version'] = appVersion;
//     data['api_version'] = apiVersion;
//     data['device_type'] = deviceType;
//     data['device_id'] = deviceId;
//     data['last_login'] = lastLogin;
//     data['reason_for_delete_account'] = reasonForDeleteAccount;
//     data['deleted_at'] = deletedAt;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
class AddressModel {
  int? status;
  List<Data>? data;
  String? message;

  AddressModel({this.status, this.data, this.message});

  AddressModel.fromJson(Map<String, dynamic> json) {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
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
