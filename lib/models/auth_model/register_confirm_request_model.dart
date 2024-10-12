// To parse this JSON data, do
//
//     final registerConfirmRequestModel = registerConfirmRequestModelFromJson(jsonString);

import 'dart:convert';

RegisterConfirmRequestModel registerConfirmRequestModelFromJson(String str) => RegisterConfirmRequestModel.fromJson(json.decode(str));

String registerConfirmRequestModelToJson(RegisterConfirmRequestModel data) => json.encode(data.toJson());

class RegisterConfirmRequestModel {
    int? clientId;
    String? otp;
    String? deviceId;
    int? deviceType;

    RegisterConfirmRequestModel({
        this.clientId,
        this.otp,
        this.deviceId,
        this.deviceType,
    });

    factory RegisterConfirmRequestModel.fromJson(Map<String, dynamic> json) => RegisterConfirmRequestModel(
        clientId: json["clientId"],
        otp: json["otp"],
        deviceId: json["deviceId"],
        deviceType: json["deviceType"],
    );

    Map<String, dynamic> toJson() => {
        "clientId": clientId,
        "otp": otp,
        "deviceId": deviceId,
        "deviceType": deviceType,
    };
}
