// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt() ?? -1,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      middleName: json['middleName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      inn: json['inn'] as String? ?? '',
      pinfl: json['pinfl'] as String? ?? '',
      bioPassportSerial: json['bioPassportSerial'] as String? ?? '',
      bioPassportNumber: json['bioPassportNumber'] as String? ?? '',
      bioPassportIssueDate: json['bioPassportIssueDate'] as String? ?? '',
      bioPassportExpireDate: json['bioPassportExpireDate'] as String? ?? '',
      bioPassportWhomGiven: json['bioPassportWhomGiven'] as String? ?? '',
      birthDate: json['birthDate'] as String? ?? '',
      countryOfBirth: json['countryOfBirth'] as String? ?? '',
      cityOfBirth: json['cityOfBirth'] as String? ?? '',
      countryOfResidence: json['countryOfResidence'] as String? ?? '',
      cityOfResidence: json['cityOfResidence'] as String? ?? '',
      address: json['address'] as String? ?? '',
      temporarilyAddress: json['temporarilyAddress'] as String? ?? '',
      gender: (json['gender'] as num?)?.toInt() ?? -1,
      userFamilyStatus: (json['userFamilyStatus'] as num?)?.toInt() ?? -1,
      userType: json['userType'] as String? ?? '',
      createdDate: DateTime.parse(json['createdDate'] as String),
      deletedDate: json['deletedDate'] as String? ?? '',
      lastLoginDate: json['lastLoginDate'] as String? ?? '',
      organizationId: (json['organizationId'] as num?)?.toInt() ?? -1,
      positionId: (json['positionId'] as num?)?.toInt() ?? -1,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      stateText: json['stateText'] as String? ?? '',
      state: (json['state'] as num?)?.toInt() ?? -1,
      myIdConfirmed: json['myIdConfirmed'] as bool? ?? false,
      organization: json['organization'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'email': instance.email,
      'inn': instance.inn,
      'pinfl': instance.pinfl,
      'bioPassportSerial': instance.bioPassportSerial,
      'bioPassportNumber': instance.bioPassportNumber,
      'bioPassportIssueDate': instance.bioPassportIssueDate,
      'bioPassportExpireDate': instance.bioPassportExpireDate,
      'bioPassportWhomGiven': instance.bioPassportWhomGiven,
      'birthDate': instance.birthDate,
      'countryOfBirth': instance.countryOfBirth,
      'cityOfBirth': instance.cityOfBirth,
      'countryOfResidence': instance.countryOfResidence,
      'cityOfResidence': instance.cityOfResidence,
      'address': instance.address,
      'temporarilyAddress': instance.temporarilyAddress,
      'gender': instance.gender,
      'userFamilyStatus': instance.userFamilyStatus,
      'userType': instance.userType,
      'createdDate': instance.createdDate.toIso8601String(),
      'deletedDate': instance.deletedDate,
      'lastLoginDate': instance.lastLoginDate,
      'organizationId': instance.organizationId,
      'positionId': instance.positionId,
      'position': instance.position,
      'stateText': instance.stateText,
      'state': instance.state,
      'myIdConfirmed': instance.myIdConfirmed,
      'organization': instance.organization,
    };

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
