// To parse this JSON data, do
//
//     final filteredProductModel = filteredProductModelFromJson(jsonString);

import 'dart:convert';

FilteredProductModel filteredProductModelFromJson(String str) => FilteredProductModel.fromJson(json.decode(str));

String filteredProductModelToJson(FilteredProductModel data) => json.encode(data.toJson());

class FilteredProductModel {
    String? id;
    int? state;
    int? service;
    int? tab;
    int? nameId;
    String? name;
    int? descriptionId;
    String? description;
    int? categoryId;
    Category? category;
    int? organizationId;
    String? organizationName;
    List<Variation>? variations;
    bool? isVisible;
    double? rating;
    double? reviewCount;
    int? productNumber;

    FilteredProductModel({
        this.id,
        this.state,
        this.service,
        this.tab,
        this.nameId,
        this.name,
        this.descriptionId,
        this.description,
        this.categoryId,
        this.category,
        this.organizationId,
        this.organizationName,
        this.variations,
        this.isVisible,
        this.rating,
        this.reviewCount,
        this.productNumber,
    });

    factory FilteredProductModel.fromJson(Map<String, dynamic> json) => FilteredProductModel(
        id: json["id"],
        state: json["state"],
        service: json["service"],
        tab: json["tab"],
        nameId: json["nameId"],
        name: json["name"],
        descriptionId: json["descriptionId"],
        description: json["description"],
        categoryId: json["categoryId"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        organizationId: json["organizationId"],
        organizationName: json["organizationName"],
        variations: json["variations"] == null ? [] : List<Variation>.from(json["variations"]!.map((x) => Variation.fromJson(x))),
        isVisible: json["isVisible"],
        rating: json["rating"],
        reviewCount: json["reviewCount"],
        productNumber: json["productNumber"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "state": state,
        "service": service,
        "tab": tab,
        "nameId": nameId,
        "name": name,
        "descriptionId": descriptionId,
        "description": description,
        "categoryId": categoryId,
        "category": category?.toJson(),
        "organizationId": organizationId,
        "organizationName": organizationName,
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x.toJson())),
        "isVisible": isVisible,
        "rating": rating,
        "reviewCount": reviewCount,
        "productNumber": productNumber,
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

class Variation {
    String? id;
    int? count;
    String? productId;
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
    List<ValueTranslation>? valueTranslations;
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
        valueTranslations: json["valueTranslations"] == null ? [] : List<ValueTranslation>.from(json["valueTranslations"]!.map((x) => ValueTranslation.fromJson(x))),
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
    String? dataType;
    bool? hasFilter;
    bool? isValueTranslated;
    bool? isRequired;
    String? name;
    String? description;
    int? categoryId;
    int? filterId;
    Map? filter;
    int? groupId;
    bool? isVisible;
    String? type;

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
        dataType: json["dataType"],
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
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "dataType": dataType,
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
        "type": type,
    };
}

class ValueTranslation {
    LanguageCode? languageCode;
    String? text;

    ValueTranslation({
        this.languageCode,
        this.text,
    });

    factory ValueTranslation.fromJson(Map<String, dynamic> json) => ValueTranslation(
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

class FileElement {
    String? id;
    int? order;
    String? url;
    Map? fileInfo;
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
