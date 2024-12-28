import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/home/blocs/section_products_bloc/section_products_bloc.dart';
import 'package:flutter_application_1/screens/see_all/see_all_bloc/see_all_bloc.dart';
import 'package:flutter_application_1/screens/see_all/widgets/bottom_sheet_widget.dart';
import 'package:flutter_application_1/widgets/horizontal_product_widget.dart';
import 'package:flutter_application_1/widgets/indicator.dart';

// import 'package:flutter_application_1/widgets/paginator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/mini_product.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({
    this.sectionId = -1,
    this.categoryId = -1,
    super.key, required this.title,
  });

  final int categoryId;
  final int sectionId;
  final String title;

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  late final SeeAllBloc bloc;
  late final ProductsBloc productsBloc;
  bool isVerticalProduct = true;

  @override
  void initState() {
    super.initState();
    productsBloc = ProductsBloc();
    if (widget.sectionId != -1) {
      productsBloc.add(SetSectionIdEvent(widget.sectionId));
    } else if (widget.categoryId != -1) {
      productsBloc.add(SetCategoryIdEvent(widget.categoryId));
    }
    bloc = SeeAllBloc()
      ..add(GetSearchFiltersEvent(widget.categoryId));
    getProducts();
  }

  void getProducts() async {
    bloc.add(GetAllProductsEvent(widget.categoryId));
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        backgroundColor: AppColors.pageBgColor,
        appBar: AppBar(
          elevation: 2,
          shadowColor: AppColors.appBarShadowColor,
          surfaceTintColor: AppColors.transparent,
          backgroundColor: AppColors.white,
          actions: [
            Row(
              children: [
                const Text('Filters:'),
                BlocBuilder<SeeAllBloc, SeeAllState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        if (state.getFilteredProductStatus.isSuccess) {
                          openFilterSheet(context, state.filteredProductModel!);
                        }
                      },
                      icon: SvgPicture.asset(
                        AppIcons.filter,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10),
              ],
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
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
                      BlocBuilder<SeeAllBloc, SeeAllState>(
                        builder: (context, state) {
                          if(state.getProductStatus.isSuccess){
                            return Text(
                              state.productModel!.length.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.yellow,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          }
                          return const SizedBox.shrink();
                        },
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
                    ],
                  ),
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
                              isVerticalProduct = false;
                              setState(() {});
                            },
                            icon: SvgPicture.asset(
                              height: 28,
                              width: 28,
                              AppIcons.horizontalIcon,
                              color: isVerticalProduct ? AppColors.grey2 : AppColors.green,
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
        body: BlocBuilder<SeeAllBloc, SeeAllState>(
          builder: (context, state) {
            if (state.getProductStatus.isInProgress) {
              return const Center(
                child: CustomLoadingIndicator(),
              );
            }
            if (state.getProductStatus.isSuccess) {
                return Column(
                  children: [
                    Expanded(
                      child:
                      //   Paginator(
                      // paginatorStatus: FormzSubmissionStatus.success,
                      // itemCount: state.productModel!.length,
                      // itemBuilder: (ctx, index) {
                      //   return
                      isVerticalProduct
                          ? GridView.builder(
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: 0.5, // Adjust if needed
                        ),
                        itemCount: state.productModel!.length,
                        itemBuilder: (context, index) {
                          return MiniProductWidget(
                            index: index,
                            model: state.productModel![index],
                          );
                        },
                      )
                          : ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.productModel!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: HorizontalProductWidget(
                              model: state.productModel![index],
                              index: index,
                            ),
                          );
                        },
                      ),
                      //   },
                      //   fetchMoreFunction: () {},
                      //   hasMoreToFetch: false,
                      // )
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: state.productModel!.length,
                      //   itemBuilder: (context, index) {
                      //     if (index >= state.productModel!.length) {
                      //       return const Center(child: CircularProgressIndicator(color:AppColors.green,strokeWidth:3));
                      //     }
                      //     return Padding(
                      //       padding: EdgeInsets.symmetric(
                      //         horizontal: isVerticalProduct ? 30 : 10,
                      //         vertical: 10,
                      //       ),
                      //       child: isVerticalProduct
                      //           ? ProductWidget(
                      //               isSeeAllPage: true,
                      //               index: index,
                      //               model: state.productModel![index],
                      //             )
                      //           : HorizontalProductWidget(
                      //               isSeeAllPage: true,
                      //               model: state.productModel![index],
                      //               index: index,
                      //             ),
                      //     );
                      //   },
                      // ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
            }
            if (state.getProductStatus.isFailure) {
              return const Center(
                child: Text("Error"),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
