// class SiteSettingModel {
//   int? status;
//   Data? data;
//   String? message;
//
//   SiteSettingModel({this.status, this.data, this.message});
//
//   SiteSettingModel.fromJson(Map<String, dynamic> json) {
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
//   String? termsAndCondition;
//   String? privacyPolicy;
//   String? contactUs;
//   String? faq;
//   Profile? profile;
//   int? cartQuantity;
//   int? updateAndroid;
//   int? updateIos;
//   String? updateLinkAndroid;
//   String? updateLinkIos;
//   String? updateMessage;
//   int? isCancelShow;
//
//   Data(
//       {this.termsAndCondition,
//       this.privacyPolicy,
//       this.contactUs,
//       this.faq,
//       this.profile,
//       this.cartQuantity,
//       this.updateAndroid,
//       this.updateIos,
//       this.updateLinkAndroid,
//       this.updateLinkIos,
//       this.updateMessage,
//       this.isCancelShow});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     termsAndCondition = json['terms_and_condition'];
//     privacyPolicy = json['privacy_policy'];
//     contactUs = json['contact_us'];
//     faq = json['faq'];
//     profile =
//         json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
//     cartQuantity = json['cart_quantity'];
//     updateAndroid = json['update_android'];
//     updateIos = json['update_ios'];
//     updateLinkAndroid = json['update_link_android'];
//     updateLinkIos = json['update_link_ios'];
//     updateMessage = json['update_message'];
//     isCancelShow = json['is_cancel_show'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['terms_and_condition'] = this.termsAndCondition;
//     data['privacy_policy'] = this.privacyPolicy;
//     data['contact_us'] = this.contactUs;
//     data['faq'] = this.faq;
//     if (this.profile != null) {
//       data['profile'] = this.profile!.toJson();
//     }
//     data['cart_quantity'] = this.cartQuantity;
//     data['update_android'] = this.updateAndroid;
//     data['update_ios'] = this.updateIos;
//     data['update_link_android'] = this.updateLinkAndroid;
//     data['update_link_ios'] = this.updateLinkIos;
//     data['update_message'] = this.updateMessage;
//     data['is_cancel_show'] = this.isCancelShow;
//     return data;
//   }
// }
//
// class Profile {
//   int? id;
//   String? userType;
//   String? name;
//   String? email;
//   int? phoneNumber;
//   String? image;
//   Null? permissions;
//   String? status;
//   String? deviceDetails;
//   String? appVersion;
//   String? apiVersion;
//   String? deviceType;
//   String? deviceId;
//   String? lastLogin;
//   Null? reasonForDeleteAccount;
//   Null? deletedAt;
//   String? createdAt;
//   String? updatedAt;
//
//   Profile(
//       {this.id,
//       this.userType,
//       this.name,
//       this.email,
//       this.phoneNumber,
//       this.image,
//       this.permissions,
//       this.status,
//       this.deviceDetails,
//       this.appVersion,
//       this.apiVersion,
//       this.deviceType,
//       this.deviceId,
//       this.lastLogin,
//       this.reasonForDeleteAccount,
//       this.deletedAt,
//       this.createdAt,
//       this.updatedAt});
//
//   Profile.fromJson(Map<String, dynamic> json) {
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
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_type'] = this.userType;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone_number'] = this.phoneNumber;
//     data['image'] = this.image;
//     data['permissions'] = this.permissions;
//     data['status'] = this.status;
//     data['device_details'] = this.deviceDetails;
//     data['app_version'] = this.appVersion;
//     data['api_version'] = this.apiVersion;
//     data['device_type'] = this.deviceType;
//     data['device_id'] = this.deviceId;
//     data['last_login'] = this.lastLogin;
//     data['reason_for_delete_account'] = this.reasonForDeleteAccount;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
class SiteSettingModel {
  int? status;
  Data? data;
  String? message;

  SiteSettingModel({this.status, this.data, this.message});

  SiteSettingModel.fromJson(Map<String, dynamic> json) {
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
  Profile? profile;
  int? cart_quantity;
  String? terms_and_condition;
  String? privacy_policy;
  String? faq;
  String? contact_us;
  String? updateLinkAndroid;
  String? updateLinkIos;
  String? updateMessage;
  int? updateAndroid;
  int? updateIos;
  int? isCancelShow;

  Data(
      {this.profile,
        this.cart_quantity,
        this.privacy_policy,
        this.contact_us,
        this.faq,
        this.updateAndroid,
        this.updateIos,
        this.updateMessage,
        this.isCancelShow,
        this.updateLinkAndroid,
        this.updateLinkIos,
        this.terms_and_condition});

  Data.fromJson(Map<String, dynamic> json) {
    cart_quantity = json['cart_quantity'];
    faq = json['faq'];
    privacy_policy = json['privacy_policy'];
    updateAndroid = json['update_android'] ?? 0;
    updateIos = json['update_ios'] ?? 0;
    updateMessage = json['update_message'] ?? '';
    isCancelShow = json['is_cancel_show'] ?? 0;
    updateLinkAndroid = json['update_link_android'] ?? '';
    updateLinkIos = json['update_link_ios'] ?? '';
    contact_us = json['contact_us'];
    terms_and_condition = json['terms_and_condition'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_qunatity'] = this.cart_quantity;
    data['terms_and_condition'] = this.terms_and_condition;
    data['update_link_android'] = this.updateLinkAndroid;
    data['update_link_ios'] = this.updateLinkIos;
    data['is_cancel_show'] = this.isCancelShow;
    data['update_message'] = this.updateMessage;
    data['update_ios'] = this.updateIos;
    data['update_android'] = this.updateAndroid;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? userType;
  String? name;
  String? email;
  int? phoneNumber;
  String? image;
  String? status;
  String? deviceDetails;
  String? appVersion;
  String? apiVersion;
  String? deviceType;
  String? deviceId;
  String? lastLogin;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
        this.userType,
        this.name,
        this.email,
        this.phoneNumber,
        this.image,
        this.status,
        this.deviceDetails,
        this.appVersion,
        this.apiVersion,
        this.deviceType,
        this.deviceId,
        this.lastLogin,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    image = json['image'];
    status = json['status'];
    deviceDetails = json['device_details'];
    appVersion = json['app_version'];
    apiVersion = json['api_version'];
    deviceType = json['device_type'];
    deviceId = json['device_id'];
    lastLogin = json['last_login'];
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
    data['status'] = this.status;
    data['device_details'] = this.deviceDetails;
    data['app_version'] = this.appVersion;
    data['api_version'] = this.apiVersion;
    data['device_type'] = this.deviceType;
    data['device_id'] = this.deviceId;
    data['last_login'] = this.lastLogin;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
