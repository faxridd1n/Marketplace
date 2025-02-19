import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/home_model/category_model.dart';
import 'package:flutter_application_1/screens/navigation/navigation_page.dart';
import 'package:flutter_application_1/widgets/custom_cachedd_image.dart';
import '../../../core/language/language_constants.dart';
import '../category_products_page.dart';

class CategoryExpansionWidget extends StatelessWidget {
  final Item category;
  final bool isOpened;
  final ValueChanged<bool> onOpened;

  const CategoryExpansionWidget({
    required this.category,
    required this.isOpened,
    super.key,
    required this.onOpened,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: Border.all(color: AppColors.transparent),
      iconColor: AppColors.green,
      leading: CustomCachedImage(
        height: 50,
        width: 50,
        borderRadius: BorderRadius.circular(8),
        imageUrl: category.image.url,
      ),
      title: Text(
        category.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onExpansionChanged: onOpened,
      initiallyExpanded: isOpened,
      children: List.generate(
        category.childs.length + 1,
        (index) {
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 82),
            title: Text(
              index == 0 ? translation(context).all : category.childs[index]['name'] ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (ctx) => HomeTabControllerProvider(
                    controller:
                        HomeTabControllerProvider.of(context).controller,
                    child: CategoryProductsPage(
                      categoryId: category.id,
                      subCategoryId:
                          index == 0 ? null : category.childs[index]['id'],
                      categoryName: category.name,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
