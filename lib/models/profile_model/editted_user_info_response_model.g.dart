// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editted_user_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EdittedUserInfoResponseModel _$EdittedUserInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    EdittedUserInfoResponseModel(
      result: json['result'] == null
          ? const Result()
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] == null
          ? const Error()
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EdittedUserInfoResponseModelToJson(
        EdittedUserInfoResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      errorCode: (json['errorCode'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      cardExpire: json['cardExpire'] as String? ?? '',
      additionalPhoneNumber: json['additionalPhoneNumber'] as String? ?? '',
      additionalAddress: json['additionalAddress'] as String? ?? '',
      regionId: (json['regionId'] as num?)?.toInt() ?? -1,
      districtId: (json['districtId'] as num?)?.toInt() ?? -1,
      passportFile: json['passportFile'] as String? ?? '',
      passportFileBack: json['passportFileBack'] as String? ?? '',
      passportWithSelfieFile: json['passportWithSelfieFile'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? -1,
      cardId: (json['cardId'] as num?)?.toInt() ?? -1,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      cardNumber: json['cardNumber'] as String? ?? '',
      passportType: json['passportType'] == null
          ? const PassportType()
          : PassportType.fromJson(json['passportType'] as Map<String, dynamic>),
      passportSerial: json['passportSerial'] as String? ?? '',
      passportNumber: json['passportNumber'] as String? ?? '',
      passportIssueDate: json['passportIssueDate'] as String? ?? '',
      passportExpireDate: json['passportExpireDate'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      middleName: json['middleName'] as String? ?? '',
      pinfl: json['pinfl'] as String? ?? '',
      state: (json['state'] as num?)?.toInt() ?? -1,
      birthDate: json['birthDate'] as String? ?? '',
      date: json['date'] as String? ?? '',
      passOrg: json['passOrg'] as String? ?? '',
      myIdConfirmed: json['myIdConfirmed'] as bool? ?? false,
      address: json['address'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? -1,
      scoring: json['scoring'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'cardExpire': instance.cardExpire,
      'additionalPhoneNumber': instance.additionalPhoneNumber,
      'additionalAddress': instance.additionalAddress,
      'regionId': instance.regionId,
      'districtId': instance.districtId,
      'passportFile': instance.passportFile,
      'passportFileBack': instance.passportFileBack,
      'passportWithSelfieFile': instance.passportWithSelfieFile,
      'id': instance.id,
      'cardId': instance.cardId,
      'phoneNumber': instance.phoneNumber,
      'cardNumber': instance.cardNumber,
      'passportType': instance.passportType,
      'passportSerial': instance.passportSerial,
      'passportNumber': instance.passportNumber,
      'passportIssueDate': instance.passportIssueDate,
      'passportExpireDate': instance.passportExpireDate,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'pinfl': instance.pinfl,
      'state': instance.state,
      'birthDate': instance.birthDate,
      'date': instance.date,
      'passOrg': instance.passOrg,
      'myIdConfirmed': instance.myIdConfirmed,
      'address': instance.address,
      'status': instance.status,
      'scoring': instance.scoring,
    };

PassportType _$PassportTypeFromJson(Map<String, dynamic> json) => PassportType(
      type: (json['type'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$PassportTypeToJson(PassportType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
    };
