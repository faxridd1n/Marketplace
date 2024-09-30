import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
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
        shadowColor: Colors.black,
        elevation: 1,
        title: const Text(
          'Saqlanganlar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: favoriteProducts.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.noLikedProduct,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Sizda hali saqlangan mahsulotlar yo’q',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Keyinroq foydalanish uchun mahsulotlarni saqlab qo’yishingiz mumkin.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.green,
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Text(
                        'Bosh sahifaga qaytish',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Row(
                      //   children: [
                      //     const Text(
                      //       'Результаты:',
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //     ),
                      //     const SizedBox(width: 5),
                      //     Text(
                      //       state.productModel!.length.toString(),
                      //       style: const TextStyle(
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.w600,
                      //           color: Colors.amber),
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //     ),
                      //     const SizedBox(width: 5),
                      //     const Text(
                      //       'товаров',
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //     ),
                      //   ],
                      // ),

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
                                padding: EdgeInsets.all(0),
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
                                padding: EdgeInsets.all(0),
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
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: favoriteProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isVerticalProduct ? 30 : 10,
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
                ),
              ],
            ),
    );
  }
}
