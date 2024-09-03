// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_element_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileElementModel _$FileElementModelFromJson(Map<String, dynamic> json) =>
    FileElementModel(
      id: json['id'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? -1,
      url: json['url'] as String? ?? '',
      fileInfo: json['file_info'] as String? ?? '',
      variationId: json['variation_id'] as String? ?? '',
      productId: json['product_id'] as String? ?? '',
      isVisible: json['is_visible'] as bool? ?? false,
    );

Map<String, dynamic> _$FileElementModelToJson(FileElementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'url': instance.url,
      'file_info': instance.fileInfo,
      'variation_id': instance.variationId,
      'product_id': instance.productId,
      'is_visible': instance.isVisible,
    };
