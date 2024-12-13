// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationContactModel _$OrganizationContactModelFromJson(
        Map<String, dynamic> json) =>
    OrganizationContactModel(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$OrganizationContactModelToJson(
        OrganizationContactModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      rating: (json['rating'] as num?)?.toInt() ?? -1,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? -1,
      id: (json['id'] as num?)?.toInt() ?? -1,
      organizationId: (json['organizationId'] as num?)?.toInt() ?? -1,
      email: json['email'] as String? ?? '',
      organizationName: json['organizationName'] as String? ?? '',
      address: json['address'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      description: json['description'] as String? ?? '',
      region: json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      latitude: (json['latitude'] as num?)?.toInt() ?? -1,
      longitude: (json['longitude'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'id': instance.id,
      'organizationId': instance.organizationId,
      'email': instance.email,
      'organizationName': instance.organizationName,
      'address': instance.address,
      'phone': instance.phone,
      'description': instance.description,
      'region': instance.region,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      parentId: (json['parentId'] as num?)?.toInt() ?? -1,
      regionType: (json['regionType'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'regionType': instance.regionType,
    };
