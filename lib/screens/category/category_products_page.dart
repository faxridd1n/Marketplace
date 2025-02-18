import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/category/blocs/category_products_bloc/category_products_bloc.dart';
import 'package:flutter_application_1/screens/category/category_products_empty_page.dart';
import 'package:flutter_application_1/screens/navigation/navigation_page.dart';
import 'package:flutter_application_1/widgets/horizontal_product_widget.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../core/language/language_constants.dart';
import '../../widgets/mini_product.dart';

class CategoryProductsPage extends StatefulWidget {
  const CategoryProductsPage({
    required this.categoryId,
    required this.categoryName,
    this.subCategoryId,
    super.key,
  });

  final int categoryId;
  final String categoryName;
  final int? subCategoryId;

  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  bool isVerticalProduct = true;
  int selectedSubCategory = 0;
  String selectedItem = '';
  bool popUpIsOpen = false;

  // List<String> subCategories = [];
  late final CategoryProductsBloc categoryProductsBloc;

  // ProductModel products = ProductModel(category: Category());

  @override
  void initState() {
    super.initState();
    // selectedSubCategory = widget.selectedSubCategory ?? 0;
    categoryProductsBloc = CategoryProductsBloc()
      ..add(
        GetCategoryProductsEvent(widget.categoryId, 16, 1),
      );
    // if (widget.model.item[widget.index].childs.isNotEmpty) {
    //   CategoryProductsBloc = CategoryProductsBloc()
    //     ..add(
    //       GetCategoryProductsEvent(
    //         widget.model.item[widget.index].childs[selectedSubCategory].id!,
    //         10,
    //       ),
    //     );

    //   for (var e in widget.model.item[widget.index].childs) {
    //     subCategories.add(e.name!);
    //   }
    //   selectedItem = subCategories[widget.selectedSubCategory ?? 0];
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: categoryProductsBloc,
      child: BlocBuilder<CategoryProductsBloc, CategoryProductsState>(
        builder: (ctx, state) {
          if (state.getFilteredProductStatus.isInProgress) {
            return const Scaffold(
              body: Center(
                child: CustomLoadingIndicator(),
              ),
            );
          }
          if (state.getFilteredProductStatus.isSuccess) {
            return Scaffold(
              backgroundColor: AppColors.pageBgColor,
              appBar: AppBar(
                surfaceTintColor: AppColors.transparent,
                elevation: 2,
                shadowColor: AppColors.appBarShadowColor,
                backgroundColor: AppColors.white,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(55),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            translation(context).results,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            state.filteredProductModel!.length.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.yellow,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            translation(context).productss,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.white,
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
                ),
              ),
              body: state.filteredProductModel!.isEmpty
                  ? HomeTabControllerProvider(
                      controller:
                          HomeTabControllerProvider.of(context).controller,
                      child: const CategoryEmptyPage(),
                    )
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
                                    childAspectRatio: 0.5,
                                  ),
                                  itemCount: state.filteredProductModel!.length,
                                  itemBuilder: (context, index) {
                                    return HomeTabControllerProvider(
                                      controller:
                                          HomeTabControllerProvider.of(context)
                                              .controller,
                                      child: MiniProductWidget(
                                        // index: index,
                                        model:
                                            state.filteredProductModel![index],
                                      ),
                                    );
                                  },
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.filteredProductModel!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: HomeTabControllerProvider(
                                        controller:
                                            HomeTabControllerProvider.of(
                                                    context)
                                                .controller,
                                        child: HorizontalProductWidget(
                                          model: state
                                              .filteredProductModel![index],
                                          // index: index,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
            );

            // state.filteredProductModel!.isEmpty
            //     ? HomeTabControllerProvider(
            //         controller:
            //             HomeTabControllerProvider.of(context).controller,
            //         child: const CategoryEmptyPage(
            //           withScaffold: true,
            //         ),
            //       )
            //     : Scaffold(
            //         backgroundColor: AppColors.pageBgColor,
            //         appBar: AppBar(
            //           surfaceTintColor: AppColors.transparent,
            //           elevation: 2,
            //           shadowColor: AppColors.appBarShadowColor,
            //           backgroundColor: AppColors.white,
            //           bottom: PreferredSize(
            //             preferredSize: const Size.fromHeight(55),
            //             child: Padding(
            //               padding: const EdgeInsets.symmetric(
            //                 horizontal: 10,
            //                 vertical: 10,
            //               ),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Row(children: [
            //                     Text(
            //                       translation(context).results,
            //                       style: const TextStyle(
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.w600,
            //                       ),
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                     ),
            //                     const SizedBox(width: 5),
            //                     Text(
            //                       state.filteredProductModel!.length.toString(),
            //                       style: const TextStyle(
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.w600,
            //                         color: AppColors.yellow,
            //                       ),
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                     ),
            //                     const SizedBox(width: 5),
            //                     Text(
            //                       translation(context).productss,
            //                       style: const TextStyle(
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                     ),
            //                   ]),
            //                   Container(
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(12),
            //                       color: AppColors.white,
            //                     ),
            //                     child: Row(
            //                       children: [
            //                         SizedBox(
            //                           width: 40,
            //                           height: 40,
            //                           child: IconButton(
            //                             padding: const EdgeInsets.all(0),
            //                             onPressed: () {
            //                               isVerticalProduct = true;
            //                               setState(() {});
            //                             },
            //                             icon: SvgPicture.asset(
            //                               height: 28,
            //                               width: 28,
            //                               AppIcons.verticalIcon,
            //                               color: isVerticalProduct
            //                                   ? AppColors.green
            //                                   : AppColors.grey2,
            //                             ),
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           width: 40,
            //                           height: 40,
            //                           child: IconButton(
            //                             padding: const EdgeInsets.all(0),
            //                             onPressed: () {
            //                               isVerticalProduct = false;
            //                               setState(() {});
            //                             },
            //                             icon: SvgPicture.asset(
            //                               height: 28,
            //                               width: 28,
            //                               AppIcons.horizontalIcon,
            //                               color: isVerticalProduct
            //                                   ? AppColors.grey2
            //                                   : AppColors.green,
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         body: Column(
            //           children: [
            //             Expanded(
            //               child: isVerticalProduct
            //                   ? GridView.builder(
            //                       padding: const EdgeInsets.all(10),
            //                       gridDelegate:
            //                           const SliverGridDelegateWithFixedCrossAxisCount(
            //                         crossAxisSpacing: 10,
            //                         mainAxisSpacing: 10,
            //                         crossAxisCount: 2,
            //                         childAspectRatio: 0.5,
            //                       ),
            //                       itemCount: state.filteredProductModel!.length,
            //                       itemBuilder: (context, index) {
            //                         return MiniProductWidget(
            //                           index: index,
            //                           model: state.filteredProductModel![index],
            //                         );
            //                       },
            //                     )
            //                   : ListView.builder(
            //                       shrinkWrap: true,
            //                       itemCount: state.filteredProductModel!.length,
            //                       itemBuilder: (context, index) {
            //                         return Padding(
            //                           padding: const EdgeInsets.symmetric(
            //                             horizontal: 10,
            //                             vertical: 10,
            //                           ),
            //                           child: HorizontalProductWidget(
            //                             model:
            //                                 state.filteredProductModel![index],
            //                             index: index,
            //                           ),
            //                         );
            //                       },
            //                     ),
            //             ),
            //             const SizedBox(height: 10),
            //           ],
            //         ),
            //       );
          }
          return Scaffold(
            body: Center(
              child: Text(translation(context).failed),
            ),
          );
        },
      ),
    );
  }
}
