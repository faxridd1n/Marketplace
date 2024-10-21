// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserTokenModelAdapter extends TypeAdapter<UserTokenModel> {
  @override
  final int typeId = 1;

  @override
  UserTokenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTokenModel(
      token: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserTokenModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTokenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
