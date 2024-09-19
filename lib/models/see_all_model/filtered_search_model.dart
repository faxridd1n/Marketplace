// To parse this JSON data, do
//
//     final filteredSearchModel = filteredSearchModelFromJson(jsonString);

import 'dart:convert';

FilteredSearchModel filteredSearchModelFromJson(String str) => FilteredSearchModel.fromJson(json.decode(str));

String filteredSearchModelToJson(FilteredSearchModel data) => json.encode(data.toJson());

class FilteredSearchModel {
    int? id;
    String? name;
    String? filterType;
    String? values;
    String? dataType;
    int? weight;
    int? categoryId;
    Category? category;
    bool? isVisible;

    FilteredSearchModel({
        this.id,
        this.name,
        this.filterType,
        this.values,
        this.dataType,
        this.weight,
        this.categoryId,
        this.category,
        this.isVisible,
    });

    factory FilteredSearchModel.fromJson(Map<String, dynamic> json) => FilteredSearchModel(
        id: json["id"],
        name: json["name"],
        filterType: json["filterType"],
        values: json["values"],
        dataType: json["dataType"],
        weight: json["weight"],
        categoryId: json["categoryId"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        isVisible: json["isVisible"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "filterType": filterType,
        "values": values,
        "dataType": dataType,
        "weight": weight,
        "categoryId": categoryId,
        "category": category?.toJson(),
        "isVisible": isVisible,
    };
}

class Category {
    int? id;
    String? name;
    String? imageId;
    bool? isVisible;

    Category({
        this.id,
        this.name,
        this.imageId,
        this.isVisible,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        imageId: json["imageId"],
        isVisible: json["isVisible"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageId": imageId,
        "isVisible": isVisible,
    };
}
