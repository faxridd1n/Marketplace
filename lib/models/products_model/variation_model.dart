import 'package:flutter_application_1/models/products_model/file_element_model.dart';
import 'package:flutter_application_1/models/products_model/price_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'variation_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VariationModel {
  final String id;
  final int count;
  final String productId;
  @PriceConverter()
  final List<PriceModel> prices;
  @FileElementConverter()
  final List<FileElementModel> files;
  final List<dynamic> attributeValues;
  final bool isVisible;
  final String moderationStatus;
  final bool compensationOnly;
  final int saleType;
  final int oonModerationStatus;

  VariationModel({
    this.id = '',
    this.count = -1,
    this.productId = '',
    this.prices = const [],
    this.files = const [],
    this.attributeValues = const [],
    this.isVisible = false,
    this.moderationStatus = '',
    this.compensationOnly = false,
    this.saleType = -1,
    this.oonModerationStatus = -1,
  });
  factory VariationModel.fromJson(Map<String, dynamic> json) => _$VariationModelFromJson(json);

  Map<String, dynamic> toJson() => _$VariationModelToJson(this);
}

class VariationConverter implements JsonConverter<VariationModel, Map<String, dynamic>> {
  const VariationConverter();

  @override
  VariationModel fromJson(Map<String, dynamic> json) => VariationModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(VariationModel object) => {};
}
