// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_get_review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsGetReviewResponseModel _$ProductsGetReviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductsGetReviewResponseModel(
      result: json['result'] == null
          ? const Result()
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ProductsGetReviewResponseModelToJson(
        ProductsGetReviewResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
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
      id: json['id'] as String? ?? '',
      forId: json['forId'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? -1,
      rating: (json['rating'] as num?)?.toInt() ?? -1,
      content: json['content'] as String? ?? '',
      isAnonymous: json['isAnonymous'] as bool? ?? false,
      date: json['date'] as String? ?? '',
      updatedDate: json['updatedDate'] as String? ?? '',
      user: json['user'] == null
          ? const User()
          : User.fromJson(json['user'] as Map<String, dynamic>),
      reply: json['reply'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'forId': instance.forId,
      'status': instance.status,
      'rating': instance.rating,
      'content': instance.content,
      'isAnonymous': instance.isAnonymous,
      'date': instance.date,
      'updatedDate': instance.updatedDate,
      'user': instance.user,
      'reply': instance.reply,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: (json['userId'] as num?)?.toInt() ?? -1,
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
