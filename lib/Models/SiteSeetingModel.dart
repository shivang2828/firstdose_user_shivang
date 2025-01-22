import '../Views/Dashboard/Profile/Profile.dart';

class SiteSeetingModel {
  int? status;
  Data? data;
  String? message;

  SiteSeetingModel({this.status, this.data, this.message});

  SiteSeetingModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['terms_and_condition'] = this.termsAndCondition;
    data['privacy_policy'] = this.privacyPolicy;
    data['contact_us'] = this.contactUs;
    data['faq'] = this.faq;
    // if (this.profile != null) {
    //   data['profile'] = this.profile!.toJson();
    // }
    data['cart_quantity'] = this.cartQuantity;
    data['update_android'] = this.updateAndroid;
    data['update_ios'] = this.updateIos;
    data['update_link_android'] = this.updateLinkAndroid;
    data['update_link_ios'] = this.updateLinkIos;
    data['update_message'] = this.updateMessage;
    data['is_cancel_show'] = this.isCancelShow;
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
