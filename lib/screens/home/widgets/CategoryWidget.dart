import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/assets_path/AppImagesPath.dart';
import 'package:flutter_application_1/models/home_model/CategoryModel.dart';
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
        // Navigator.of(context, rootNavigator: true).push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return KatalogPage(model: widget.model, index: widget.index);
        //     },
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 100,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              height: 60,
              width: 70,
              child: FadeInImage(
                fit: BoxFit.fill,
                placeholder: const AssetImage(
                  AppImages.noImage,
                ),
                image:
                    NetworkImage(widget.model.item![widget.index].image!.url!),
                imageErrorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    width: 60,
                    height: 60,
                    // decoration: const BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage(
                    //       AppImages.no_image,
                    //     ),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    child: SvgPicture.asset(AppIcons.productPlaceholder),
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
