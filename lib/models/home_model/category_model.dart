// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'category_model.g.dart';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: "item")
  final List<Item> item;

  const CategoryModel({
    this.item = const [],
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "parentId")
  final int parentId;
  @JsonKey(name: "imageId")
  final String imageId;
  @JsonKey(name: "image")
  final Icon image;
  @JsonKey(name: "iconId")
  final String iconId;
  @JsonKey(name: "icon")
  final Icon icon;
  @JsonKey(name: "childs")
  final List<Map> childs;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  Item({
    this.id = -1,
    this.name = '',
    this.parentId = -1,
    this.imageId = '',
    Icon? image,
    this.iconId = '',
    Icon? icon,
    this.childs = const [],
    this.isVisible = false,
  })  : image = image ?? Icon(),
        icon = icon ?? Icon();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Icon {
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

  Icon({
    this.id = '',
    this.url = '',
    this.name = '',
    this.extension = '',
    this.contentType = '',
    DateTime? createdAt,
    this.isVisible = false,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);

  Map<String, dynamic> toJson() => _$IconToJson(this);
}
