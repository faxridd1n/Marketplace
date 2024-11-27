import 'package:hive/hive.dart';

part 'user_token_model.g.dart';

@HiveType(typeId: 0)
class UserTokenModel extends HiveObject {
  @HiveField(0)
  String token;

  UserTokenModel({required this.token});
}
