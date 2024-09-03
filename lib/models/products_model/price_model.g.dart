// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => PriceModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      value: (json['value'] as num?)?.toDouble() ?? -1.0,
      type: json['type'] as String? ?? '',
      currencyId: (json['currency_id'] as num?)?.toInt() ?? -1,
      variationId: json['variation_id'] as String? ?? '',
    );

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'type': instance.type,
      'currency_id': instance.currencyId,
      'variation_id': instance.variationId,
    };
