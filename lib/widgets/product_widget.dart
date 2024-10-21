import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_page.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/favorite/favorite_page.dart';
// import 'package:flutter_application_1/screens/home/home_bloc/home_bloc.dart';
import 'package:flutter_application_1/screens/home/widgets/snack_bar.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_page1.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_bloc/product_detail_bloc.dart';
import 'package:flutter_application_1/screens/see_all/see_all_bloc/see_all_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../assets_path/app_images_path.dart';
import '../components/price_function.dart';
import '../screens/katalog/katalog_bloc/katalog_bloc.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  ProductWidget(
      {required this.index,
      required this.model,
      this.isSeeAllPage,
      this.isDetailPage,
      this.isHomePage,
      this.isKatalogPage,
      // this.tab,
      super.key});
  bool? isSeeAllPage;
  bool? isHomePage;
  bool? isKatalogPage;
  bool? isDetailPage;
  int index;
  ProductModel model;
  // int? tab;

  @override
  State<ProductWidget> createState() => _ProductwidgetState();
}

class _ProductwidgetState extends State<ProductWidget> {
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            Card(
              elevation: 5,
              shadowColor: AppColors.black,
              color: AppColors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage1(
                        model: widget.model,
                        // tab: widget.tab,
                      ),
                    ),
                  );
                },
                child: Stack(children: [
                  Container(
                    width: widget.isKatalogPage == true ||
                            widget.isSeeAllPage == true
                        ? double.infinity
                        : MediaQuery.of(context).size.width * 0.7,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: SizedBox(
                              height: 240,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: (widget.model.variations.isNotEmpty &&
                                      widget.model.variations[0].files
                                          .isNotEmpty &&
                                      widget.model.variations[0].files[0].url
                                          .isNotEmpty)
                                  ? Image.network(
                                      widget.model.variations[0].files[0].url,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          AppImages.noImage,
                                          fit: BoxFit.fitWidth,
                                        );
                                      },
                                    )
                                  : Image.asset(
                                      AppImages.noImage,
                                      fit: BoxFit.fitWidth,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.model.variations[0].prices[0].type ==
                                          'Price'
                                      ? '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[0].value.toInt().toString())} сум'
                                      : '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[1].value.toInt().toString())} сум',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  '180 000 сум',
                                  style: TextStyle(
                                    color: AppColors.grey3,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.yellow,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              child: const Text(
                                'x 12 мес',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.model.name,
                          maxLines: 2,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: AppColors.green,
                                  ),
                                  onPressed: () {
                                    bool isAlreadyHave = false;
                                    if (basketProducts.contains(widget.model)) {
                                      isAlreadyHave = true;
                                      if (widget.isHomePage == true) {
                                        context.read<BasketBloc>().add(
                                              PostBasketProductBasketEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                                count: 2,
                                              ),
                                            );
                                      } else if (widget.isSeeAllPage == true) {
                                        context.read<SeeAllBloc>().add(
                                              PostBasketProductSeeAllEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                                count: 1,
                                              ),
                                            );
                                      } else if (widget.isKatalogPage == true) {
                                        context.read<KatalogBloc>().add(
                                              PostBasketProductKatalogEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                                count: 1,
                                              ),
                                            );
                                      } else if (widget.isDetailPage == true) {
                                        context.read<ProductDetailBloc>().add(
                                              PostBasketProductDetailEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                              ),
                                            );
                                      } else {
                                        context.read<BasketBloc>().add(
                                              PostBasketProductBasketEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                                count: 2,
                                              ),
                                            );
                                      }
                                    }
                                    if (!isAlreadyHave) {
                                      if (widget.isHomePage == true) {
                                        context.read<BasketBloc>().add(
                                              PostBasketProductBasketEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                                count: 1,
                                              ),
                                            );
                                      } else if (widget.isSeeAllPage == true) {
                                        context.read<SeeAllBloc>().add(
                                              PostBasketProductSeeAllEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                                count: 1,
                                              ),
                                            );
                                      } else if (widget.isKatalogPage == true) {
                                        context.read<KatalogBloc>().add(
                                              PostBasketProductKatalogEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                                count: 1,
                                              ),
                                            );
                                      } else if (widget.isDetailPage == true) {
                                        context.read<ProductDetailBloc>().add(
                                              PostBasketProductDetailEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                              ),
                                            );
                                      } else {
                                        context.read<BasketBloc>().add(
                                              PostBasketProductBasketEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                                count: 1,
                                              ),
                                            );
                                      }
                                    }
                                    snackBar(
                                        isHomePage: widget.isHomePage == true
                                            ? true
                                            : false,
                                        context: context,
                                        name: widget.model.name,
                                        addProduct: true);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                    ),
                                    child: Text(
                                      'в корзину',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.grey1,
                                ),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailPage1(
                                        model: widget.model,
                                        // tab: null,
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: AppColors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 8,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        isSelected = !isSelected;
                        if (isSelected) {
                          favoriteProducts.add(widget.model);
                        } else {
                          favoriteProducts.remove(widget.model);
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        isSelected
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: isSelected ? AppColors.pink : AppColors.black,
                        size: 27,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
