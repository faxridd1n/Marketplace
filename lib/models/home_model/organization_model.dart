// To parse this JSON data, do
//
//     final organizationModel = organizationModelFromJson(jsonString);

import 'dart:convert';

List<OrganizationModel> organizationModelFromJson(String str) => List<OrganizationModel>.from(json.decode(str).map((x) => OrganizationModel.fromJson(x)));

String organizationModelToJson(List<OrganizationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrganizationModel {
    int? id;
    String? organizationName;
    String? address;
    Contact? contact;
    double? rating;
    int? reviewCount;

    OrganizationModel({
        this.id,
        this.organizationName,
        this.address,
        this.contact,
        this.rating,
        this.reviewCount,
    });

    factory OrganizationModel.fromJson(Map<String, dynamic> json) => OrganizationModel(
        id: json["id"],
        organizationName: json["organizationName"],
        address: json["address"],
        contact: json["contact"] == null ? null : Contact.fromJson(json["contact"]),
        rating: json["rating"],
        reviewCount: json["reviewCount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "organizationName": organizationName,
        "address": address,
        "contact": contact?.toJson(),
        "rating": rating,
        "reviewCount": reviewCount,
    };
}

class Contact {
    String? phone;
    String? organizationName;
    String? email;
    String? description;
    int? regionId;
    int? organizationId;

    Contact({
        this.phone,
        this.organizationName,
        this.email,
        this.description,
        this.regionId,
        this.organizationId,
    });

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        phone: json["phone"],
        organizationName: json["organizationName"],
        email: json["email"],
        description: json["description"],
        regionId: json["regionId"],
        organizationId: json["organizationId"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "organizationName": organizationName,
        "email": email,
        "description": description,
        "regionId": regionId,
        "organizationId": organizationId,
    };
}
