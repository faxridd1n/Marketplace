// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'location_model.g.dart';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

@JsonSerializable()
class LocationModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Map error;

  const LocationModel({
    this.result = const Result(),
    this.error = const {},
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "regions")
  final List<Region> regions;
  @JsonKey(name: "districts")
  final List<Region> districts;

  const Result({
    this.regions = const [],
    this.districts = const [],
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Region {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "parentId")
  final int parentId;
  @JsonKey(name: "regionType")
  final int regionType;

  const Region({
    this.id = -1,
    this.name = '',
    this.parentId = -1,
    this.regionType = -1,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
