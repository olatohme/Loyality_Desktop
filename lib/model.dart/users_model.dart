// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

List<UsersModel> usersModelFromJson(String str) => List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
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
    Segmentation segmentation;
    List<Bonus2Gem> bonus2Gems;

    UsersModel({
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
        required this.segmentation,
        required this.bonus2Gems,
    });

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
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
        segmentation: Segmentation.fromJson(json["segmentation"]),
        bonus2Gems: List<Bonus2Gem>.from(json["bonus2_gems"].map((x) => Bonus2Gem.fromJson(x))),
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
        "segmentation": segmentation.toJson(),
        "bonus2_gems": List<dynamic>.from(bonus2Gems.map((x) => x.toJson())),
    };
}

class Bonus2Gem {
    int id;
    int customerId;
    int bonus;
    int gems;
    DateTime createdAt;
    DateTime updatedAt;

    Bonus2Gem({
        required this.id,
        required this.customerId,
        required this.bonus,
        required this.gems,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Bonus2Gem.fromJson(Map<String, dynamic> json) => Bonus2Gem(
        id: json["id"],
        customerId: json["customer_id"],
        bonus: json["bonus"],
        gems: json["gems"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "bonus": bonus,
        "gems": gems,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Segmentation {
    int id;
    String name;
    String type;
    int period;
    int gems;
    int relation;

    Segmentation({
        required this.id,
        required this.name,
        required this.type,
        required this.period,
        required this.gems,
        required this.relation,
    });

    factory Segmentation.fromJson(Map<String, dynamic> json) => Segmentation(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        period: json["period"],
        gems: json["gems"],
        relation: json["relation"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "period": period,
        "gems": gems,
        "relation": relation,
    };
}

class User {
    int id;
    String fname;
    String lname;
    int roleId;
    dynamic email;
    String phoneNumber;
    String imgUrl;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    List<dynamic> bonusTransferSender;
    List<BonusTransferReceiver> bonusTransferReceiver;
    List<dynamic> gemsTransferSender;
    List<dynamic> gemsTransferReceiver;

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
        required this.bonusTransferSender,
        required this.bonusTransferReceiver,
        required this.gemsTransferSender,
        required this.gemsTransferReceiver,
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
        bonusTransferSender: List<dynamic>.from(json["bonus_transfer_sender"].map((x) => x)),
        bonusTransferReceiver: List<BonusTransferReceiver>.from(json["bonus_transfer_receiver"].map((x) => BonusTransferReceiver.fromJson(x))),
        gemsTransferSender: List<dynamic>.from(json["gems_transfer_sender"].map((x) => x)),
        gemsTransferReceiver: List<dynamic>.from(json["gems_transfer_receiver"].map((x) => x)),
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
        "bonus_transfer_sender": List<dynamic>.from(bonusTransferSender.map((x) => x)),
        "bonus_transfer_receiver": List<dynamic>.from(bonusTransferReceiver.map((x) => x.toJson())),
        "gems_transfer_sender": List<dynamic>.from(gemsTransferSender.map((x) => x)),
        "gems_transfer_receiver": List<dynamic>.from(gemsTransferReceiver.map((x) => x)),
    };
}

class BonusTransferReceiver {
    int id;
    int senderUserId;
    int receiverUserId;
    String type;
    int value;
    DateTime expDate;
    DateTime createdAt;
    DateTime updatedAt;

    BonusTransferReceiver({
        required this.id,
        required this.senderUserId,
        required this.receiverUserId,
        required this.type,
        required this.value,
        required this.expDate,
        required this.createdAt,
        required this.updatedAt,
    });

    factory BonusTransferReceiver.fromJson(Map<String, dynamic> json) => BonusTransferReceiver(
        id: json["id"],
        senderUserId: json["sender_user_id"],
        receiverUserId: json["receiver_user_id"],
        type: json["type"],
        value: json["value"],
        expDate: DateTime.parse(json["exp_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sender_user_id": senderUserId,
        "receiver_user_id": receiverUserId,
        "type": type,
        "value": value,
        "exp_date": "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
