// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_cards_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserCardsResponseModel _$GetUserCardsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUserCardsResponseModel(
      result: json['result'] == null
          ? const Result()
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] == null
          ? const Error()
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserCardsResponseModelToJson(
        GetUserCardsResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      errorCode: (json['errorCode'] as num?)?.toInt() ?? -1,
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allCount: (json['allCount'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'items': instance.items,
      'allCount': instance.allCount,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: (json['id'] as num?)?.toInt() ?? -1,
      ownerName: json['ownerName'] as String? ?? '',
      cardNumber: json['cardNumber'] as String? ?? '',
      expireDate: json['expireDate'] as String? ?? '',
      isMainCard: json['isMainCard'] as bool? ?? false,
      bankName: json['bankName'] as String? ?? '',
      bankLogo: json['bankLogo'] as String? ?? '',
      cardType: (json['cardType'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'ownerName': instance.ownerName,
      'cardNumber': instance.cardNumber,
      'expireDate': instance.expireDate,
      'isMainCard': instance.isMainCard,
      'bankName': instance.bankName,
      'bankLogo': instance.bankLogo,
      'cardType': instance.cardType,
    };
