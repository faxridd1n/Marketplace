import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'editted_user_info_response_model.g.dart';

EdittedUserInfoResponseModel edittedUserInfoResponseModelFromJson(String str) =>
    EdittedUserInfoResponseModel.fromJson(json.decode(str));

String edittedUserInfoResponseModelToJson(EdittedUserInfoResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class EdittedUserInfoResponseModel {
  @JsonKey(name: "result")
  final Result result;

  @JsonKey(name: "error")
  final Error error;

  const EdittedUserInfoResponseModel({
    this.result = const Result(),
    this.error = const Error(),
  });

  factory EdittedUserInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EdittedUserInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EdittedUserInfoResponseModelToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: "errorCode")
  final int errorCode;

  @JsonKey(name: "errorMessage")
  final String errorMessage;

  const Error({
    this.errorCode = 0,
    this.errorMessage = '',
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "cardExpire")
  final String cardExpire;

  @JsonKey(name: "additionalPhoneNumber")
  final String additionalPhoneNumber;

  @JsonKey(name: "additionalAddress")
  final String additionalAddress;

  @JsonKey(name: "regionId")
  final int regionId;

  @JsonKey(name: "districtId")
  final int districtId;

  @JsonKey(name: "passportFile")
  final String passportFile;

  @JsonKey(name: "passportFileBack")
  final String passportFileBack;

  @JsonKey(name: "passportWithSelfieFile")
  final String passportWithSelfieFile;

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "cardId")
  final int cardId;

  @JsonKey(name: "phoneNumber")
  final String phoneNumber;

  @JsonKey(name: "cardNumber")
  final String cardNumber;

  @JsonKey(name: "passportType")
  final PassportType passportType;

  @JsonKey(name: "passportSerial")
  final String passportSerial;

  @JsonKey(name: "passportNumber")
  final String passportNumber;

  @JsonKey(name: "passportIssueDate")
  final String passportIssueDate;

  @JsonKey(name: "passportExpireDate")
  final String passportExpireDate;

  @JsonKey(name: "firstName")
  final String firstName;

  @JsonKey(name: "lastName")
  final String lastName;

  @JsonKey(name: "middleName")
  final String middleName;

  @JsonKey(name: "pinfl")
  final String pinfl;

  @JsonKey(name: "state")
  final int state;

  @JsonKey(name: "birthDate")
  final String birthDate;

  @JsonKey(name: "date")
  final String date;

  @JsonKey(name: "passOrg")
  final String passOrg;

  @JsonKey(name: "myIdConfirmed")
  final bool myIdConfirmed;

  @JsonKey(name: "address")
  final String address;

  @JsonKey(name: "status")
  final int status;

  @JsonKey(name: "scoring")
  final Map scoring;

  const Result({
    this.cardExpire = '',
    this.additionalPhoneNumber = '',
    this.additionalAddress = '',
    this.regionId = -1,
    this.districtId = -1,
    this.passportFile = '',
    this.passportFileBack = '',
    this.passportWithSelfieFile = '',
    this.id = -1,
    this.cardId = -1,
    this.phoneNumber = '',
    this.cardNumber = '',
    this.passportType = const PassportType(),
    this.passportSerial = '',
    this.passportNumber = '',
    this.passportIssueDate = '',
    this.passportExpireDate = '',
    this.firstName = '',
    this.lastName = '',
    this.middleName = '',
    this.pinfl = '',
    this.state = -1,
    this.birthDate = '',
    this.date = '',
    this.passOrg = '',
    this.myIdConfirmed = false,
    this.address = '',
    this.status = -1,
    this.scoring = const {},
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class PassportType {
  @JsonKey(name: "type")
  final int type;

  @JsonKey(name: "name")
  final String name;

  const PassportType({
    this.type = -1,
    this.name = '',
  });

  factory PassportType.fromJson(Map<String, dynamic> json) =>
      _$PassportTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PassportTypeToJson(this);
}
