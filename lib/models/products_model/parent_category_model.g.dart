// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParentCategoryModel _$ParentCategoryModelFromJson(Map<String, dynamic> json) =>
    ParentCategoryModel(
      id: json['id'] as String? ?? '',
      state: (json['state'] as num?)?.toInt() ?? -1,
      service: (json['service'] as num?)?.toInt() ?? -1,
      tab: (json['tab'] as num?)?.toInt() ?? -1,
      nameId: json['name_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      descriptionId: json['description_id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categoryId: (json['category_id'] as num?)?.toInt() ?? -1,
      category: json['category'] == null
          ? const PCategoryModel()
          : const CategoryConverter()
              .fromJson(json['category'] as Map<String, dynamic>),
      organizationId: (json['organization_id'] as num?)?.toInt() ?? -1,
      organizationName: json['organization_name'] as String? ?? '',
      variations: (json['variations'] as List<dynamic>?)
              ?.map((e) => const VariationConverter()
                  .fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isVisible: json['is_visible'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      reviewCount: (json['review_count'] as num?)?.toDouble() ?? 0,
      productNumber: (json['product_number'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$ParentCategoryModelToJson(
        ParentCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'service': instance.service,
      'tab': instance.tab,
      'name_id': instance.nameId,
      'name': instance.name,
      'description_id': instance.descriptionId,
      'description': instance.description,
      'category_id': instance.categoryId,
      'category': const CategoryConverter().toJson(instance.category),
      'organization_id': instance.organizationId,
      'organization_name': instance.organizationName,
      'variations':
          instance.variations.map(const VariationConverter().toJson).toList(),
      'is_visible': instance.isVisible,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'product_number': instance.productNumber,
    };
