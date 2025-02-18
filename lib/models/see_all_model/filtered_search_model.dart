// To parse this JSON data, do
//
//     final filteredSearchModel = filteredSearchModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'filtered_search_model.g.dart';

FilteredSearchModel filteredSearchModelFromJson(String str) =>
    FilteredSearchModel.fromJson(json.decode(str));

String filteredSearchModelToJson(FilteredSearchModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class FilteredSearchModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Map error;

  const FilteredSearchModel({
    this.result = const Result(),
    this.error = const {},
  });

  factory FilteredSearchModel.fromJson(Map<String, dynamic> json) =>
      _$FilteredSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilteredSearchModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "item")
  final List<Item> item;

  const Result({
    this.item = const [],
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "parentId")
  final String parentId;
  @JsonKey(name: "imageId")
  final String imageId;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "iconId")
  final String iconId;
  @JsonKey(name: "icon")
  final String icon;
  @JsonKey(name: "childs")
  final List childs;
  @JsonKey(name: "isVisible")
  final bool isVisible;

  const Item({
    this.id = -1,
    this.name = '',
    this.parentId = '',
    this.imageId = '',
    this.image = '',
    this.iconId = '',
    this.icon = '',
    this.childs = const [],
    this.isVisible = false,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
