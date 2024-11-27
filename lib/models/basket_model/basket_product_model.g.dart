// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketProductModel _$BasketProductModelFromJson(Map<String, dynamic> json) =>
    BasketProductModel(
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$BasketProductModelToJson(BasketProductModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt() ?? -1,
      period: (json['period'] as num?)?.toInt() ?? -1,
      saleType: (json['saleType'] as num?)?.toInt() ?? -1,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductElement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalProductCount: (json['totalProductCount'] as num?)?.toInt() ?? -1,
      originPrice: (json['originPrice'] as num?)?.toInt() ?? -1,
      vatPrice: (json['vatPrice'] as num?)?.toInt() ?? -1,
      compensationPrice: (json['compensationPrice'] as num?)?.toInt() ?? -1,
      installmentPrice: (json['installmentPrice'] as num?)?.toInt() ?? -1,
      oonCompensationMale: (json['oonCompensationMale'] as num?)?.toInt() ?? -1,
      oonCompensationFemale:
          (json['oonCompensationFemale'] as num?)?.toInt() ?? -1,
      orgId: (json['orgId'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'period': instance.period,
      'saleType': instance.saleType,
      'products': instance.products,
      'totalProductCount': instance.totalProductCount,
      'originPrice': instance.originPrice,
      'vatPrice': instance.vatPrice,
      'compensationPrice': instance.compensationPrice,
      'installmentPrice': instance.installmentPrice,
      'oonCompensationMale': instance.oonCompensationMale,
      'oonCompensationFemale': instance.oonCompensationFemale,
      'orgId': instance.orgId,
    };

ProductElement _$ProductElementFromJson(Map<String, dynamic> json) =>
    ProductElement(
      ProductProduct.fromJson(json['product'] as Map<String, dynamic>),
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
              ?.map((e) => AttributeValue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProductElementToJson(ProductElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'productId': instance.productId,
      'product': instance.product,
      'prices': instance.prices,
      'files': instance.files,
      'attributeValues': instance.attributeValues,
    };

AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) =>
    AttributeValue(
      Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
      id: json['id'] as String? ?? '',
      value: json['value'] as String? ?? '',
      valueTranslation: json['valueTranslation'] as String? ?? '',
      valueTranslations: (json['valueTranslations'] as List<dynamic>?)
              ?.map((e) => ValueTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributeId: (json['attributeId'] as num?)?.toInt() ?? -1,
      productId: json['productId'] as String? ?? '',
      variationId: json['variationId'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$AttributeValueToJson(AttributeValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'valueTranslation': instance.valueTranslation,
      'valueTranslations': instance.valueTranslations,
      'attributeId': instance.attributeId,
      'attribute': instance.attribute,
      'productId': instance.productId,
      'variationId': instance.variationId,
      'isVisible': instance.isVisible,
    };

Attribute _$AttributeFromJson(Map<String, dynamic> json) => Attribute(
      id: (json['id'] as num?)?.toInt() ?? -1,
      weight: (json['weight'] as num?)?.toInt() ?? -1,
      dataType: json['dataType'] as String? ?? '',
      hasFilter: json['hasFilter'] as bool? ?? false,
      isValueTranslated: json['isValueTranslated'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categoryId: (json['categoryId'] as num?)?.toInt() ?? -1,
      filterId: (json['filterId'] as num?)?.toInt() ?? -1,
      filter: json['filter'] as Map<String, dynamic>? ?? const {},
      groupId: (json['groupId'] as num?)?.toInt() ?? -1,
      isVisible: json['isVisible'] as bool? ?? false,
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'dataType': instance.dataType,
      'hasFilter': instance.hasFilter,
      'isValueTranslated': instance.isValueTranslated,
      'isRequired': instance.isRequired,
      'name': instance.name,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'filterId': instance.filterId,
      'filter': instance.filter,
      'groupId': instance.groupId,
      'isVisible': instance.isVisible,
      'type': instance.type,
    };

ValueTranslation _$ValueTranslationFromJson(Map<String, dynamic> json) =>
    ValueTranslation(
      languageCode: json['languageCode'] as String? ?? '',
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$ValueTranslationToJson(ValueTranslation instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'text': instance.text,
    };

FileElement _$FileElementFromJson(Map<String, dynamic> json) => FileElement(
      FileInfo.fromJson(json['fileInfo'] as Map<String, dynamic>),
      id: json['id'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? -1,
      url: json['url'] as String? ?? '',
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

FileInfo _$FileInfoFromJson(Map<String, dynamic> json) => FileInfo(
      DateTime.parse(json['createdAt'] as String),
      json['extension'] as String,
      id: json['id'] as String? ?? '',
      url: json['url'] as String? ?? '',
      name: json['name'] as String? ?? '',
      contentType: json['contentType'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$FileInfoToJson(FileInfo instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'extension': instance.extension,
      'contentType': instance.contentType,
      'createdAt': instance.createdAt.toIso8601String(),
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

ProductProduct _$ProductProductFromJson(Map<String, dynamic> json) =>
    ProductProduct(
      id: json['id'] as String? ?? '',
      state: json['state'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categoryId: (json['categoryId'] as num?)?.toInt() ?? -1,
      organizationId: (json['organizationId'] as num?)?.toInt() ?? -1,
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductProductToJson(ProductProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'name': instance.name,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'organizationId': instance.organizationId,
      'isVisible': instance.isVisible,
    };
