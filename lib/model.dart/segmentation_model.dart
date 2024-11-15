// To parse this JSON data, do
//
//     final segmentationModel = segmentationModelFromJson(jsonString);

import 'dart:convert';

List<SegmentationModel> segmentationModelFromJson(String str) => List<SegmentationModel>.from(json.decode(str).map((x) => SegmentationModel.fromJson(x)));

String segmentationModelToJson(List<SegmentationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SegmentationModel {
    int id;
    String name;
    String type;
    int? period;
    int? gems;
    int relation;
    int offerMaxGems;
    int offerMaxBonus;

    SegmentationModel({
        required this.id,
        required this.name,
        required this.type,
        required this.period,
        required this.gems,
        required this.relation,
        required this.offerMaxGems,
        required this.offerMaxBonus,
    });

    factory SegmentationModel.fromJson(Map<String, dynamic> json) => SegmentationModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        period: json["period"],
        gems: json["gems"],
        relation: json["relation"],
        offerMaxGems: json["offerMaxGems"],
        offerMaxBonus: json["offerMaxBonus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "period": period,
        "gems": gems,
        "relation": relation,
        "offerMaxGems": offerMaxGems,
        "offerMaxBonus": offerMaxBonus,
    };
}
