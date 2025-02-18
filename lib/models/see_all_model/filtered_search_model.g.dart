// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilteredSearchModel _$FilteredSearchModelFromJson(Map<String, dynamic> json) =>
    FilteredSearchModel(
      result: json['result'] == null
          ? const Result()
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$FilteredSearchModelToJson(
        FilteredSearchModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      item: (json['item'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'item': instance.item,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      parentId: json['parentId'] as String? ?? '',
      imageId: json['imageId'] as String? ?? '',
      image: json['image'] as String? ?? '',
      iconId: json['iconId'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      childs: json['childs'] as List<dynamic>? ?? const [],
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'imageId': instance.imageId,
      'image': instance.image,
      'iconId': instance.iconId,
      'icon': instance.icon,
      'childs': instance.childs,
      'isVisible': instance.isVisible,
    };
