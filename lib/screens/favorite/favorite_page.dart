import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/favorite/widgets/empty_favourite.dart';
import 'package:flutter_application_1/widgets/mini_product.dart';
import 'package:flutter_svg/flutter_svg.dart';
 import '../../widgets/horizontal_product_widget.dart';

List<ProductModel> favoriteProducts = [];
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isVerticalProduct = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        shadowColor: AppColors.appBarShadowColor,
        elevation: 2,
        title: const Text(
          'Saqlanganlar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  isVerticalProduct = true;
                });
              },
              icon: SvgPicture.asset(
                height: 28,
                width: 28,
                AppIcons.verticalIcon,
                color: isVerticalProduct ? AppColors.green : AppColors.grey2,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  isVerticalProduct = false;
                });
              },
              icon: SvgPicture.asset(
                height: 28,
                width: 28,
                AppIcons.horizontalIcon,
                color: isVerticalProduct ? AppColors.grey2 : AppColors.green,
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: favoriteProducts.isEmpty
          ? const EmptyFavouritePage()
          : Column(
              children: [
                Expanded(
                  child: isVerticalProduct
                      ? GridView.builder(
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.55, // Adjust if needed
                          ),
                          itemCount: favoriteProducts.length,
                          itemBuilder: (context, index) {
                            return MiniProductWidget(
                              index: index,
                              model: favoriteProducts[index],
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: favoriteProducts.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: HorizontalProductWidget(
                                model: favoriteProducts[index],
                                index: index,
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
