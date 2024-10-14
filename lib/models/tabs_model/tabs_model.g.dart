// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabsModel _$TabsModelFromJson(Map<String, dynamic> json) => TabsModel(
      Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$TabsModelToJson(TabsModel instance) => <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ResultItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allCount: (json['allCount'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'items': instance.items,
      'allCount': instance.allCount,
    };

ResultItem _$ResultItemFromJson(Map<String, dynamic> json) => ResultItem(
      id: (json['id'] as num?)?.toInt() ?? -1,
      order: (json['order'] as num?)?.toInt() ?? -1,
      state: (json['state'] as num?)?.toInt() ?? -1,
      type: (json['type'] as num?)?.toInt() ?? -1,
      names: (json['names'] as List<dynamic>?)
              ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      name: json['name'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ItemItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ResultItemToJson(ResultItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'state': instance.state,
      'type': instance.type,
      'names': instance.names,
      'name': instance.name,
      'items': instance.items,
    };

ItemItem _$ItemItemFromJson(Map<String, dynamic> json) => ItemItem(
      id: (json['id'] as num?)?.toInt() ?? -1,
      link: json['link'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? -1,
      fileId: json['fileId'] as String? ?? '',
    );

Map<String, dynamic> _$ItemItemToJson(ItemItem instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'order': instance.order,
      'fileId': instance.fileId,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      languageCode: $enumDecode(_$LanguageCodeEnumMap, json['languageCode']),
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'languageCode': _$LanguageCodeEnumMap[instance.languageCode]!,
      'text': instance.text,
    };

const _$LanguageCodeEnumMap = {
  LanguageCode.EN: 'en',
  LanguageCode.RU: 'ru',
  LanguageCode.UZ_CYRL_QQ: 'uz-Cyrl-QQ',
  LanguageCode.UZ_CYRL_UZ: 'uz-Cyrl-UZ',
  LanguageCode.UZ_LATN_UZ: 'uz-Latn-UZ',
};
