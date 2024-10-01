// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    Result? result;
    Map? error;

    AuthModel({
        this.result,
        this.error,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "error": error,
    };
}

class Result {
    bool? isSent;
    String? phone;
    String? sentText;
    DateTime? sentDate;

    Result({
        this.isSent,
        this.phone,
        this.sentText,
        this.sentDate,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        isSent: json["isSent"],
        phone: json["phone"],
        sentText: json["sentText"],
        sentDate: json["sentDate"] == null ? null : DateTime.parse(json["sentDate"]),
    );

    Map<String, dynamic> toJson() => {
        "isSent": isSent,
        "phone": phone,
        "sentText": sentText,
        "sentDate": sentDate?.toIso8601String(),
    };
}
