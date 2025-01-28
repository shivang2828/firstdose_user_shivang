import '../Views/Dashboard/Profile/Profile.dart';

class SiteSeetingModel {
  int? status;
  Data? data;
  String? message;

  SiteSeetingModel({this.status, this.data, this.message});

  SiteSeetingModel.fromJson(Map<String, dynamic> json) {
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
  String? termsAndCondition;
  String? privacyPolicy;
  String? contactUs;
  String? faq;
  Profile? profile;
  int? cartQuantity;
  int? updateAndroid;
  int? updateIos;
  String? updateLinkAndroid;
  String? updateLinkIos;
  String? updateMessage;
  int? isCancelShow;

  Data(
      {this.termsAndCondition,
      this.privacyPolicy,
      this.contactUs,
      this.faq,
      this.profile,
      this.cartQuantity,
      this.updateAndroid,
      this.updateIos,
      this.updateLinkAndroid,
      this.updateLinkIos,
      this.updateMessage,
      this.isCancelShow});

  Data.fromJson(Map<String, dynamic> json) {
    termsAndCondition = json['terms_and_condition'];
    privacyPolicy = json['privacy_policy'];
    contactUs = json['contact_us'];
    faq = json['faq'];
    // profile = json['profile'] != null ? new Profile!.fromJson(json['profile']) : null;
    cartQuantity = json['cart_quantity'];
    updateAndroid = json['update_android'];
    updateIos = json['update_ios'];
    updateLinkAndroid = json['update_link_android'];
    updateLinkIos = json['update_link_ios'];
    updateMessage = json['update_message'];
    isCancelShow = json['is_cancel_show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['terms_and_condition'] = termsAndCondition;
    data['privacy_policy'] = privacyPolicy;
    data['contact_us'] = contactUs;
    data['faq'] = faq;
    // if (this.profile != null) {
    //   data['profile'] = this.profile!.toJson();
    // }
    data['cart_quantity'] = cartQuantity;
    data['update_android'] = updateAndroid;
    data['update_ios'] = updateIos;
    data['update_link_android'] = updateLinkAndroid;
    data['update_link_ios'] = updateLinkIos;
    data['update_message'] = updateMessage;
    data['is_cancel_show'] = isCancelShow;
    return data;
  }
}

// class Profile {
//
//
//   Profile({
//
// });
//
// Profile.fromJson(Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// return data;
// }
// }
