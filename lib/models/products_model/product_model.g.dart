// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String? ?? '',
      state: (json['state'] as num?)?.toInt() ?? -1,
      service: (json['service'] as num?)?.toInt() ?? -1,
      tab: (json['tab'] as num?)?.toInt() ?? -1,
      nameId: (json['nameId'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      descriptionId: (json['descriptionId'] as num?)?.toInt() ?? -1,
      description: json['description'] as String? ?? '',
      categoryId: (json['categoryId'] as num?)?.toInt() ?? -1,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      organizationId: (json['organizationId'] as num?)?.toInt() ?? -1,
      organizationName: json['organizationName'] as String? ?? '',
      variations: (json['variations'] as List<dynamic>?)
              ?.map((e) => Variation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isVisible: json['isVisible'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? -1,
      reviewCount: (json['reviewCount'] as num?)?.toDouble() ?? -1,
      productNumber: (json['productNumber'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'service': instance.service,
      'tab': instance.tab,
      'nameId': instance.nameId,
      'name': instance.name,
      'descriptionId': instance.descriptionId,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'category': instance.category,
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'variations': instance.variations,
      'isVisible': instance.isVisible,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'productNumber': instance.productNumber,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      imageId: json['imageId'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageId': instance.imageId,
      'isVisible': instance.isVisible,
    };

Variation _$VariationFromJson(Map<String, dynamic> json) => Variation(
      id: json['id'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? -1,
      productId: json['productId'] as String? ?? '',
      prices: (json['prices'] as List<dynamic>?)
              ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => FileElement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributeValues: (json['attributeValues'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      isVisible: json['isVisible'] as bool? ?? false,
      moderationStatus: json['moderationStatus'] as String? ?? '',
      compensationOnly: json['compensationOnly'] as bool? ?? false,
      saleType: (json['saleType'] as num?)?.toInt() ?? -1,
      oonModerationStatus: (json['oonModerationStatus'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$VariationToJson(Variation instance) => <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'productId': instance.productId,
      'prices': instance.prices,
      'files': instance.files,
      'attributeValues': instance.attributeValues,
      'isVisible': instance.isVisible,
      'moderationStatus': instance.moderationStatus,
      'compensationOnly': instance.compensationOnly,
      'saleType': instance.saleType,
      'oonModerationStatus': instance.oonModerationStatus,
    };

FileElement _$FileElementFromJson(Map<String, dynamic> json) => FileElement(
      id: json['id'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? -1,
      url: json['url'] as String? ?? '',
      fileInfo: json['fileInfo'] as Map<String, dynamic>? ?? const {},
      variationId: json['variationId'] as String? ?? '',
      productId: json['productId'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$FileElementToJson(FileElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'url': instance.url,
      'fileInfo': instance.fileInfo,
      'variationId': instance.variationId,
      'productId': instance.productId,
      'isVisible': instance.isVisible,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      id: (json['id'] as num?)?.toInt() ?? -1,
      value: (json['value'] as num?)?.toInt() ?? -1,
      type: json['type'] as String? ?? '',
      currencyId: (json['currencyId'] as num?)?.toInt() ?? -1,
      variationId: json['variationId'] as String? ?? '',
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'type': instance.type,
      'currencyId': instance.currencyId,
      'variationId': instance.variationId,
    };
