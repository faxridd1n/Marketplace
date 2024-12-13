// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrdersModel _$UserOrdersModelFromJson(Map<String, dynamic> json) =>
    UserOrdersModel(
      Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$UserOrdersModelToJson(UserOrdersModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ResultItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allCount: (json['allCount'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'items': instance.items,
      'allCount': instance.allCount,
    };

ResultItem _$ResultItemFromJson(Map<String, dynamic> json) => ResultItem(
      DateTime.parse(json['createdDate'] as String),
      DateTime.parse(json['updatedDate'] as String),
      id: (json['id'] as num?)?.toInt() ?? -1,
      paymentType: (json['paymentType'] as num?)?.toInt() ?? -1,
      deliveryType: (json['deliveryType'] as num?)?.toInt() ?? -1,
      userId: (json['userId'] as num?)?.toInt() ?? -1,
      fullName: json['fullName'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      regionId: (json['regionId'] as num?)?.toInt() ?? -1,
      destrictId: (json['destrictId'] as num?)?.toInt() ?? -1,
      address: json['address'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      subOrders: (json['subOrders'] as List<dynamic>?)
              ?.map((e) => SubOrder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ResultItemToJson(ResultItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate.toIso8601String(),
      'updatedDate': instance.updatedDate.toIso8601String(),
      'paymentType': instance.paymentType,
      'deliveryType': instance.deliveryType,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'regionId': instance.regionId,
      'destrictId': instance.destrictId,
      'address': instance.address,
      'comment': instance.comment,
      'subOrders': instance.subOrders,
    };

SubOrder _$SubOrderFromJson(Map<String, dynamic> json) => SubOrder(
      id: (json['id'] as num?)?.toInt() ?? -1,
      organizationId: (json['organizationId'] as num?)?.toInt() ?? -1,
      organizationName: json['organizationName'] as String? ?? '',
      reason: json['reason'] as String? ?? '',
      state: (json['state'] as num?)?.toInt() ?? -1,
      updatedDate: json['updatedDate'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => SubOrderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SubOrderToJson(SubOrder instance) => <String, dynamic>{
      'id': instance.id,
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'reason': instance.reason,
      'state': instance.state,
      'updatedDate': instance.updatedDate,
      'items': instance.items,
    };

SubOrderItem _$SubOrderItemFromJson(Map<String, dynamic> json) => SubOrderItem(
      Variation.fromJson(json['variation'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt() ?? -1,
      count: (json['count'] as num?)?.toInt() ?? -1,
      isAvailable: json['isAvailable'] as bool? ?? false,
      variationId: json['variationId'] as String? ?? '',
    );

Map<String, dynamic> _$SubOrderItemToJson(SubOrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'isAvailable': instance.isAvailable,
      'variationId': instance.variationId,
      'variation': instance.variation,
    };

Variation _$VariationFromJson(Map<String, dynamic> json) => Variation(
      Product.fromJson(json['product'] as Map<String, dynamic>),
      id: json['id'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? -1,
      productId: json['productId'] as String? ?? '',
      idForOrder: (json['idForOrder'] as num?)?.toInt() ?? -1,
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
      id: json['id'] as String? ?? '',
      url: json['url'] as String? ?? '',
      name: json['name'] as String? ?? '',
      extension: json['extension'] as String? ?? '',
      contentType: json['contentType'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$FileInfoToJson(FileInfo instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'extension': instance.extension,
      'contentType': instance.contentType,
      'createdAt': instance.createdAt,
      'isVisible': instance.isVisible,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      id: (json['id'] as num?)?.toInt() ?? -1,
      value: (json['value'] as num?)?.toDouble() ?? -1.0,
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
