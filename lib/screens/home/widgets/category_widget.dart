import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/models/home_model/category_model.dart';
import 'package:flutter_application_1/screens/katalog/katalog_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget(this.index, this.model, {super.key});

  final CategoryModel model;
  final int index;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) {
              return KatalogPage(model: widget.model, index: widget.index);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 100,
        child: Column(
          children: [
           ClipRRect(
  borderRadius: BorderRadius.circular(7),
  child: FadeInImage(
    height: 60,
    width: 70,
    fit: BoxFit.fill,
    placeholder: const AssetImage(AppImages.noImage),
    image: widget.model.item?[widget.index].image?.url != null
        ? NetworkImage(widget.model.item![widget.index].image!.url!)
        : const AssetImage(AppImages.noImage) as ImageProvider,  // Fallback to local image if URL is null
    imageErrorBuilder: (context, error, stackTrace) {
      return SizedBox(
        width: 70,
        height: 60,
        child: SvgPicture.asset(AppIcons.productPlaceholder),  // SVG placeholder in case of error
      );
    },
  ),
),

            const SizedBox(
              height: 5,
            ),
            Text(
              widget.model.item?[widget.index].name ?? 'Empty',
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
