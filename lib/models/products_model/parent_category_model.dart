import 'package:flutter_application_1/models/products_model/p_category_model.dart';
import 'package:flutter_application_1/models/products_model/variation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent_category_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ParentCategoryModel {
  final String id;
  final int state;
  final int service;
  final int tab;
  final String nameId;
  final String name;
  final String descriptionId;
  final String description;
  final int categoryId;
  @CategoryConverter()
  final PCategoryModel category;
  final int organizationId;
  final String organizationName;
  @VariationConverter()
  final List<VariationModel> variations;
  final bool isVisible;
  final double rating;
  final double reviewCount;
  final int productNumber;

  const ParentCategoryModel({
    this.id = '',
    this.state = -1,
    this.service = -1,
    this.tab = -1,
    this.nameId = '',
    this.name = '',
    this.descriptionId = '',
    this.description = '',
    this.categoryId = -1,
    this.category = const PCategoryModel(),
    this.organizationId = -1,
    this.organizationName = '',
    this.variations = const [],
    this.isVisible = false,
    this.rating = 0,
    this.reviewCount = 0,
    this.productNumber = -1,
  });

  factory ParentCategoryModel.fromJson(Map<String, dynamic> json) => _$ParentCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParentCategoryModelToJson(this);
}
