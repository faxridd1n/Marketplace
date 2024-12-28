import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/home_model/category_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/katalog/katalog_bloc/katalog_bloc.dart';
import 'package:flutter_application_1/screens/katalog/widgets/katalog_empty_page.dart';
import 'package:flutter_application_1/widgets/horizontal_product_widget.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../widgets/mini_product.dart';

// ignore: must_be_immutable
class CatalogPage extends StatefulWidget {
  CatalogPage(
      {required this.model,
      required this.index,
      super.key});
  CategoryModel model;
  int index;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool isVerticalProduct = true;
  int selectedSubCategory = 0;
  String selectedItem = '';
  bool popUpIsOpen = false;
  // List<String> subCategories = [];
  late final KatalogBloc katalogBloc;
  // ProductModel products = ProductModel(category: Category());

  @override
  void initState() {
    super.initState();
    // selectedSubCategory = widget.selectedSubCategory ?? 0;
    katalogBloc = KatalogBloc()
      ..add(
        GetKatalogEvent(
          widget.model.item[widget.index].id,
          10,
        ),
      );
    // if (widget.model.item[widget.index].childs.isNotEmpty) {
    //   katalogBloc = KatalogBloc()
    //     ..add(
    //       GetKatalogEvent(
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
      value: katalogBloc,
      child: BlocBuilder<KatalogBloc, KatalogState>(
        builder: (ctx, state) {
          if (state.getFilteredProductStatus.isInProgress) {
            return Scaffold(
              body: Center(
                child: CustomLoadingIndicator(),
              ),
            );
          }
          if (state.getFilteredProductStatus.isSuccess) {
            return state.filteredProductModel!.isEmpty
                ? const KatalogEmptyPage(
                    withScaffold: true,
                  )
                : Scaffold(
                    backgroundColor: AppColors.white,
                    appBar: AppBar(
                      surfaceTintColor: AppColors.transparent,
                      elevation: 2,
                      shadowColor: AppColors.appBarShadowColor,
                      backgroundColor: AppColors.white,
                      actions: const [
                        // widget.model.item[widget.index].childs.isEmpty
                        // ? const SizedBox()
                        // : PopupMenuButton(
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //     elevation: 5,
                        //     shadowColor: AppColors.black,
                        //     color: AppColors.white,
                        //     padding: const EdgeInsets.symmetric(
                        //       horizontal: 8,
                        //     ),
                        //     offset: const Offset(0, 50),
                        //     onSelected: (value) {
                        //       popUpIsOpen = false;
                        //       selectedItem = value.toString();
                        //       for (var i = 0;
                        //           i < subCategories.length;
                        //           i++) {
                        //         if (subCategories[i] == selectedItem) {
                        //           selectedSubCategory = i;
                        //           katalogBloc.add(GetKatalogEvent(
                        //               widget.model.item[widget.index]
                        //                   .childs[selectedSubCategory].id!,
                        //               10));
                        //           setState(() {});
                        //         }
                        //       }
                        //       setState(() {});
                        //     },
                        //     onOpened: () {
                        //       popUpIsOpen = true;
                        //       setState(() {});
                        //     },
                        //     onCanceled: () {
                        //       popUpIsOpen = false;
                        //       setState(() {});
                        //     },
                        //     initialValue: selectedItem.isEmpty
                        //         ? widget.model.item[widget.index].childs[0]
                        //             .name!
                        //         : selectedItem,
                        //     icon: Row(
                        //       children: [
                        //         const SizedBox(width: 5),
                        //         Text(
                        //           selectedItem.isEmpty
                        //               ? widget.model.item[widget.index]
                        //                   .childs[0].name!
                        //               : selectedItem,
                        //           textAlign: TextAlign.right,
                        //           overflow: TextOverflow.ellipsis,
                        //           style: const TextStyle(
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //         const SizedBox(
                        //           width: 5,
                        //         ),
                        //         Icon(
                        //           popUpIsOpen
                        //               ? Icons.keyboard_arrow_up
                        //               : Icons.keyboard_arrow_down,
                        //           size: 20,
                        //         )
                        //       ],
                        //     ),
                        //     itemBuilder: (BuildContext context) {
                        //       return subCategories.map((String choice) {
                        //         return PopupMenuItem<String>(
                        //           value: choice,
                        //           child: Text(choice),
                        //         );
                        //       }).toList();
                        //     },
                        //   ),
                      ],
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(55),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                const Text(
                                  'Результаты:',
                                  style: TextStyle(
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
                                const Text(
                                  'товаров',
                                  style: TextStyle(
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
                    body: state.filteredProductModel!.isNotEmpty
                        ? Column(
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
                                        itemCount:
                                            state.filteredProductModel!.length,
                                        itemBuilder: (context, index) {
                                          return BlocProvider.value(
                                            value: BasketBloc(),
                                            child: MiniProductWidget(
                                              index: index,
                                              model: state
                                                  .filteredProductModel![index],
                                            ),
                                          );
                                        },
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            state.filteredProductModel!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 10,
                                            ),
                                            child: BlocProvider.value(
                                              value: BasketBloc(),
                                              child: HorizontalProductWidget(
                                                model:
                                                    state.filteredProductModel![
                                                        index],
                                                index: index,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          )
                        : const KatalogEmptyPage(
                            withScaffold: false,
                          ),
                  );
          }
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        },
      ),
    );
  }
}
