// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
    Result? result;
    dynamic error;

    ProductDetailModel({
        this.result,
        this.error,
    });

    factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "error": error,
    };
}

class Result {
    String? id;
    int? state;
    List<Description>? names;
    String? name;
    List<Description>? descriptions;
    String? description;
    int? categoryId;
    Category? category;
    int? brandId;
    String? brand;
    int? organizationId;
    List<Variation>? variations;
    bool? isVisible;
    String? moderationStatus;
    double? rating;
    double? reviewCount;
    int? productNumber;
    DateTime? createdDate;
    dynamic updatedDate;

    Result({
        this.id,
        this.state,
        this.names,
        this.name,
        this.descriptions,
        this.description,
        this.categoryId,
        this.category,
        this.brandId,
        this.brand,
        this.organizationId,
        this.variations,
        this.isVisible,
        this.moderationStatus,
        this.rating,
        this.reviewCount,
        this.productNumber,
        this.createdDate,
        this.updatedDate,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        state: json["state"],
        names: json["names"] == null ? [] : List<Description>.from(json["names"]!.map((x) => Description.fromJson(x))),
        name: json["name"],
        descriptions: json["descriptions"] == null ? [] : List<Description>.from(json["descriptions"]!.map((x) => Description.fromJson(x))),
        description: json["description"],
        categoryId: json["categoryId"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        brandId: json["brandId"],
        brand: json["brand"],
        organizationId: json["organizationId"],
        variations: json["variations"] == null ? [] : List<Variation>.from(json["variations"]!.map((x) => Variation.fromJson(x))),
        isVisible: json["isVisible"],
        moderationStatus: json["moderationStatus"],
        rating: json["rating"],
        reviewCount: json["reviewCount"],
        productNumber: json["productNumber"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "state": state,
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x.toJson())),
        "name": name,
        "descriptions": descriptions == null ? [] : List<dynamic>.from(descriptions!.map((x) => x.toJson())),
        "description": description,
        "categoryId": categoryId,
        "category": category?.toJson(),
        "brandId": brandId,
        "brand": brand,
        "organizationId": organizationId,
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x.toJson())),
        "isVisible": isVisible,
        "moderationStatus": moderationStatus,
        "rating": rating,
        "reviewCount": reviewCount,
        "productNumber": productNumber,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate,
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

class Description {
    LanguageCode? languageCode;
    String? text;

    Description({
        this.languageCode,
        this.text,
    });

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        languageCode: languageCodeValues.map[json["languageCode"]]!,
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "languageCode": languageCodeValues.reverse[languageCode],
        "text": text,
    };
}

enum LanguageCode {
    EN,
    RU,
    UZ_CYRL_QQ,
    UZ_CYRL_UZ,
    UZ_LATN_UZ
}

final languageCodeValues = EnumValues({
    "en": LanguageCode.EN,
    "ru": LanguageCode.RU,
    "uz-Cyrl-QQ": LanguageCode.UZ_CYRL_QQ,
    "uz-Cyrl-UZ": LanguageCode.UZ_CYRL_UZ,
    "uz-Latn-UZ": LanguageCode.UZ_LATN_UZ
});

class Variation {
    String? id;
    int? count;
    String? productId;
    int? idForOrder;
    Product? product;
    List<Price>? prices;
    List<FileElement>? files;
    List<AttributeValue>? attributeValues;
    bool? isVisible;
    String? moderationStatus;
    bool? compensationOnly;
    int? saleType;
    int? oonModerationStatus;

    Variation({
        this.id,
        this.count,
        this.productId,
        this.idForOrder,
        this.product,
        this.prices,
        this.files,
        this.attributeValues,
        this.isVisible,
        this.moderationStatus,
        this.compensationOnly,
        this.saleType,
        this.oonModerationStatus,
    });

    factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"],
        count: json["count"],
        productId: json["productId"],
        idForOrder: json["idForOrder"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        prices: json["prices"] == null ? [] : List<Price>.from(json["prices"]!.map((x) => Price.fromJson(x))),
        files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
        attributeValues: json["attributeValues"] == null ? [] : List<AttributeValue>.from(json["attributeValues"]!.map((x) => AttributeValue.fromJson(x))),
        isVisible: json["isVisible"],
        moderationStatus: json["moderationStatus"],
        compensationOnly: json["compensationOnly"],
        saleType: json["saleType"],
        oonModerationStatus: json["oonModerationStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "productId": productId,
        "idForOrder": idForOrder,
        "product": product?.toJson(),
        "prices": prices == null ? [] : List<dynamic>.from(prices!.map((x) => x.toJson())),
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
        "attributeValues": attributeValues == null ? [] : List<dynamic>.from(attributeValues!.map((x) => x.toJson())),
        "isVisible": isVisible,
        "moderationStatus": moderationStatus,
        "compensationOnly": compensationOnly,
        "saleType": saleType,
        "oonModerationStatus": oonModerationStatus,
    };
}

class AttributeValue {
    String? id;
    String? value;
    String? valueTranslation;
    List<Description>? valueTranslations;
    int? attributeId;
    Attribute? attribute;
    String? productId;
    String? variationId;
    bool? isVisible;

    AttributeValue({
        this.id,
        this.value,
        this.valueTranslation,
        this.valueTranslations,
        this.attributeId,
        this.attribute,
        this.productId,
        this.variationId,
        this.isVisible,
    });

    factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
        id: json["id"],
        value: json["value"],
        valueTranslation: json["valueTranslation"],
        valueTranslations: json["valueTranslations"] == null ? [] : List<Description>.from(json["valueTranslations"]!.map((x) => Description.fromJson(x))),
        attributeId: json["attributeId"],
        attribute: json["attribute"] == null ? null : Attribute.fromJson(json["attribute"]),
        productId: json["productId"],
        variationId: json["variationId"],
        isVisible: json["isVisible"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "valueTranslation": valueTranslation,
        "valueTranslations": valueTranslations == null ? [] : List<dynamic>.from(valueTranslations!.map((x) => x.toJson())),
        "attributeId": attributeId,
        "attribute": attribute?.toJson(),
        "productId": productId,
        "variationId": variationId,
        "isVisible": isVisible,
    };
}

class Attribute {
    int? id;
    int? weight;
    DataType? dataType;
    bool? hasFilter;
    bool? isValueTranslated;
    bool? isRequired;
    String? name;
    String? description;
    int? categoryId;
    String? filterId;
    String? filter;
    String? groupId;
    bool? isVisible;
    Type? type;

    Attribute({
        this.id,
        this.weight,
        this.dataType,
        this.hasFilter,
        this.isValueTranslated,
        this.isRequired,
        this.name,
        this.description,
        this.categoryId,
        this.filterId,
        this.filter,
        this.groupId,
        this.isVisible,
        this.type,
    });

    factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        weight: json["weight"],
        dataType: dataTypeValues.map[json["dataType"]]!,
        hasFilter: json["hasFilter"],
        isValueTranslated: json["isValueTranslated"],
        isRequired: json["isRequired"],
        name: json["name"],
        description: json["description"],
        categoryId: json["categoryId"],
        filterId: json["filterId"],
        filter: json["filter"],
        groupId: json["groupId"],
        isVisible: json["isVisible"],
        type: typeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "dataType": dataTypeValues.reverse[dataType],
        "hasFilter": hasFilter,
        "isValueTranslated": isValueTranslated,
        "isRequired": isRequired,
        "name": name,
        "description": description,
        "categoryId": categoryId,
        "filterId": filterId,
        "filter": filter,
        "groupId": groupId,
        "isVisible": isVisible,
        "type": typeValues.reverse[type],
    };
}

enum DataType {
    TEXT
}

final dataTypeValues = EnumValues({
    "Text": DataType.TEXT
});

enum Type {
    BASIC
}

final typeValues = EnumValues({
    "Basic": Type.BASIC
});

class FileElement {
    String? id;
    int? order;
    String? url;
    String? fileInfo;
    String? variationId;
    String? productId;
    bool? isVisible;

    FileElement({
        this.id,
        this.order,
        this.url,
        this.fileInfo,
        this.variationId,
        this.productId,
        this.isVisible,
    });

    factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        order: json["order"],
        url: json["url"],
        fileInfo: json["fileInfo"],
        variationId: json["variationId"],
        productId: json["productId"],
        isVisible: json["isVisible"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "url": url,
        "fileInfo": fileInfo,
        "variationId": variationId,
        "productId": productId,
        "isVisible": isVisible,
    };
}

class Price {
    int? id;
    double? value;
    String? type;
    int? currencyId;
    String? variationId;

    Price({
        this.id,
        this.value,
        this.type,
        this.currencyId,
        this.variationId,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json["id"],
        value: json["value"],
        type: json["type"],
        currencyId: json["currencyId"],
        variationId: json["variationId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "type": type,
        "currencyId": currencyId,
        "variationId": variationId,
    };
}

class Product {
    String? id;
    String? state;
    String? name;
    String? description;
    int? categoryId;
    int? organizationId;
    bool? isVisible;

    Product({
        this.id,
        this.state,
        this.name,
        this.description,
        this.categoryId,
        this.organizationId,
        this.isVisible,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        state: json["state"],
        name: json["name"],
        description: json["description"],
        categoryId: json["categoryId"],
        organizationId: json["organizationId"],
        isVisible: json["isVisible"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "state": state,
        "name": name,
        "description": description,
        "categoryId": categoryId,
        "organizationId": organizationId,
        "isVisible": isVisible,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
