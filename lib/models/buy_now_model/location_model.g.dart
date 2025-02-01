// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      result: json['result'] == null
          ? const Result()
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      regions: (json['regions'] as List<dynamic>?)
              ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      districts: (json['districts'] as List<dynamic>?)
              ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'regions': instance.regions,
      'districts': instance.districts,
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
