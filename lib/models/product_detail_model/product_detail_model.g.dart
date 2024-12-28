// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      errorCode: (json['errorCode'] as num?)?.toInt() ?? -1,
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as String? ?? '',
      state: (json['state'] as num?)?.toInt() ?? -1,
      names: (json['names'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      name: json['name'] as String? ?? '',
      descriptions: (json['descriptions'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String? ?? '',
      categoryId: (json['categoryId'] as num?)?.toInt() ?? -1,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      brandId: (json['brandId'] as num?)?.toInt() ?? -1,
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      organizationId: (json['organizationId'] as num?)?.toInt() ?? -1,
      variations: (json['variations'] as List<dynamic>?)
              ?.map((e) => Variation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isVisible: json['isVisible'] as bool? ?? false,
      moderationStatus: json['moderationStatus'] as String? ?? '',
      rating: (json['rating'] as num?)?.toInt() ?? -1,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? -1,
      productNumber: (json['productNumber'] as num?)?.toInt() ?? -1,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'names': instance.names,
      'name': instance.name,
      'descriptions': instance.descriptions,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'category': instance.category,
      'brandId': instance.brandId,
      'brand': instance.brand,
      'organizationId': instance.organizationId,
      'variations': instance.variations,
      'isVisible': instance.isVisible,
      'moderationStatus': instance.moderationStatus,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'productNumber': instance.productNumber,
      'createdDate': instance.createdDate.toIso8601String(),
      'updatedDate': instance.updatedDate.toIso8601String(),
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: (json['id'] as num?)?.toInt() ?? -1,
      imageId: json['imageId'] as String? ?? '',
      image: json['image'] as String? ?? '',
      iconId: json['iconId'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'imageId': instance.imageId,
      'image': instance.image,
      'iconId': instance.iconId,
      'icon': instance.icon,
      'name': instance.name,
      'isVisible': instance.isVisible,
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

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      languageCode: json['languageCode'] as String? ?? '',
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'text': instance.text,
    };

Variation _$VariationFromJson(Map<String, dynamic> json) => Variation(
      id: json['id'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? -1,
      productId: json['productId'] as String? ?? '',
      idForOrder: (json['idForOrder'] as num?)?.toInt() ?? -1,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
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
      'idForOrder': instance.idForOrder,
      'product': instance.product,
      'prices': instance.prices,
      'files': instance.files,
      'attributeValues': instance.attributeValues,
      'isVisible': instance.isVisible,
      'moderationStatus': instance.moderationStatus,
      'compensationOnly': instance.compensationOnly,
      'saleType': instance.saleType,
      'oonModerationStatus': instance.oonModerationStatus,
    };

AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) =>
    AttributeValue(
      id: json['id'] as String? ?? '',
      value: json['value'] as String? ?? '',
      valueTranslation: json['valueTranslation'] as String? ?? '',
      valueTranslations: (json['valueTranslations'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributeId: (json['attributeId'] as num?)?.toInt() ?? -1,
      attribute: json['attribute'] == null
          ? null
          : Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
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
      names: (json['names'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String? ?? '',
      categoryId: (json['categoryId'] as num?)?.toInt() ?? -1,
      filterId: (json['filterId'] as num?)?.toInt() ?? -1,
      filter: json['filter'] == null
          ? null
          : Filter.fromJson(json['filter'] as Map<String, dynamic>),
      groupId: (json['groupId'] as num?)?.toInt() ?? -1,
      isVisible: json['isVisible'] as bool? ?? false,
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
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      filterType: json['filterType'] as String? ?? '',
      values: json['values'] as String? ?? '',
      dataType: json['dataType'] as String? ?? '',
      weight: (json['weight'] as num?)?.toInt() ?? -1,
      categoryId: (json['categoryId'] as num?)?.toInt() ?? -1,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      isVisible: json['isVisible'] as bool? ?? false,
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

FileElement _$FileElementFromJson(Map<String, dynamic> json) => FileElement(
      id: json['id'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? -1,
      url: json['url'] as String? ?? '',
      fileInfo: json['fileInfo'] as String? ?? '',
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

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String? ?? '',
      state: json['state'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categoryId: (json['categoryId'] as num?)?.toInt() ?? -1,
      organizationId: (json['organizationId'] as num?)?.toInt() ?? -1,
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'name': instance.name,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'organizationId': instance.organizationId,
      'isVisible': instance.isVisible,
    };
