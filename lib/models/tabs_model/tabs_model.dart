// To parse this JSON data, do
//
//     final tabsModel = tabsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'tabs_model.g.dart';

TabsModel tabsModelFromJson(String str) => TabsModel.fromJson(json.decode(str));

String tabsModelToJson(TabsModel data) => json.encode(data.toJson());

@JsonSerializable()
class TabsModel {
    @JsonKey(name: "result")
    Result result;
    @JsonKey(name: "error")
    Map error;

    TabsModel(
        this.result,
        {
        this.error=const{},
    });

    factory TabsModel.fromJson(Map<String, dynamic> json) => _$TabsModelFromJson(json);

    Map<String, dynamic> toJson() => _$TabsModelToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name: "items")
    List<ResultItem> items;
    @JsonKey(name: "allCount")
    int allCount;

    Result({
        this.items=const [],
        this.allCount=-1,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class ResultItem {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "order")
    int order;
    @JsonKey(name: "state")
    int state;
    @JsonKey(name: "type")
    int type;
    @JsonKey(name: "names")
    List<Name> names;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "items")
    List<ItemItem> items;

    ResultItem({
        this.id=-1,
        this.order=-1,
        this.state=-1,
        this.type=-1,
        this.names=const [],
        this.name='',
        this.items=const[],
    });

    factory ResultItem.fromJson(Map<String, dynamic> json) => _$ResultItemFromJson(json);

    Map<String, dynamic> toJson() => _$ResultItemToJson(this);
}

@JsonSerializable()
class ItemItem {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "link")
    String link;
    @JsonKey(name: "order")
    int order;
    @JsonKey(name: "fileId")
    String fileId;

    ItemItem({
        this.id=-1,
        this.link='',
        this.order=-1,
        this.fileId='',
    });

    factory ItemItem.fromJson(Map<String, dynamic> json) => _$ItemItemFromJson(json);

    Map<String, dynamic> toJson() => _$ItemItemToJson(this);
}

@JsonSerializable()
class Name {
    @JsonKey(name: "languageCode")
    LanguageCode languageCode;
    @JsonKey(name: "text")
    String text;

    Name({
        this.languageCode=LanguageCode.UZ_LATN_UZ,
        this.text='',
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
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
