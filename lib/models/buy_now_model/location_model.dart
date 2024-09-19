// To parse this JSON data, do
//
//     final regionsModel = regionsModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationsModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelTojson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
    Result? result;
    Map? error;

    LocationModel({
        this.result,
        this.error,
    });

    factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "error": error,
    };
}

class Result {
    List<Location>? regions;
    List<Location>? districts;

    Result({
        this.regions,
        this.districts,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        regions: json["regions"] == null ? [] : List<Location>.from(json["regions"]!.map((x) => Location.fromJson(x))),
        districts: json["districts"] == null ? [] : List<Location>.from(json["districts"]!.map((x) => Location.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "regions": regions == null ? [] : List<dynamic>.from(regions!.map((x) => x.toJson())),
        "districts": districts == null ? [] : List<dynamic>.from(districts!.map((x) => x.toJson())),
    };
}

class Location {
    int? id;
    String? name;
    int? parentId;
    int? regionType;

    Location({
        this.id,
        this.name,
        this.parentId,
        this.regionType,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
        regionType: json["regionType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parentId": parentId,
        "regionType": regionType,
    };
}
