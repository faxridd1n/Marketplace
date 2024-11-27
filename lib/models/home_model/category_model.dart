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
  List<Item> item;

  CategoryModel({
    this.item = const [],
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "parentId")
  int parentId;
  @JsonKey(name: "imageId")
  String imageId;
  @JsonKey(name: "image")
  Image image;
  @JsonKey(name: "iconId")
  String iconId;
  @JsonKey(name: "icon")
  Map icon;
  @JsonKey(name: "childs")
  List childs;
  @JsonKey(name: "isVisible")
  bool isVisible;

  Item(
    this.image, {
    this.id = -1,
    this.name = '',
    this.parentId = -1,
    this.imageId = '',
    this.iconId = '',
    this.icon = const {},
    this.childs = const [],
    this.isVisible = false,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "extension")
  String extension;
  @JsonKey(name: "contentType")
  String contentType;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "isVisible")
  bool isVisible;

  Image({
    this.id = '',
    this.url = '',
    this.name = '',
    this.extension = '',
    this.contentType = '',
    this.createdAt = '',
    this.isVisible = false,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
