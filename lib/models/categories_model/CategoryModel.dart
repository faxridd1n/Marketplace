// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    List<Item>? item;

    CategoryModel({
        this.item,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        item: json["item"] == null ? [] : List<Item>.from(json["item"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "item": item == null ? [] : List<dynamic>.from(item!.map((x) => x.toJson())),
    };
}

class Item {
    int? id;
    String? name;
    int? parentId;
    String? imageId;
    Image? image;
    List<Item>? childs;
    bool? isVisible;

    Item({
        this.id,
        this.name,
        this.parentId,
        this.imageId,
        this.image,
        this.childs,
        this.isVisible,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
        imageId: json["imageId"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        childs: json["childs"] == null ? [] : List<Item>.from(json["childs"]!.map((x) => Item.fromJson(x))),
        isVisible: json["isVisible"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parentId": parentId,
        "imageId": imageId,
        "image": image?.toJson(),
        "childs": childs == null ? [] : List<dynamic>.from(childs!.map((x) => x.toJson())),
        "isVisible": isVisible,
    };
}

class Image {
    String? id;
    String? url;
    String? name;
    Extension? extension;
    ContentType? contentType;
    DateTime? createdAt;
    bool? isVisible;

    Image({
        this.id,
        this.url,
        this.name,
        this.extension,
        this.contentType,
        this.createdAt,
        this.isVisible,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        extension: extensionValues.map[json["extension"]]!,
        contentType: contentTypeValues.map[json["contentType"]]!,
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        isVisible: json["isVisible"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "extension": extensionValues.reverse[extension],
        "contentType": contentTypeValues.reverse[contentType],
        "createdAt": createdAt?.toIso8601String(),
        "isVisible": isVisible,
    };
}

enum ContentType {
    IMAGE_JPEG,
    IMAGE_PNG
}

final contentTypeValues = EnumValues({
    "image/jpeg": ContentType.IMAGE_JPEG,
    "image/png": ContentType.IMAGE_PNG
});

enum Extension {
    EMPTY,
    JPG,
    PNG
}

final extensionValues = EnumValues({
    "": Extension.EMPTY,
    ".jpg": Extension.JPG,
    ".png": Extension.PNG
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
