import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/home/widgets/BottomCardWidget1.dart';
import 'package:flutter_application_1/screens/product_detail/widgets/organization_contact_widget.dart';
import 'package:flutter_application_1/screens/see_all/see_all_page.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_application_1/widgets/title_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/product_widget.dart';
import '../basket/basket_bloc/basket_bloc.dart';
import 'product_detail_bloc/product_detail_bloc.dart';
import 'tab_pages/detail_tab1_page.dart';
import 'tab_pages/detail_tab2_page.dart';
import 'tab_pages/detail_tab3_page.dart';
import 'widgets/fin_prod_widget.dart';
import 'widgets/photo_dialog_widget.dart';

class ProductDetailPage1 extends StatefulWidget {
  const ProductDetailPage1({required this.productId, required this.categoryId, required this.organizationId, super.key});

  final String productId;
  final int categoryId;
  final int organizationId;

  @override
  State<ProductDetailPage1> createState() => _ProductDetailPage1State();
}

class _ProductDetailPage1State extends State<ProductDetailPage1> with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late TabController tabController;
  late final ProductDetailBloc productDetailBloc;

  // late final ProductDetailBloc similarProducts;

  @override
  initState() {
    tabController = TabController(length: 3, vsync: this);
    productDetailBloc = ProductDetailBloc();
    getProductDetail();
    super.initState();
  }

  void getProductDetail() async {
    productDetailBloc.add(GetProductDetailEvent(widget.productId));
    await Future.delayed(const Duration(milliseconds: 200));

    productDetailBloc.add(GetOrganizationContactEvent(organizationId: widget.organizationId));
    await Future.delayed(const Duration(milliseconds: 200));
    productDetailBloc.add(GetSimilarProductsEvent(categoryId: widget.categoryId));
  }

  bool isLess1 = true;
  bool isLess2 = true;
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
            if (state.getDetailStatus.isInProgress || state.getProductStatus.isInProgress) {
              return const Center(
                  child: CustomLoadingIndicator(),
              );
            }
            if (state.getDetailStatus.isSuccess ) {
              return  SingleChildScrollView(
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
                                state.productDetailModel!.result.name,
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
                                    itemCount: state.productDetailModel!.result.variations[0].files.length,
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
                                              child: (state.productDetailModel!.result.variations[0].files.isNotEmpty &&
                                                      state.productDetailModel!.result.variations[0].files[index].url.isNotEmpty)
                                                  ? Image.network(
                                                      state.productDetailModel!.result.variations[0].files[index].url,
                                                      fit: BoxFit.fitHeight,
                                                      errorBuilder: (context, error, stackTrace) {
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
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: state.productDetailModel!.result.variations[0].files.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 80,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: (state.productDetailModel!.result.variations[0].files.isNotEmpty &&
                                              state.productDetailModel!.result.variations[0].files[index].url.isNotEmpty)
                                          ? Image.network(
                                              state.productDetailModel!.result.variations[0].files[index].url,
                                              fit: BoxFit.fitHeight,
                                              errorBuilder: (context, error, stackTrace) {
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
                            const SizedBox(height: 10),
                            Text(
                              state.productDetailModel!.result.description,
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
                              model: state.productDetailModel!,
                            ),
                            const SizedBox(height: 20),
                            state.organizationContactStatus.isSuccess
                                ? OrganizationContactWidget(
                                    isSingle: true,
                                    contactModel: state.organizationContactModel,
                                  )
                                : const Center(child: CustomLoadingIndicator()),
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
                                tabs: const [
                                  Tab(text: 'Характеристики'),
                                  Tab(text: 'Описание'),
                                  Tab(text: 'Отзывы'),
                                ],
                              ),
                            ),
                            AnimatedCrossFade(
                              firstChild: PDetailPageTab1(model: state.productDetailModel!),
                              secondChild: AnimatedCrossFade(
                                firstChild: PDetailPageTab2(model: state.productDetailModel!),
                                secondChild: PDetailPageTab3(
                                  productDetailModel: state.productDetailModel!,
                                ),
                                crossFadeState: selectedTab == 1 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 200),
                              ),
                              crossFadeState: selectedTab == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 200),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      state.getProductStatus.isSuccess
                          ? TitleWidget(
                              titleText: 'Товары из той же линейки',
                              onSeaAllTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) => SeeAllPage(
                                      categoryId: state.productDetailModel!.result.categoryId,
                                      title: '',
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: CustomLoadingIndicator(),
                            ),
                      state.getProductStatus.isSuccess
                          ? SizedBox(
                              width: double.infinity,
                              height: 550,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state.parentCategoryModel!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                              child: CustomLoadingIndicator(),
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
                                  const SizedBox(height: 15),
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
                                  const SizedBox(height: 30),
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
                      const SizedBox(height: 30),
                      const BottomInfoWidget1()
                    ],
                  ),
                );
            }
            if(state.getDetailStatus.isFailure||state.getProductStatus.isFailure){
              return Center(
                child: Text('Error'),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
