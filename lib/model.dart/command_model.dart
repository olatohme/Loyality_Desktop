// To parse this JSON data, do
//
//     final commandModel = commandModelFromJson(jsonString);

import 'dart:convert';

List<CommandModel> commandModelFromJson(String str) => List<CommandModel>.from(json.decode(str).map((x) => CommandModel.fromJson(x)));

String commandModelToJson(List<CommandModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommandModel {
    int id;
    String commandName;
    String action;
    String value;
    DateTime createdAt;
    DateTime updatedAt;

    CommandModel({
        required this.id,
        required this.commandName,
        required this.action,
        required this.value,
        required this.createdAt,
        required this.updatedAt,
    });

    factory CommandModel.fromJson(Map<String, dynamic> json) => CommandModel(
        id: json["id"],
        commandName: json["command_name"],
        action: json["action"],
        value: json["value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "command_name": commandName,
        "action": action,
        "value": value,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
