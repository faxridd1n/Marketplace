// To parse this JSON data, do
//
//     final organizationContactModel = organizationContactModelFromJson(jsonString);

import 'dart:convert';

OrganizationContactModel organizationContactModelFromJson(String str) => OrganizationContactModel.fromJson(json.decode(str));

String organizationContactModelToJson(OrganizationContactModel data) => json.encode(data.toJson());

class OrganizationContactModel {
    Result? result;
    String? error;

    OrganizationContactModel({
        this.result,
        this.error,
    });

    factory OrganizationContactModel.fromJson(Map<String, dynamic> json) => OrganizationContactModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "error": error,
    };
}

class Result {
    double? rating;
    int? reviewCount;
    int? id;
    int? organizationId;
    String? email;
    String? organizationName;
    String? address;
    String? phone;
    String? description;
    Region? region;

    Result({
        this.rating,
        this.reviewCount,
        this.id,
        this.organizationId,
        this.email,
        this.organizationName,
        this.address,
        this.phone,
        this.description,
        this.region,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        rating: json["rating"],
        reviewCount: json["reviewCount"],
        id: json["id"],
        organizationId: json["organizationId"],
        email: json["email"],
        organizationName: json["organizationName"],
        address: json["address"],
        phone: json["phone"],
        description: json["description"],
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "reviewCount": reviewCount,
        "id": id,
        "organizationId": organizationId,
        "email": email,
        "organizationName": organizationName,
        "address": address,
        "phone": phone,
        "description": description,
        "region": region?.toJson(),
    };
}

class Region {
    int? id;
    String? name;
    String? parentId;
    int? regionType;

    Region({
        this.id,
        this.name,
        this.parentId,
        this.regionType,
    });

    factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
        regionType: json["regionType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parentId": parentId,
        "regionType": regionType,
    };
}
