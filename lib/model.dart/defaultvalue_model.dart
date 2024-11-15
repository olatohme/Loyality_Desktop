// To parse this JSON data, do
//
//     final defaultModel = defaultModelFromJson(jsonString);

import 'dart:convert';

List<DefaultModel> defaultModelFromJson(String str) => List<DefaultModel>.from(json.decode(str).map((x) => DefaultModel.fromJson(x)));

String defaultModelToJson(List<DefaultModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DefaultModel {
    int id;
    String name;
    String value;
    DateTime createdAt;
    DateTime updatedAt;

    DefaultModel({
        required this.id,
        required this.name,
        required this.value,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DefaultModel.fromJson(Map<String, dynamic> json) => DefaultModel(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
