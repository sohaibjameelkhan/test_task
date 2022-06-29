// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.data,
    this.meta,
  });

  Data? data;
  Meta? meta;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "meta": meta!.toJson(),
      };
}

class Data {
  Data({
    this.accessToken,
    this.user,
  });

  String? accessToken;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.username,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.mobile,
    this.mobileVerifiedAt,
    this.apiToken,
    this.image,
    this.address,
    this.country,
    this.state,
    this.role,
    this.verified,
    this.lang,
    this.ltd,
    this.deviceToken,
    this.gender,
    this.type,
    this.customerId,
    this.provider,
    this.addedBy,
    this.rating,
    this.ratingCount,
    this.rememberToken,
  });

  int? id;
  String? username;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? mobile;
  bool? mobileVerifiedAt;
  dynamic apiToken;
  String? image;
  String? address;
  String? country;
  String? state;
  String? role;
  int? verified;
  String? lang;
  String? ltd;
  String? deviceToken;
  int? gender;
  dynamic type;
  dynamic customerId;
  dynamic provider;
  dynamic addedBy;
  String? rating;
  int? ratingCount;
  dynamic rememberToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        mobile: json["mobile"],
        mobileVerifiedAt: json["mobile_verified_at"],
        apiToken: json["api_token"],
        image: json["image"],
        address: json["address"],
        country: json["country"],
        state: json["state"],
        role: json["role"],
        verified: json["verified"],
        lang: json["lang"],
        ltd: json["ltd"],
        deviceToken: json["device_token"],
        gender: json["gender"],
        type: json["type"],
        customerId: json["customer_id"],
        provider: json["provider"],
        addedBy: json["added_by"],
        rating: json["rating"],
        ratingCount: json["rating count"],
        rememberToken: json["remember_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "mobile": mobile,
        "mobile_verified_at": mobileVerifiedAt,
        "api_token": apiToken,
        "image": image,
        "address": address,
        "country": country,
        "state": state,
        "role": role,
        "verified": verified,
        "lang": lang,
        "ltd": ltd,
        "device_token": deviceToken,
        "gender": gender,
        "type": type,
        "customer_id": customerId,
        "provider": provider,
        "added_by": addedBy,
        "rating": rating,
        "rating count": ratingCount,
        "remember_token": rememberToken,
      };
}

class Meta {
  Meta({
    this.message,
    this.status,
    this.errors,
  });

  String? message;
  int? status;
  List<dynamic>? errors;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        message: json["message"],
        status: json["status"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "errors": List<dynamic>.from(errors!.map((x) => x)),
      };
}
