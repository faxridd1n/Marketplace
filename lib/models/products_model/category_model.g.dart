// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PCategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    PCategoryModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      imageId: json['image_id'] as String? ?? '',
      isVisible: json['is_visible'] as bool? ?? false,
    );

Map<String, dynamic> _$CategoryModelToJson(PCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_id': instance.imageId,
      'is_visible': instance.isVisible,
    };
