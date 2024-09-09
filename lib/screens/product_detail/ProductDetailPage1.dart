import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/assets_path/AppImagesPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/home/widgets/BottomCardWidget1.dart';
import 'package:flutter_application_1/screens/home/widgets/ProductWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/TitleWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'product_detail_bloc/product_detail_bloc.dart';
import 'tab_pages/PDetailPageTab1.dart';
import 'tab_pages/PDetailPageTab2.dart';
import 'tab_pages/PDetailPageTab3.dart';
import 'widgets/fin_prod_widget.dart';

// ignore: must_be_immutable
class ProductDetailPage1 extends StatefulWidget {
  ProductDetailPage1({required this.model, super.key});
  ProductModel model;
  @override
  State<ProductDetailPage1> createState() => _ProductDetailPage1State();
}

class _ProductDetailPage1State extends State<ProductDetailPage1>
    with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late TabController tabController;
  late final ProductDetailBloc productDetailBloc;
  late final ProductDetailBloc similarProducts;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    productDetailBloc = ProductDetailBloc()
      ..add(GetProductDetailEvent(widget.model.id!))
      ..add(GetSimilarProductsEvent());
    // similarProducts = ProductDetailBloc()..add(GetSimilarProductsEvent());
    super.initState();
  }

  bool isLess1 = true;
  bool isLess2 = true;
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: productDetailBloc,
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (ctx, state) {
          if (state.getDetailStatus.isInProgress) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state.getDetailStatus.isSuccess) {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                ),
                body: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 290,
                            child: PageView.builder(
                                controller: controller,
                                itemCount: state.productDetailModel!.result!
                                    .variations![0].files!.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Image.network(
                                      state.productDetailModel!.result!
                                          .variations![0].files![index].url!,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                state.productDetailModel!.result!.variations![0]
                                        .files!.isNotEmpty
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.grey1,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        padding: const EdgeInsets.all(7),
                                        child: SmoothPageIndicator(
                                          controller: controller,
                                          count: state
                                              .productDetailModel!
                                              .result!
                                              .variations![0]
                                              .files!
                                              .length,
                                          effect: const ColorTransitionEffect(
                                            activeDotColor: AppColors.green,
                                            dotColor: AppColors.grey3,
                                            dotHeight: 7,
                                            dotWidth: 7,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.productDetailModel!.result!.name!,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                FinProdWidget(
                                  model: widget.model,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              // indicatorPadding: const EdgeInsets.symmetric(
                              //     horizontal: 50),
                              onTap: (index) {
                                selectedTab = index;
                                setState(() {});
                              },
                              dividerColor: AppColors.grey3,
                              labelColor: Colors.black,
                              unselectedLabelColor: AppColors.grey2,
                              indicatorColor: Colors.black,
                              controller: tabController,
                              labelPadding: const EdgeInsets.all(0),
                              tabs: const [
                                Tab(
                                  text: 'Характеристики',
                                ),
                                Tab(
                                  text: 'Описание',
                                ),
                                Tab(text: 'Отзывы'),
                              ],
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: PDetailPageTab1(
                                model: state.productDetailModel!),
                            secondChild: AnimatedCrossFade(
                              firstChild: PDetailPageTab2(
                                  model: state.productDetailModel!),
                              secondChild: const PDetailPageTab3(),
                              crossFadeState: selectedTab == 1
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 200),
                            ),
                            crossFadeState: selectedTab == 0
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 200),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TitleWidget(
                            titleText: 'Товары из той же линейки',
                            withSeeAllButton: true,
                          ),
                          state.getProductStatus.isInProgress
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : state.getProductStatus.isSuccess
                                  ? SizedBox(
                                      width: double.infinity,
                                      height: 550,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount:
                                            state.parentCategoryModel!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: ProductWidget(
                                              index: index,
                                              model: state
                                                  .parentCategoryModel![index],
                                              isMaxWidth: false,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const Center(
                                      child: Text('Error1'),
                                    ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.fireColor,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'В приложении удобнее!',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Оставьте свой номер телефона, и получите ссылку на скачивание приложения',
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 240, 240, 240),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SvgPicture.asset(
                                        AppIcons.button_google,
                                      ),
                                      SvgPicture.asset(
                                        AppIcons.button_apple,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 180,
                                  height: 200,
                                  child: Image.asset(
                                    AppImages.banner2,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const BottomInfoWidget1()
                        ],
                      ),
                    )
                  ],
                ),
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
