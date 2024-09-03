import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PriceModel {
  final int id;
  final double value;
  final String type;
  final int currencyId;
  final String variationId;

  const PriceModel({
    this.id = -1,
    this.value = -1.0,
    this.type = '',
    this.currencyId = -1,
    this.variationId = '',
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceModelToJson(this);
}

class PriceConverter implements JsonConverter<PriceModel, Map<String, dynamic>> {
  const PriceConverter();

  @override
  PriceModel fromJson(Map<String, dynamic> json) => PriceModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(PriceModel object) => {};
}
