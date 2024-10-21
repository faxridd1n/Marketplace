// To parse this JSON data, do
//
//     final userTokenModel = userTokenModelFromJson(jsonString);

import 'package:hive/hive.dart';

part 'user_token_model.g.dart';

@HiveType(typeId: 1)
class UserTokenModel {
  @HiveField(1)
  String token;

  UserTokenModel({
    this.token = '',
  });
}
