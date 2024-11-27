class PostLoginRequestModel {
  int? deviceType;
  String? deviceId;
  String? displayName;
  int? userType;
  String? imei;
  String? ip;
  String? otp;
  bool? isTrusted;
  String? firebaseToken;
  int? userRoleId;
  String? phoneNumber;

  PostLoginRequestModel({
    this.deviceType,
    this.deviceId,
    this.displayName,
    this.userType,
    this.imei,
    this.ip,
    this.otp,
    this.isTrusted,
    this.firebaseToken,
    this.userRoleId,
    this.phoneNumber,
  });
}
