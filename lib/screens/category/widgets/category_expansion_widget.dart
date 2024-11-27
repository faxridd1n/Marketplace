import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/home_model/category_model.dart';

import '../../../assets_path/app_images_path.dart';
import '../../katalog/katalog_page.dart';

// ignore: must_be_immutable
class CategoryExpansionWidget extends StatefulWidget {
  CategoryExpansionWidget({required this.model, super.key});
  CategoryModel model;

  @override
  ExpansionTileWidgetState createState() => ExpansionTileWidgetState();
}

class ExpansionTileWidgetState extends State<CategoryExpansionWidget> {
  List<bool> isOpen = [];

  @override
  void initState() {
    super.initState();
    // Initialize isOpen list with the number of items from the model
    isOpen = List.generate(widget.model.item.length, (index) => false);
  }

  void _handleExpansion(int index) {
    setState(() {
      for (int i = 0; i < isOpen.length; i++) {
        isOpen[i] = i == index
            ? !isOpen[i]
            : false; // Toggle the selected tile, close others
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.model.item.length,
      shrinkWrap: true,
      itemBuilder: (context, parentIndex) {
        return _buildExpansionTile(parentIndex, 'title', widget.model);
      },
    );
  }

  ExpansionTile _buildExpansionTile(
      int parentIndex, String title, CategoryModel model) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      shape: Border.all(color: AppColors.transparent),
      iconColor: AppColors.green,
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
        ),
        height: 45,
        width: 45,
        child: ClipRRect(
          // Ensures that the image respects the rounded borders
          borderRadius: BorderRadius.circular(7),
          child: FadeInImage(
            fit: BoxFit.fill,
            placeholder: const AssetImage(
              AppImages.noImage, // Placeholder while image is loading
            ),
            image: NetworkImage(
              widget.model.item[parentIndex].image.url,
            ),
            imageErrorBuilder: (context, error, stackTrace) {
              return Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        AppImages.noImage), // Fallback in case of error
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),

      title: Text(
        widget.model.item[parentIndex].name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onExpansionChanged: (isExpanded) {
        _handleExpansion(parentIndex); // Handle tile opening/closing
      },
      initiallyExpanded:
          isOpen[parentIndex], // Open/close based on isOpen state
      children: [
        model.item[parentIndex].childs.isEmpty
            ? GestureDetector(
              onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => KatalogPage(
                                model: model,
                                index: parentIndex,
                                // selectedSubCategory: null,
                              ),
                            ),
                          );
                          setState(() {});
              },
              child: const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 70),
                  minTileHeight: 35,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        'Все',
                        // 'No options',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
            )
            : SizedBox(
                height: model.item[parentIndex].childs.length * 45,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.item[parentIndex].childs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 50),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => KatalogPage(
                                model: model,
                                index: parentIndex,
                                // selectedSubCategory: index,
                              ),
                            ),
                          );
                          setState(() {});
                        },
                        child: ListTile(
                          minTileHeight: 35,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 20,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.item[parentIndex].childs[index].name!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
