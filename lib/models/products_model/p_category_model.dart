import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PCategoryModel {
  final int id;
  final String name;
  final String imageId;
  final bool isVisible;

  const PCategoryModel({
    this.id = -1,
    this.name = '',
    this.imageId = '',
    this.isVisible = false,
  });
  factory PCategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

class CategoryConverter implements JsonConverter<PCategoryModel, Map<String, dynamic>> {
  const CategoryConverter();

  @override
  PCategoryModel fromJson(Map<String, dynamic> json) => PCategoryModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(PCategoryModel object) => {};
}
