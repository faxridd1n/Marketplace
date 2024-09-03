// To parse this JSON data, do
//
//     final postResponseBasketProductModel = postResponseBasketProductModelFromJson(jsonString);

import 'dart:convert';

PostResponseBasketModel postResponseBasketProductModelFromJson(String str) => PostResponseBasketModel.fromJson(json.decode(str));

String postResponseBasketProductModelToJson(PostResponseBasketModel data) => json.encode(data.toJson());

class PostResponseBasketModel {
    Result? result;
    Map? error;

    PostResponseBasketModel({
        this.result,
        this.error,
    });

    factory PostResponseBasketModel.fromJson(Map<String, dynamic> json) => PostResponseBasketModel(
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
