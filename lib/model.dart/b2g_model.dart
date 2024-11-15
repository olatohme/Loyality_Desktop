// To parse this JSON data, do
//
//     final b2GModel = b2GModelFromJson(jsonString);

import 'dart:convert';

List<B2GModel> b2GModelFromJson(String str) => List<B2GModel>.from(json.decode(str).map((x) => B2GModel.fromJson(x)));

String b2GModelToJson(List<B2GModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class B2GModel {
    int id;
    int customerId;
    int bonus;
    int gems;
    DateTime createdAt;
    DateTime updatedAt;
    Customer customer;

    B2GModel({
        required this.id,
        required this.customerId,
        required this.bonus,
        required this.gems,
        required this.createdAt,
        required this.updatedAt,
        required this.customer,
    });

    factory B2GModel.fromJson(Map<String, dynamic> json) => B2GModel(
        id: json["id"],
        customerId: json["customer_id"],
        bonus: json["bonus"],
        gems: json["gems"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customer: Customer.fromJson(json["customer"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "bonus": bonus,
        "gems": gems,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "customer": customer.toJson(),
    };
}

class Customer {
    int id;
    int userId;
    int segmentationId;
    String? nickName;
    int curBonus;
    int totalBonus;
    int curGems;
    int totalGems;
    DateTime createdAt;
    DateTime updatedAt;
    User user;

    Customer({
        required this.id,
        required this.userId,
        required this.segmentationId,
        required this.nickName,
        required this.curBonus,
        required this.totalBonus,
        required this.curGems,
        required this.totalGems,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        userId: json["user_id"],
        segmentationId: json["segmentation_id"],
        nickName: json["nickName"],
        curBonus: json["cur_bonus"],
        totalBonus: json["total_bonus"],
        curGems: json["cur_gems"],
        totalGems: json["total_gems"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "segmentation_id": segmentationId,
        "nickName": nickName,
        "cur_bonus": curBonus,
        "total_bonus": totalBonus,
        "cur_gems": curGems,
        "total_gems": totalGems,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
    };
}

class User {
    int id;
    Fname fname;
    Lname lname;
    int roleId;
    dynamic email;
    String phoneNumber;
    ImgUrl imgUrl;
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
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fname: fnameValues.map[json["fname"]]!,
        lname: lnameValues.map[json["lname"]]!,
        roleId: json["role_id"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        imgUrl: imgUrlValues.map[json["img_url"]]!,
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fnameValues.reverse[fname],
        "lname": lnameValues.reverse[lname],
        "role_id": roleId,
        "email": email,
        "phone_number": phoneNumber,
        "img_url": imgUrlValues.reverse[imgUrl],
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum Fname {
    FOUAD,
    MHD_ALAA
}

final fnameValues = EnumValues({
    "fouad": Fname.FOUAD,
    "Mhd Alaa": Fname.MHD_ALAA
});

enum ImgUrl {
    UPLOADS_USERS_DEFAULT_JPG
}

final imgUrlValues = EnumValues({
    "uploads/users/default.jpg": ImgUrl.UPLOADS_USERS_DEFAULT_JPG
});

enum Lname {
    EMPTY,
    OLABI
}

final lnameValues = EnumValues({
    "": Lname.EMPTY,
    "Olabi": Lname.OLABI
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
