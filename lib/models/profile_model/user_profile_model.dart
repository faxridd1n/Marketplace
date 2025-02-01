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
  final Result result;
  @JsonKey(name: "error")
  final Map error;

  const UserProfileModel({
    this.result=const Result(),
    this.error = const {},
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "phoneNumber")
  final String phoneNumber;
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "middleName")
  final String middleName;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "inn")
  final String inn;
  @JsonKey(name: "pinfl")
  final String pinfl;
  @JsonKey(name: "bioPassportSerial")
  final String bioPassportSerial;
  @JsonKey(name: "bioPassportNumber")
  final String bioPassportNumber;
  @JsonKey(name: "bioPassportIssueDate")
  final String bioPassportIssueDate;
  @JsonKey(name: "bioPassportExpireDate")
  final String bioPassportExpireDate;
  @JsonKey(name: "bioPassportWhomGiven")
  final String bioPassportWhomGiven;
  @JsonKey(name: "birthDate")
  final String birthDate;
  @JsonKey(name: "countryOfBirth")
  final String countryOfBirth;
  @JsonKey(name: "cityOfBirth")
  final String cityOfBirth;
  @JsonKey(name: "countryOfResidence")
  final String countryOfResidence;
  @JsonKey(name: "cityOfResidence")
  final String cityOfResidence;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "temporarilyAddress")
  final String temporarilyAddress;
  @JsonKey(name: "gender")
  final int gender;
  @JsonKey(name: "userFamilyStatus")
  final int userFamilyStatus;
  @JsonKey(name: "userType")
  final String userType;
  @JsonKey(name: "createdDate")
  final String createdDate;
  @JsonKey(name: "deletedDate")
  final String deletedDate;
  @JsonKey(name: "lastLoginDate")
  final String lastLoginDate;
  @JsonKey(name: "organizationId")
  final int organizationId;
  @JsonKey(name: "positionId")
  final int positionId;
  @JsonKey(name: "position")
  final Position position;
  @JsonKey(name: "stateText")
  final String stateText;
  @JsonKey(name: "state")
  final int state;
  @JsonKey(name: "myIdConfirmed")
  final bool myIdConfirmed;
  @JsonKey(name: "organization")
  final Map organization;

 const Result({
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
    this.createdDate='',
    this.deletedDate = '',
    this.lastLoginDate = '',
    this.organizationId = -1,
    this.positionId = -1,
    this.position=const Position(),
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
  final int id;
  @JsonKey(name: "name")
  final String name;

  const Position({
    this.id = -1,
    this.name = '',
  });

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  Map<String, dynamic> toJson() => _$PositionToJson(this);
}
