// To parse this JSON data, do
//
//     final organizationContactModel = organizationContactModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'organization_contact_model.g.dart';

OrganizationContactModel organizationContactModelFromJson(String str) =>
    OrganizationContactModel.fromJson(json.decode(str));

String organizationContactModelToJson(OrganizationContactModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class OrganizationContactModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Map error;

  OrganizationContactModel({
    Result? result,
    this.error = const {},
  }) : result = result ?? Result();

  factory OrganizationContactModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationContactModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "rating")
  final int rating;
  @JsonKey(name: "reviewCount")
  final int reviewCount;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "organizationId")
  final int organizationId;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "organizationName")
  final String organizationName;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "region")
  final Region region;
  @JsonKey(name: "latitude")
  final int latitude;
  @JsonKey(name: "longitude")
  final int longitude;

  Result({
    this.rating = -1,
    this.reviewCount = -1,
    this.id = -1,
    this.organizationId = -1,
    this.email = '',
    this.organizationName = '',
    this.address = '',
    this.phone = '',
    this.description = '',
    Region? region,
    this.latitude = -1,
    this.longitude = -1,
  }) : region = region ?? Region();

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

  Region({
    this.id = -1,
    this.name = '',
    this.parentId = -1,
    this.regionType = -1,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
