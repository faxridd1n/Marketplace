// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketProductModel _$BasketProductModelFromJson(Map<String, dynamic> json) =>
    BasketProductModel(
      result: json['result'] == null
          ? const Result()
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] == null
          ? const Error()
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BasketProductModelToJson(BasketProductModel instance) =>
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
      id: (json['id'] as num?)?.toInt() ?? 0,
      period: (json['period'] as num?)?.toInt() ?? 0,
      saleType: (json['saleType'] as num?)?.toInt() ?? 0,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductElement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalProductCount: (json['totalProductCount'] as num?)?.toInt() ?? 0,
      originPrice: (json['originPrice'] as num?)?.toInt() ?? 0,
      vatPrice: (json['vatPrice'] as num?)?.toInt() ?? 0,
      compensationPrice: (json['compensationPrice'] as num?)?.toInt() ?? 0,
      installmentPrice: (json['installmentPrice'] as num?)?.toInt() ?? 0,
      oonCompensationMale: (json['oonCompensationMale'] as num?)?.toInt() ?? 0,
      oonCompensationFemale:
          (json['oonCompensationFemale'] as num?)?.toInt() ?? 0,
      orgId: (json['orgId'] as num?)?.toInt() ?? 0,
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
      id: json['id'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
      productId: json['productId'] as String? ?? '',
      product: json['product'] == null
          ? null
          : ProductProduct.fromJson(json['product'] as Map<String, dynamic>),
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
      id: json['id'] as String? ?? '',
      value: json['value'] as String? ?? '',
      valueTranslation: json['valueTranslation'] as String? ?? '',
      valueTranslations: (json['valueTranslations'] as List<dynamic>?)
              ?.map((e) => ValueTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributeId: (json['attributeId'] as num?)?.toInt() ?? 0,
      attribute: json['attribute'] == null
          ? null
          : Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
      productId: json['productId'] as String? ?? '',
      variationId: json['variationId'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? true,
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
      id: (json['id'] as num?)?.toInt() ?? 0,
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      dataType: json['dataType'] as String? ?? '',
      hasFilter: json['hasFilter'] as bool? ?? false,
      isValueTranslated: json['isValueTranslated'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      names: (json['names'] as List<dynamic>?)
              ?.map((e) => ValueTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String? ?? '',
      categoryId: (json['categoryId'] as num?)?.toInt() ?? 0,
      filterId: (json['filterId'] as num?)?.toInt() ?? 0,
      filter: json['filter'] == null
          ? null
          : Filter.fromJson(json['filter'] as Map<String, dynamic>),
      groupId: (json['groupId'] as num?)?.toInt() ?? 0,
      isVisible: json['isVisible'] as bool? ?? true,
      isAdditional: json['isAdditional'] as bool? ?? false,
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
      'names': instance.names,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'filterId': instance.filterId,
      'filter': instance.filter,
      'groupId': instance.groupId,
      'isVisible': instance.isVisible,
      'isAdditional': instance.isAdditional,
      'type': instance.type,
    };

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      filterType: json['filterType'] as String? ?? '',
      values: json['values'] as String? ?? '',
      dataType: json['dataType'] as String? ?? '',
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      categoryId: (json['categoryId'] as num?)?.toInt() ?? 0,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      isVisible: json['isVisible'] as bool? ?? true,
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'filterType': instance.filterType,
      'values': instance.values,
      'dataType': instance.dataType,
      'weight': instance.weight,
      'categoryId': instance.categoryId,
      'category': instance.category,
      'isVisible': instance.isVisible,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      imageId: json['imageId'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? true,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageId': instance.imageId,
      'isVisible': instance.isVisible,
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
      id: json['id'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? 0,
      url: json['url'] as String? ?? '',
      fileInfo: json['fileInfo'] == null
          ? null
          : FileInfo.fromJson(json['fileInfo'] as Map<String, dynamic>),
      variationId: json['variationId'] as String? ?? '',
      productId: json['productId'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? true,
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
      id: json['id'] as String? ?? '',
      url: json['url'] as String? ?? '',
      name: json['name'] as String? ?? '',
      extension: json['extension'] as String? ?? '',
      contentType: json['contentType'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isVisible: json['isVisible'] as bool? ?? true,
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
      id: (json['id'] as num?)?.toInt() ?? 0,
      value: (json['value'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      currencyId: (json['currencyId'] as num?)?.toInt() ?? 0,
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
      categoryId: (json['categoryId'] as num?)?.toInt() ?? 0,
      organizationId: (json['organizationId'] as num?)?.toInt() ?? 0,
      isVisible: json['isVisible'] as bool? ?? true,
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
