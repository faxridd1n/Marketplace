class RegisterUserModel {
  String? firstname;
  String? lastname;
  String? middlename;
  String? passportSerial;
  String? passportNumber;
  String? birthDate;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  int? passportType;

  RegisterUserModel({
    this.firstname,
    this.lastname,
    this.middlename,
    this.passportSerial,
    this.passportNumber,
    this.birthDate,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
    this.passportType,
  });
}
