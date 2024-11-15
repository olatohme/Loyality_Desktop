// To parse this JSON data, do
//
//     final requestsModel = requestsModelFromJson(jsonString);

import 'dart:convert';

List<RequestsModel> requestsModelFromJson(String str) => List<RequestsModel>.from(json.decode(str).map((x) => RequestsModel.fromJson(x)));

String requestsModelToJson(List<RequestsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestsModel {
    int id;
    int userId;
    String details;
    dynamic status;
    DateTime createdAt;
    DateTime updatedAt;
    User user;

    RequestsModel({
        required this.id,
        required this.userId,
        required this.details,
        this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
    });

    factory RequestsModel.fromJson(Map<String, dynamic> json) => RequestsModel(
        id: json["id"],
        userId: json["user_id"],
        details: json["details"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "details": details,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
    };
}

class User {
    int id;
    String fname;
    String lname;
    int roleId;
    String email;
    String phoneNumber;
    String imgUrl;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.fname,
        required this.lname,
        required this.roleId,
        required this.email,
        required this.phoneNumber,
        required this.imgUrl,
        this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        roleId: json["role_id"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        imgUrl: json["img_url"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "role_id": roleId,
        "email": email,
        "phone_number": phoneNumber,
        "img_url": imgUrl,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
