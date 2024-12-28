// To parse this JSON data, do
//
//     final basketDeleteResModel = basketDeleteResModelFromJson(jsonString);

import 'dart:convert';

BasketDeleteResModel basketDeleteResModelFromJson(String str) => BasketDeleteResModel.fromJson(json.decode(str));

String basketDeleteResModelToJson(BasketDeleteResModel data) => json.encode(data.toJson());

class BasketDeleteResModel {
    final Result? result;
    final Map? error;

    const BasketDeleteResModel({
        this.result,
        this.error,
    });

    factory BasketDeleteResModel.fromJson(Map<String, dynamic> json) => BasketDeleteResModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "error": error,
    };
}

class Result {
    bool? success;

    Result({
        this.success,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
    };
}
