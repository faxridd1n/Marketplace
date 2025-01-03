import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/katalog/katalog_bloc/katalog_bloc.dart';
import 'package:flutter_application_1/screens/see_all/see_all_bloc/see_all_bloc.dart';
import '../assets_path/app_images_path.dart';
import '../components/hive/user_token.dart';
import '../components/price_function.dart';
import '../screens/favorite/favorite_page.dart';
import 'login_dialog.dart';
import 'snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/product_detail/product_detail_page1.dart';

// ignore: must_be_immutable
class HorizontalProductWidget extends StatefulWidget {
  HorizontalProductWidget(
      {required this.model,
      required this.index,
      this.isKatalogPage,
      this.isSeeAllPage,
      super.key});
  ProductModel model;
  int index;
  bool? isKatalogPage;
  bool? isSeeAllPage;
  @override
  State<HorizontalProductWidget> createState() =>
      _HorizontalProductWidgetState();
}

class _HorizontalProductWidgetState extends State<HorizontalProductWidget> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();

    if (favoriteProducts.contains(widget.model)) {
      isSelected = true;
    } else {
      isSelected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailPage1(
              productId: widget.model.id,
              categoryId: widget.model.category.id,
              organizationId: widget.model.organizationId,
              // model: widget.model,
              // tab: widget.tab,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 2, color: Color.fromARGB(90, 0, 0, 0))
          ],
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 140,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: widget.model.variations[0].files[0].url.isNotEmpty
                      ? NetworkImage(widget.model.variations[0].files[0].url)
                      : const AssetImage(AppImages.noImage)
                          as ImageProvider, // Fallback image
                  fit: BoxFit.fitWidth,
                ),
              ),
              width: 80,
              // height: 70, // Specify height for better layout control
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.model.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              setState(
                                () {
                                  isSelected = !isSelected;
                                  if (isSelected) {
                                    favoriteProducts.add(widget.model);
                                  } else {
                                    favoriteProducts.remove(widget.model);
                                  }
                                },
                              );
                            },
                            icon: Icon(
                              isSelected
                                  ? Icons.favorite
                                  : Icons.favorite_border_rounded,
                              color:
                                  isSelected ? AppColors.pink : AppColors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1, vertical: 5),
                            child: Icon(
                              Icons.star_rate_rounded,
                              color: AppColors.yellow,
                              size: 20,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        '5',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.model.variations[0].prices[0].type == 'Price'
                            ? '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[0].value.toInt().toString())} AED'
                            : '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[1].value.toInt().toString())} AED',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     // Row(
                      //     //   children: [
                      //     //     Text(
                      //     //       widget.model.variations[0].prices[0].type ==
                      //     //               'Price'
                      //     //           ? '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[0].value.toInt().toString())} сум'
                      //     //           : '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[1].value.toInt().toString())} сум',
                      //     //       style: const TextStyle(
                      //     //         fontSize: 14,
                      //     //         fontWeight: FontWeight.w600,
                      //     //       ),
                      //     //     ),
                      //     //     const SizedBox(
                      //     //       width: 5,
                      //     //     ),
                      //     //     Container(
                      //     //       decoration: BoxDecoration(
                      //     //         borderRadius: BorderRadius.circular(100),
                      //     //         color: AppColors.yellow,
                      //     //       ),
                      //     //       padding: const EdgeInsets.symmetric(
                      //     //         horizontal: 5,
                      //     //       ),
                      //     //       child: const Text(
                      //     //         'x 12 мес',
                      //     //         style: TextStyle(
                      //     //           fontSize: 12,
                      //     //           fontWeight: FontWeight.w500,
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //   ],
                      //     // ),
                      //     Text(
                      //       widget.model.variations[0].prices[0].type == 'Price'
                      //           ? '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[0].value.toInt().toString())} AED'
                      //           : '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[1].value.toInt().toString())} AED',
                      //       style: const TextStyle(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //     // const Text(
                      //     //   '180 000 сум',
                      //     //   style: TextStyle(
                      //     //     color: AppColors.grey3,
                      //     //     fontWeight: FontWeight.w500,
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.green,
                        ),
                        onPressed: () {
                          final token = userTokenBox.get('token')?.token;
                          if (token != null && token.isNotEmpty) {
                            if (widget.isSeeAllPage == true) {
                              context.read<SeeAllBloc>().add(
                                    PostBasketProductSeeAllEvent(
                                      productVariationId:
                                          widget.model.variations[0].id,
                                      count: 1,
                                    ),
                                  );
                            } else if (widget.isKatalogPage == true) {
                              context.read<KatalogBloc>().add(
                                    PostBasketProductKatalogEvent(
                                      productVariationId:
                                          widget.model.variations[0].id,
                                      count: 1,
                                    ),
                                  );
                            } else {
                              context.read<BasketBloc>().add(
                                    PostBasketProductBasketEvent(
                                      productVariationId:
                                          widget.model.variations[0].id,
                                      count: 1,
                                    ),
                                  );
                            }
                            snackBar(
                              isHomePage: false,
                              context: context,
                              name: widget.model.name,
                              addProduct: true,
                            );
                          } else {
                            loginDiolog(context, () {
                              setState(() {});
                            });
                          }
                        },
                        child: const Text(
                          'В корзину',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
