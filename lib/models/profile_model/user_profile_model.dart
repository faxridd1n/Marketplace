// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_profile_model.g.dart';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class UserProfileModel {
  @JsonKey(name: "result")
  Result result;
  @JsonKey(name: "error")
  Map error;

  UserProfileModel(
    this.result, {
    this.error = const {},
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "middleName")
  String middleName;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "inn")
  String inn;
  @JsonKey(name: "pinfl")
  String pinfl;
  @JsonKey(name: "bioPassportSerial")
  String bioPassportSerial;
  @JsonKey(name: "bioPassportNumber")
  String bioPassportNumber;
  @JsonKey(name: "bioPassportIssueDate")
  String bioPassportIssueDate;
  @JsonKey(name: "bioPassportExpireDate")
  String bioPassportExpireDate;
  @JsonKey(name: "bioPassportWhomGiven")
  String bioPassportWhomGiven;
  @JsonKey(name: "birthDate")
  String birthDate;
  @JsonKey(name: "countryOfBirth")
  String countryOfBirth;
  @JsonKey(name: "cityOfBirth")
  String cityOfBirth;
  @JsonKey(name: "countryOfResidence")
  String countryOfResidence;
  @JsonKey(name: "cityOfResidence")
  String cityOfResidence;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "temporarilyAddress")
  String temporarilyAddress;
  @JsonKey(name: "gender")
  int gender;
  @JsonKey(name: "userFamilyStatus")
  int userFamilyStatus;
  @JsonKey(name: "userType")
  String userType;
  @JsonKey(name: "createdDate")
  DateTime createdDate;
  @JsonKey(name: "deletedDate")
  String deletedDate;
  @JsonKey(name: "lastLoginDate")
  String lastLoginDate;
  @JsonKey(name: "organizationId")
  int organizationId;
  @JsonKey(name: "positionId")
  int positionId;
  @JsonKey(name: "position")
  Position position;
  @JsonKey(name: "stateText")
  String stateText;
  @JsonKey(name: "state")
  int state;
  @JsonKey(name: "myIdConfirmed")
  bool myIdConfirmed;
  @JsonKey(name: "organization")
  Map organization;

  Result({
    this.id = -1,
    this.phoneNumber = '',
    this.firstName = '',
    this.lastName = '',
    this.middleName = '',
    this.email = '',
    this.inn = '',
    this.pinfl = '',
    this.bioPassportSerial = '',
    this.bioPassportNumber = '',
    this.bioPassportIssueDate = '',
    this.bioPassportExpireDate = '',
    this.bioPassportWhomGiven = '',
    this.birthDate = '',
    this.countryOfBirth = '',
    this.cityOfBirth = '',
    this.countryOfResidence = '',
    this.cityOfResidence = '',
    this.address = '',
    this.temporarilyAddress = '',
    this.gender = -1,
    this.userFamilyStatus = -1,
    this.userType = '',
    required this.createdDate,
    this.deletedDate = '',
    this.lastLoginDate = '',
    this.organizationId = -1,
    this.positionId = -1,
    required this.position,
    this.stateText = '',
    this.state = -1,
    this.myIdConfirmed = false,
    this.organization = const {},
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Position {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  Position({
    this.id = -1,
    this.name = '',
  });

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  Map<String, dynamic> toJson() => _$PositionToJson(this);
}
