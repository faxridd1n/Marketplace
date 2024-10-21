// To parse this JSON data, do
//
//     final LoginModel = LoginModelFromJson(jsonString);

import 'dart:convert';

LoginModel LoginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    Result? result;
    Map? error;

    LoginModel({
        this.result,
        this.error,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
