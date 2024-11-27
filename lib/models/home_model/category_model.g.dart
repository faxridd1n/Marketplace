// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      item: (json['item'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      Image.fromJson(json['image'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      parentId: (json['parentId'] as num?)?.toInt() ?? -1,
      imageId: json['imageId'] as String? ?? '',
      iconId: json['iconId'] as String? ?? '',
      icon: json['icon'] as Map<String, dynamic>? ?? const {},
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

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['id'] as String? ?? '',
      url: json['url'] as String? ?? '',
      name: json['name'] as String? ?? '',
      extension: json['extension'] as String? ?? '',
      contentType: json['contentType'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      isVisible: json['isVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'extension': instance.extension,
      'contentType': instance.contentType,
      'createdAt': instance.createdAt,
      'isVisible': instance.isVisible,
    };
