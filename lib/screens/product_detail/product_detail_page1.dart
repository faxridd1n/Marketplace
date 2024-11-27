import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/home/widgets/BottomCardWidget1.dart';
import 'package:flutter_application_1/screens/product_detail/widgets/organization_contact_widget.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_application_1/widgets/title_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/product_widget.dart';
import 'product_detail_bloc/product_detail_bloc.dart';
import 'tab_pages/detail_tab1_page.dart';
import 'tab_pages/detail_tab2_page.dart';
import 'tab_pages/detail_tab3_page.dart';
import 'widgets/fin_prod_widget.dart';
import 'widgets/photo_dialog_widget.dart';

// ignore: must_be_immutable
class ProductDetailPage1 extends StatefulWidget {
  const ProductDetailPage1(
      {required this.productId, required this.categoryId, super.key});
  // ProductModel model;
  final String productId;
  final int categoryId;
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
  initState() {
    tabController = TabController(length: 3, vsync: this);
    productDetailBloc = ProductDetailBloc();
    getProductDetail();
    // similarProducts = ProductDetailBloc()..add(GetSimilarProductsEvent());
    super.initState();
  }

  void getProductDetail() async {
    productDetailBloc.add(GetProductDetailEvent(widget.productId));
    await Future.delayed(const Duration(milliseconds: 200));
    productDetailBloc
        .add(GetSimilarProductsEvent(categoryId: widget.categoryId));
    await Future.delayed(const Duration(milliseconds: 200));

    productDetailBloc
        .add(GetOrganizationContactEvent(categoryId: widget.categoryId));
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
            return Scaffold(
              body: Center(
                child: CustomThicknessIndicator(),
              ),
            );
          }
          if (state.getDetailStatus.isSuccess) {
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                elevation: 2,
                shadowColor: AppColors.appBarShadowColor,
                surfaceTintColor: AppColors.transparent,
                backgroundColor: AppColors.white,
              ),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Align(
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
                  ),
                  Container(
                    color: AppColors.white,
                    child: SizedBox(
                      height: 300,
                      child: PageView.builder(
                          controller: controller,
                          itemCount: state.productDetailModel!.result!
                              .variations![0].files!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return MyDialog(
                                        index: index,
                                        model: state.productDetailModel!,
                                      );
                                    });
                              },
                              child: Center(
                                child: SizedBox(
                                  height: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: (state
                                                .productDetailModel!
                                                .result!
                                                .variations![0]
                                                .files!
                                                .isNotEmpty &&
                                            state
                                                .productDetailModel!
                                                .result!
                                                .variations![0]
                                                .files![index]
                                                .url!
                                                .isNotEmpty)
                                        ? Image.network(
                                            state
                                                .productDetailModel!
                                                .result!
                                                .variations![0]
                                                .files![index]
                                                .url!,
                                            fit: BoxFit.fitHeight,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                AppImages.noImage,
                                                fit: BoxFit.fitHeight,
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
                            );
                          }),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.productDetailModel!.result!
                                .variations![0].files!.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: (state
                                              .productDetailModel!
                                              .result!
                                              .variations![0]
                                              .files!
                                              .isNotEmpty &&
                                          state
                                              .productDetailModel!
                                              .result!
                                              .variations![0]
                                              .files![index]
                                              .url!
                                              .isNotEmpty)
                                      ? Image.network(
                                          state
                                              .productDetailModel!
                                              .result!
                                              .variations![0]
                                              .files![index]
                                              .url!,
                                          fit: BoxFit.fitHeight,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              AppImages.noImage,
                                              fit: BoxFit.fitHeight,
                                            );
                                          },
                                        )
                                      : Image.asset(
                                          AppImages.noImage,
                                          fit: BoxFit.fitWidth,
                                        ),
                                ),
                              );
                            },
                          ),
                        ),
                        // state.productDetailModel!.result!.variations![0].files!
                        //             .length >
                        //         1
                        //     ? Container(
                        //         decoration: BoxDecoration(
                        //           color: AppColors.grey1,
                        //           borderRadius: BorderRadius.circular(100),
                        //         ),
                        //         padding: const EdgeInsets.all(7),
                        //         child: SmoothPageIndicator(
                        //           controller: controller,
                        //           count: state.productDetailModel!.result!
                        //               .variations![0].files!.length,
                        //           effect: const ColorTransitionEffect(
                        //             activeDotColor: AppColors.green,
                        //             dotColor: AppColors.grey3,
                        //             dotHeight: 7,
                        //             dotWidth: 7,
                        //           ),
                        //         ),
                        //       )
                        //     : const SizedBox(),
                        const SizedBox(height: 10),
                        Text(
                          state.productDetailModel!.result!.description!,
                          style: const TextStyle(
                            color: AppColors.grey2,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        FinProdWidget(
                          model: state.productDetailModel!,
                        ),
                        const SizedBox(height: 20),
                        // state.organizationContactStatus.isInProgress
                        //     ?
                        OrganizationContactWidget(
                          isSingle: true,
                          contactModel: state.organizationContactModel,
                        )
                        // : CustomThicknessIndicator(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      onTap: (index) {
                        selectedTab = index;
                        setState(() {});
                      },
                      dividerColor: AppColors.grey3,
                      labelColor: AppColors.black,
                      unselectedLabelColor: AppColors.grey2,
                      indicatorColor: AppColors.black,
                      controller: tabController,
                      labelPadding: const EdgeInsets.only(left: 8),
                      tabs: const [
                        Tab(text: 'Характеристики'),
                        Tab(text: 'Описание'),
                        Tab(text: 'Отзывы'),
                      ],
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild:
                        PDetailPageTab1(model: state.productDetailModel!),
                    secondChild: AnimatedCrossFade(
                      firstChild:
                          PDetailPageTab2(model: state.productDetailModel!),
                      secondChild: PDetailPageTab3(
                        productDetailModel: state.productDetailModel!,
                      ),
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
                  const SizedBox(height: 20),
                  TitleWidget(
                    titleText: 'Товары из той же линейки',
                    withSeeAllButton: true,
                    categoryId: widget.categoryId,
                  ),
                  state.getProductStatus.isInProgress
                      ? Center(
                          child: CustomThicknessIndicator(),
                        )
                      : state.getProductStatus.isSuccess
                          ? SizedBox(
                              width: double.infinity,
                              height: 550,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state.parentCategoryModel!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: ProductWidget(
                                      isDetailPage: true,
                                      index: index,
                                      model: state.parentCategoryModel![index],
                                      // tab: widget.model.categoryId,
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
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Column(
                            children: [
                              const Text(
                                'В приложении удобнее!',
                                style: TextStyle(
                                  color: AppColors.white,
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
                                  color: Color.fromARGB(255, 240, 240, 240),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SvgPicture.asset(
                                AppIcons.buttonGoogle,
                              ),
                              SvgPicture.asset(
                                AppIcons.buttonApple,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          height: 200,
                          child: Image.asset(
                            AppImages.oldBanner2,
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
              )),
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
