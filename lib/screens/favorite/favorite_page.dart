import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/favorite/widgets/empty_favourite.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/product_widget.dart';
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
      backgroundColor: AppColors.pageBgColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(72, 0, 0, 0),
        elevation: 2,
        title: const Text(
          'Saqlanganlar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: favoriteProducts.isEmpty
          ? const EmptyFavouritePage()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  isVerticalProduct = true;
                                  setState(() {});
                                },
                                icon: SvgPicture.asset(
                                  height: 28,
                                  width: 28,
                                  AppIcons.verticalIcon,
                                  color: isVerticalProduct
                                      ? AppColors.green
                                      : AppColors.grey2,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  isVerticalProduct = false;
                                  setState(() {});
                                },
                                icon: SvgPicture.asset(
                                  height: 28,
                                  width: 28,
                                  AppIcons.horizontalIcon,
                                  color: isVerticalProduct
                                      ? AppColors.grey2
                                      : AppColors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: favoriteProducts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isVerticalProduct ? 40 : 10,
                          vertical: 10,
                        ),
                        child: isVerticalProduct
                            ? ProductWidget(
                                isSeeAllPage: true,
                                index: index,
                                model: favoriteProducts[index],
                              )
                            : HorizontalProductWidget(
                                isSeeAllPage: true,
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
