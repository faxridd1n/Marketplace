// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariationModel _$VariationModelFromJson(Map<String, dynamic> json) =>
    VariationModel(
      id: json['id'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? -1,
      productId: json['product_id'] as String? ?? '',
      prices: (json['prices'] as List<dynamic>?)
              ?.map((e) =>
                  const PriceConverter().fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => const FileElementConverter()
                  .fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributeValues: json['attribute_values'] as List<dynamic>? ?? const [],
      isVisible: json['is_visible'] as bool? ?? false,
      moderationStatus: json['moderation_status'] as String? ?? '',
      compensationOnly: json['compensation_only'] as bool? ?? false,
      saleType: (json['sale_type'] as num?)?.toInt() ?? -1,
      oonModerationStatus:
          (json['oon_moderation_status'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$VariationModelToJson(VariationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'product_id': instance.productId,
      'prices': instance.prices.map(const PriceConverter().toJson).toList(),
      'files': instance.files.map(const FileElementConverter().toJson).toList(),
      'attribute_values': instance.attributeValues,
      'is_visible': instance.isVisible,
      'moderation_status': instance.moderationStatus,
      'compensation_only': instance.compensationOnly,
      'sale_type': instance.saleType,
      'oon_moderation_status': instance.oonModerationStatus,
    };
