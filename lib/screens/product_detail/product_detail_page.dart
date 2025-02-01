import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/home/widgets/BottomCardWidget1.dart';
import 'package:flutter_application_1/screens/product_detail/widgets/empty_review_section.dart';
import 'package:flutter_application_1/screens/product_detail/widgets/organization_contact_widget.dart';
import 'package:flutter_application_1/screens/product_detail/widgets/review_section.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../core/language/language_constants.dart';
import '../../widgets/custom_cachedd_image.dart';
import '../../widgets/product_list_widget.dart';
import 'product_detail_bloc/product_detail_bloc.dart';
import 'tab_pages/detail_tab1_page.dart';
import 'tab_pages/detail_tab2_page.dart';
import 'widgets/fin_prod_widget.dart';
import 'widgets/photo_dialog_widget.dart';

class ProductDetailPage1 extends StatefulWidget {
  const ProductDetailPage1(
      {required this.productId,
      required this.categoryId,
      required this.organizationId,
      super.key});

  final String productId;
  final int categoryId;
  final int organizationId;

  @override
  State<ProductDetailPage1> createState() => _ProductDetailPage1State();
}

class _ProductDetailPage1State extends State<ProductDetailPage1>
    with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late TabController tabController;
  late final ProductDetailBloc productDetailBloc;
  // late final AuthStatus authStatus;

  @override
  initState() {
    tabController = TabController(length: 2, vsync: this);
    productDetailBloc = ProductDetailBloc();
    getProductDetail();

    super.initState();
  }

  void getProductDetail() async {
    productDetailBloc.add(GetProductDetailEvent(widget.productId));
    await Future.delayed(const Duration(milliseconds: 200));

    productDetailBloc.add(
        GetOrganizationContactEvent(organizationId: widget.organizationId));
    productDetailBloc.add(GetProductsReviewEvent(forId: widget.productId));
  }

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: productDetailBloc,
      child: Scaffold(
        backgroundColor: AppColors.pageBgColor,
        appBar: AppBar(
          elevation: 2,
          shadowColor: AppColors.appBarShadowColor,
          surfaceTintColor: AppColors.transparent,
          backgroundColor: AppColors.white,
        ),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (ctx, state) {
            if (state.getDetailStatus.isInProgress ||
                state.organizationContactStatus.isInProgress ||
                state.getProductsReviewResponseStatus.isInProgress) {
              return const Center(
                child: CustomLoadingIndicator(),
              );
            }
            if (state.getDetailStatus.isSuccess &&
                state.organizationContactStatus.isSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              state.productDetailModel.result.name,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            color: AppColors.white,
                            child: SizedBox(
                              height: 300,
                              child: PageView.builder(
                                  controller: controller,
                                  itemCount: state.productDetailModel.result
                                      .variations[0].files.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () async {
                                        await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return MyDialog(
                                                index: index,
                                                model: state.productDetailModel,
                                              );
                                            });
                                      },
                                      child: Center(
                                        child: SizedBox(
                                          height: 300,
                                          child: CustomCachedImage(
                                            height: 300,
                                            // width: 80,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            imageUrl: state
                                                .productDetailModel
                                                .result
                                                .variations[0]
                                                .files[index]
                                                .url,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.productDetailModel.result
                                  .variations[0].files.length,
                              itemBuilder: (context, index) {
                                return CustomCachedImage(
                                  height: 80,
                                  width: 80,
                                  borderRadius: BorderRadius.circular(8),
                                  imageUrl: state.productDetailModel.result
                                      .variations[0].files[index].url,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.productDetailModel.result.description,
                            style: const TextStyle(
                              color: AppColors.grey2,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FinProdWidget(
                            model: state.productDetailModel,
                          ),
                          const SizedBox(height: 20),
                          OrganizationContactWidget(
                            isSingle: true,
                            contactModel: state.organizationContactModel,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: TabBar(
                              onTap: (index) {
                                selectedTab = index;
                                setState(() {});
                              },
                              dividerColor: AppColors.white,
                              labelColor: AppColors.black,
                              unselectedLabelColor: AppColors.grey2,
                              indicatorColor: AppColors.white,
                              controller: tabController,
                              labelPadding: const EdgeInsets.only(left: 8),
                              tabs: [
                                Tab(text: translation(context).specifications),
                                Tab(text: translation(context).description),
                              ],
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: PDetailPageTab1(
                              model: state.productDetailModel,
                            ),
                            secondChild: PDetailPageTab2(
                              model: state.productDetailModel,
                            ),
                            crossFadeState: selectedTab == 0
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 200),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    state.getProductsReviewResponseStatus.isSuccess &&
                            state.productsGetReviewResponseModel.result.items
                                .isNotEmpty
                        ? ReviewSection(
                            productDetailModel: state.productDetailModel,
                            productsGetReviewResponseModel:
                                state.productsGetReviewResponseModel,
                          )
                        : EmptyReviewSection(
                            productDetailModel: state.productDetailModel,
                          ),
                    const SizedBox(height: 10),
                    SectionProductsListWidget(
                      categoryId:
                          state.productDetailModel.result.categoryId.toString(),
                      sectionId: null,
                      size: 5,
                      sectionName: translation(context).simmilarProducts,
                    ),
                    const SizedBox(height: 30),
                    const BottomInfoWidget1()
                  ],
                ),
              );
            }
            if (state.getDetailStatus.isFailure ||
                state.organizationContactStatus.isFailure) {
              return Center(
                child: Text(
                    '${state.getDetailStatus} ${state.organizationContactStatus} ${state.getProductsReviewResponseStatus}'),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
