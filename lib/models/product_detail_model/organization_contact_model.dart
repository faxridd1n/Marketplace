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
  Result result;
  @JsonKey(name: "error")
  Map error;

  OrganizationContactModel(
    this.result, {
    this.error = const {},
  });

  factory OrganizationContactModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationContactModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "rating")
  double rating;
  @JsonKey(name: "reviewCount")
  int reviewCount;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "organizationId")
  int organizationId;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "organizationName")
  String organizationName;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "region")
  Region region;

  Result(
    this.region, {
    this.rating = -1,
    this.reviewCount = -1,
    this.id = -1,
    this.organizationId = -1,
    this.email = '',
    this.organizationName = '',
    this.address = '',
    this.phone = '',
    this.description = '',
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Region {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "parentId")
  int parentId;
  @JsonKey(name: "regionType")
  int regionType;

  Region({
    this.id = -1,
    this.name = '',
    this.parentId = -1,
    this.regionType = -1,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
