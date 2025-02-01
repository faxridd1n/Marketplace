// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_detail_model.g.dart';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductDetailModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Error error;

  const ProductDetailModel({
    this.result = const Result(),
    this.error = const Error(),
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: "errorCode")
  final int errorCode;
  @JsonKey(name: "errorMessage")
  final String errorMessage;

  const Error({
    this.errorCode = -1,
    this.errorMessage = '',
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "state")
  final int state;
  @JsonKey(name: "names")
  final List<Description> names;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "descriptions")
  final List<Description> descriptions;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "categoryId")
  final int categoryId;
  @JsonKey(name: "category")
  final Category category;
  @JsonKey(name: "brandId")
  final int brandId;
  @JsonKey(name: "brand")
  final Brand brand;
  @JsonKey(name: "organizationId")
  final int organizationId;
  @JsonKey(name: "variations")
  final List<Variation> variations;
  @JsonKey(name: "isVisible")
  final bool isVisible;
  @JsonKey(name: "moderationStatus")
  final String moderationStatus;
  @JsonKey(name: "rating")
  final int rating;
  @JsonKey(name: "reviewCount")
  final int reviewCount;
  @JsonKey(name: "productNumber")
  final int productNumber;
  @JsonKey(name: "createdDate")
  final String createdDate;
  @JsonKey(name: "updatedDate")
  final String updatedDate;

  const Result({
    this.id = '',
    this.state = -1,
    this.names = const [],
    this.name = '',
    this.descriptions = const [],
    this.description = '',
    this.categoryId = -1,
    this.category = const Category(),
    this.brandId = -1,
    this.brand = const Brand(),
    this.organizationId = -1,
    this.variations = const [],
    this.isVisible = false,
    this.moderationStatus = '',
    this.rating = -1,
    this.reviewCount = -1,
    this.productNumber = -1,
    this.createdDate = '',
    this.updatedDate = '',
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Brand {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "imageId")
  final String imageId;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "iconId")
  final String iconId;
  @JsonKey(name: "icon")
  final String icon;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const Brand({
    this.id = -1,
    this.imageId = '',
    this.image = '',
    this.iconId = '',
    this.icon = '',
    this.name = '',
    this.isVisible = false,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "imageId")
  final String imageId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const Category({
    this.id = -1,
    this.name = '',
    this.imageId = '',
    this.isVisible = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Description {
  @JsonKey(name: "languageCode")
  final String languageCode;
  @JsonKey(name: "text")
  final String text;

  const Description({
    this.languageCode = '',
    this.text = '',
  });

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@JsonSerializable()
class Variation {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "idForOrder")
  final int idForOrder;
  @JsonKey(name: "product")
  final Product product;
  @JsonKey(name: "prices")
  final List<Price> prices;
  @JsonKey(name: "files")
  final List<FileElement> files;
  @JsonKey(name: "attributeValues")
  final List<AttributeValue> attributeValues;
  @JsonKey(name: "isVisible")
  final bool isVisible;
  @JsonKey(name: "moderationStatus")
  final String moderationStatus;
  @JsonKey(name: "compensationOnly")
  final bool compensationOnly;
  @JsonKey(name: "saleType")
  final int saleType;
  @JsonKey(name: "oonModerationStatus")
  final int oonModerationStatus;

  const Variation({
    this.id = '',
    this.count = -1,
    this.productId = '',
    this.idForOrder = -1,
    this.product = const Product(),
    this.prices = const [],
    this.files = const [],
    this.attributeValues = const [],
    this.isVisible = false,
    this.moderationStatus = '',
    this.compensationOnly = false,
    this.saleType = -1,
    this.oonModerationStatus = -1,
  });

  factory Variation.fromJson(Map<String, dynamic> json) =>
      _$VariationFromJson(json);

  Map<String, dynamic> toJson() => _$VariationToJson(this);
}

@JsonSerializable()
class AttributeValue {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "value")
  final String value;
  @JsonKey(name: "valueTranslation")
  final String valueTranslation;
  @JsonKey(name: "valueTranslations")
  final List<Description> valueTranslations;
  @JsonKey(name: "attributeId")
  final int attributeId;
  @JsonKey(name: "attribute")
  final Attribute attribute;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "variationId")
  final String variationId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const AttributeValue({
    this.id = '',
    this.value = '',
    this.valueTranslation = '',
    this.valueTranslations = const [],
    this.attributeId = -1,
    this.attribute = const Attribute(),
    this.productId = '',
    this.variationId = '',
    this.isVisible = false,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeValueToJson(this);
}

@JsonSerializable()
class Attribute {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "weight")
  final int weight;
  @JsonKey(name: "dataType")
  final String dataType;
  @JsonKey(name: "hasFilter")
  final bool hasFilter;
  @JsonKey(name: "isValueTranslated")
  final bool isValueTranslated;
  @JsonKey(name: "isRequired")
  final bool isRequired;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "names")
  final List<Description> names;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "categoryId")
  final int categoryId;
  @JsonKey(name: "filterId")
  final int filterId;
  @JsonKey(name: "filter")
  final Filter filter;
  @JsonKey(name: "groupId")
  final int groupId;
  @JsonKey(name: "isVisible")
  final bool isVisible;
  @JsonKey(name: "isAdditional")
  final bool isAdditional;
  @JsonKey(name: "type")
  final String type;

  const Attribute({
    this.id = -1,
    this.weight = -1,
    this.dataType = '',
    this.hasFilter = false,
    this.isValueTranslated = false,
    this.isRequired = false,
    this.name = '',
    this.names = const [],
    this.description = '',
    this.categoryId = -1,
    this.filterId = -1,
    this.filter = const Filter(),
    this.groupId = -1,
    this.isVisible = false,
    this.isAdditional = false,
    this.type = '',
  });

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Filter {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "filterType")
  final String filterType;
  @JsonKey(name: "values")
  final String values;
  @JsonKey(name: "dataType")
  final String dataType;
  @JsonKey(name: "weight")
  final int weight;
  @JsonKey(name: "categoryId")
  final int categoryId;
  @JsonKey(name: "category")
  final Category category;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const Filter({
    this.id = -1,
    this.name = '',
    this.filterType = '',
    this.values = '',
    this.dataType = '',
    this.weight = -1,
    this.categoryId = -1,
    this.category = const Category(),
    this.isVisible = false,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@JsonSerializable()
class FileElement {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "order")
  final int order;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "fileInfo")
  final String fileInfo;
  @JsonKey(name: "variationId")
  final String variationId;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const FileElement({
    this.id = '',
    this.order = -1,
    this.url = '',
    this.fileInfo = '',
    this.variationId = '',
    this.productId = '',
    this.isVisible = false,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) =>
      _$FileElementFromJson(json);

  Map<String, dynamic> toJson() => _$FileElementToJson(this);
}

@JsonSerializable()
class Price {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "value")
  final int value;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "currencyId")
  final int currencyId;
  @JsonKey(name: "variationId")
  final String variationId;

  const Price({
    this.id = -1,
    this.value = -1,
    this.type = '',
    this.currencyId = -1,
    this.variationId = '',
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "state")
  final String state;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "categoryId")
  final int categoryId;
  @JsonKey(name: "organizationId")
  final int organizationId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const Product({
    this.id = '',
    this.state = '',
    this.name = '',
    this.description = '',
    this.categoryId = -1,
    this.organizationId = -1,
    this.isVisible = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
