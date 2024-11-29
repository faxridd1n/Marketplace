import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'basket_product_model.g.dart';

BasketProductModel basketProductModelFromJson(String str) =>
    BasketProductModel.fromJson(json.decode(str));

String basketProductModelToJson(BasketProductModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class BasketProductModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Error error;

  BasketProductModel({
    Result? result, // Make result nullable
    Error? error, // Make error nullable
  })  : result = result ?? Result(), // Default to a new Result() if null
        error = error ?? Error(); // Default to a new Error() if null

  factory BasketProductModel.fromJson(Map<String, dynamic> json) =>
      _$BasketProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketProductModelToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: "errorCode")
  final int errorCode;
  @JsonKey(name: "errorMessage")
  final String errorMessage;

  Error({
    this.errorCode = 0,
    this.errorMessage = '',
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "period")
  final int period;
  @JsonKey(name: "saleType")
  final int saleType;
  @JsonKey(name: "products")
  final List<ProductElement> products;
  @JsonKey(name: "totalProductCount")
  final int totalProductCount;
  @JsonKey(name: "originPrice")
  final int originPrice;
  @JsonKey(name: "vatPrice")
  final int vatPrice;
  @JsonKey(name: "compensationPrice")
  final int compensationPrice;
  @JsonKey(name: "installmentPrice")
  final int installmentPrice;
  @JsonKey(name: "oonCompensationMale")
  final int oonCompensationMale;
  @JsonKey(name: "oonCompensationFemale")
  final int oonCompensationFemale;
  @JsonKey(name: "orgId")
  final int orgId;

  Result({
    this.id = 0,
    this.period = 0,
    this.saleType = 0,
    this.products = const [],
    this.totalProductCount = 0,
    this.originPrice = 0,
    this.vatPrice = 0,
    this.compensationPrice = 0,
    this.installmentPrice = 0,
    this.oonCompensationMale = 0,
    this.oonCompensationFemale = 0,
    this.orgId = 0,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ProductElement {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "product")
  final ProductProduct product;
  @JsonKey(name: "prices")
  final List<Price> prices;
  @JsonKey(name: "files")
  final List<FileElement> files;
  @JsonKey(name: "attributeValues")
  final List<AttributeValue> attributeValues;

  ProductElement({
    this.id = '',
    this.count = 0,
    this.productId = '',
    ProductProduct? product,
    this.prices = const [],
    this.files = const [],
    this.attributeValues = const [],
  }) : product = product ?? ProductProduct();

  factory ProductElement.fromJson(Map<String, dynamic> json) =>
      _$ProductElementFromJson(json);

  Map<String, dynamic> toJson() => _$ProductElementToJson(this);
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
  final List<ValueTranslation> valueTranslations;
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

  AttributeValue({
    this.id = '',
    this.value = '',
    this.valueTranslation = '',
    this.valueTranslations = const [],
    this.attributeId = 0,
    Attribute? attribute,
    this.productId = '',
    this.variationId = '',
    this.isVisible = true,
  }) : attribute = attribute ?? Attribute();

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
  final List<ValueTranslation> names;
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

  Attribute({
    this.id = 0,
    this.weight = 0,
    this.dataType = '',
    this.hasFilter = false,
    this.isValueTranslated = false,
    this.isRequired = false,
    this.name = '',
    this.names = const [],
    this.description = '',
    this.categoryId = 0,
    this.filterId = 0,
    Filter? filter,
    this.groupId = 0,
    this.isVisible = true,
    this.isAdditional = false,
    this.type = '',
  }) : filter = filter ?? Filter();

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

  Filter({
    this.id = 0,
    this.name = '',
    this.filterType = '',
    this.values = '',
    this.dataType = '',
    this.weight = 0,
    this.categoryId = 0,
    Category? category, // Make category nullable
    this.isVisible = true,
  }) : category = category ??
            Category(); // Assign default value of Category() if null is passed

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
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

  Category({
    this.id = 0,
    this.name = '',
    this.imageId = '',
    this.isVisible = true,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class ValueTranslation {
  @JsonKey(name: "languageCode")
  final String languageCode;
  @JsonKey(name: "text")
  final String text;

  ValueTranslation({
    this.languageCode = '',
    this.text = '',
  });

  factory ValueTranslation.fromJson(Map<String, dynamic> json) =>
      _$ValueTranslationFromJson(json);

  Map<String, dynamic> toJson() => _$ValueTranslationToJson(this);
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
  final FileInfo fileInfo;
  @JsonKey(name: "variationId")
  final String variationId;
  @JsonKey(name: "productId")
  final String productId;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  // Constructor without 'const' for fileInfo
  FileElement({
    this.id = '',
    this.order = 0,
    this.url = '',
    FileInfo? fileInfo, // Make fileInfo nullable
    this.variationId = '',
    this.productId = '',
    this.isVisible = true,
  }) : fileInfo = fileInfo ??
            FileInfo(); // Assign default FileInfo() if null is passed

  factory FileElement.fromJson(Map<String, dynamic> json) =>
      _$FileElementFromJson(json);

  Map<String, dynamic> toJson() => _$FileElementToJson(this);
}

@JsonSerializable()
class FileInfo {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "extension")
  final String extension;
  @JsonKey(name: "contentType")
  final String contentType;
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  FileInfo({
    this.id = '',
    this.url = '',
    this.name = '',
    this.extension = '',
    this.contentType = '',
    DateTime? createdAt,
    this.isVisible = true,
  }) : createdAt = createdAt ?? DateTime.now(); // Assign DateTime.now()

  factory FileInfo.fromJson(Map<String, dynamic> json) =>
      _$FileInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FileInfoToJson(this);
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

  Price({
    this.id = 0,
    this.value = 0,
    this.type = '',
    this.currencyId = 0,
    this.variationId = '',
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class ProductProduct {
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

  ProductProduct({
    this.id = '',
    this.state = '',
    this.name = '',
    this.description = '',
    this.categoryId = 0,
    this.organizationId = 0,
    this.isVisible = true,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) =>
      _$ProductProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductProductToJson(this);
}
