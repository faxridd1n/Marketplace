// To parse this JSON data, do
//
//     final tabsModel = tabsModelFromJson(jsonString);

import 'dart:convert';

TabsModel tabsModelFromJson(String str) => TabsModel.fromJson(json.decode(str));

String tabsModelToJson(TabsModel data) => json.encode(data.toJson());

class TabsModel {
    Result? result;
    Map? error;

    TabsModel({
        this.result,
        this.error,
    });

    factory TabsModel.fromJson(Map<String, dynamic> json) => TabsModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "error": error,
    };
}

class Result {
    List<ResultItem>? items;
    int? allCount;

    Result({
        this.items,
        this.allCount,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        items: json["items"] == null ? [] : List<ResultItem>.from(json["items"]!.map((x) => ResultItem.fromJson(x))),
        allCount: json["allCount"],
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "allCount": allCount,
    };
}

class ResultItem {
    int? id;
    int? order;
    int? state;
    int? type;
    List<Name>? names;
    String? name;
    List<ItemItem>? items;

    ResultItem({
        this.id,
        this.order,
        this.state,
        this.type,
        this.names,
        this.name,
        this.items,
    });

    factory ResultItem.fromJson(Map<String, dynamic> json) => ResultItem(
        id: json["id"],
        order: json["order"],
        state: json["state"],
        type: json["type"],
        names: json["names"] == null ? [] : List<Name>.from(json["names"]!.map((x) => Name.fromJson(x))),
        name: json["name"],
        items: json["items"] == null ? [] : List<ItemItem>.from(json["items"]!.map((x) => ItemItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "state": state,
        "type": type,
        "names": names == null ? [] : List<dynamic>.from(names!.map((x) => x.toJson())),
        "name": name,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class ItemItem {
    int? id;
    String? link;
    int? order;
    String? fileId;

    ItemItem({
        this.id,
        this.link,
        this.order,
        this.fileId,
    });

    factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        id: json["id"],
        link: json["link"],
        order: json["order"],
        fileId: json["fileId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "order": order,
        "fileId": fileId,
    };
}

class Name {
    LanguageCode? languageCode;
    String? text;

    Name({
        this.languageCode,
        this.text,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        languageCode: languageCodeValues.map[json["languageCode"]]!,
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "languageCode": languageCodeValues.reverse[languageCode],
        "text": text,
    };
}

enum LanguageCode {
    EN,
    RU,
    UZ_CYRL_QQ,
    UZ_CYRL_UZ,
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
