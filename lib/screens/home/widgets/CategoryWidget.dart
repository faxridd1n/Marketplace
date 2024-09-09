import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppImagesPath.dart';
import 'package:flutter_application_1/models/home_model/CategoryModel.dart';
import 'package:flutter_application_1/screens/katalog/katalog_page.dart';

import '../../../assets_path/AppIconsPath.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatefulWidget {
  CategoryWidget(this.index, this.model, {super.key});

  CategoryModel model;
  int index;

  List categoryIcons = [
    AppIcons.category1,
    AppIcons.category2,
    AppIcons.category3,
    AppIcons.category4,
    AppIcons.category5,
    AppIcons.category6,
  ];
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              height: 60,
              width: 70,
              child: FadeInImage(
                fit: BoxFit.fill,
                placeholder: const AssetImage(
                  AppImages.solarPanel1,
                ),
                image: NetworkImage(
                  widget.model.item?[widget.index].image?.url ??
                      AppImages.solarPanel1,
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.solarPanel1,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
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
