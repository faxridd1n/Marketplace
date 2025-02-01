// To parse this JSON data, do
//
//     final tabsModel = tabsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'tabs_model.g.dart';

@JsonSerializable()
class TabsModel {
  @JsonKey(name: "result")
  final Result result;
  @JsonKey(name: "error")
  final Map error;

  const TabsModel({
    this.result = const Result(),
    this.error = const {},
  });

  factory TabsModel.fromJson(Map<String, dynamic> json) => _$TabsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TabsModelToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "items")
  final List<ResultItem> items;
  @JsonKey(name: "allCount")
  final int allCount;

  const Result({
    this.items = const [],
    this.allCount = -1,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ResultItem {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "order")
  final int order;
  @JsonKey(name: "state")
  final int state;
  @JsonKey(name: "type")
  final int type;
  @JsonKey(name: "names")
  final List<Name> names;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "items")
  final List<ItemItem> items;

  const ResultItem({
    this.id = -1,
    this.order = -1,
    this.state = -1,
    this.type = -1,
    this.names = const [],
    this.name = '',
    this.items = const [],
  });

  factory ResultItem.fromJson(Map<String, dynamic> json) => _$ResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$ResultItemToJson(this);
}

@JsonSerializable()
class ItemItem {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "link")
  final String link;
  @JsonKey(name: "order")
  final int order;
  @JsonKey(name: "fileId")
  final String fileId;

  const ItemItem({
    this.id = -1,
    this.link = '',
    this.order = -1,
    this.fileId = '',
  });

  factory ItemItem.fromJson(Map<String, dynamic> json) => _$ItemItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemItemToJson(this);
}

@JsonSerializable()
class Name {
  @JsonKey(name: "languageCode")
  final LanguageCode languageCode;
  @JsonKey(name: "text")
  final String text;

  const Name({
    this.languageCode = LanguageCode.UZ_LATN_UZ,
    this.text = '',
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

enum LanguageCode {
  @JsonValue("en")
  EN,
  @JsonValue("ru")
  RU,
  @JsonValue("uz-Cyrl-QQ")
  UZ_CYRL_QQ,
  @JsonValue("uz-Cyrl-UZ")
  UZ_CYRL_UZ,
  @JsonValue("uz-Latn-UZ")
  UZ_LATN_UZ
}

final languageCodeValues = EnumValues({
  "en": LanguageCode.EN,
  "ru": LanguageCode.RU,
  "uz-Cyrl-QQ": LanguageCode.UZ_CYRL_QQ,
  "uz-Cyrl-UZ": LanguageCode.UZ_CYRL_UZ,
  "uz-Latn-UZ": LanguageCode.UZ_LATN_UZ
});

class EnumValues<T> {
  final Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
