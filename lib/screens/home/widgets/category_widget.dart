import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/models/home_model/category_model.dart';
import 'package:flutter_application_1/screens/home/category_products_page.dart';
import 'package:flutter_application_1/screens/see_all/see_all_page.dart';
import 'package:flutter_application_1/widgets/custom_cachedd_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget {
  final Item model;

  const CategoryWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) {
              return SeeAllPage(
                categoryId: model.id,
                title: model.name,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 100,
        child: Column(
          children: [
            CustomCachedImage(
              imageUrl: model.image.url,
              height: 60,
              width: 70,
              borderRadius: BorderRadius.circular(8),
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 5),
            Text(
              model.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
