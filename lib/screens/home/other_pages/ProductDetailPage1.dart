import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/assets_path/AppImagesPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/products_model/parent_category_model.dart';
import 'package:flutter_application_1/screens/home/other_pages/PDetailPageTab1.dart';
import 'package:flutter_application_1/screens/home/other_pages/PDetailPageTab2.dart';
import 'package:flutter_application_1/screens/home/other_pages/PDetailPageTab3.dart';
import 'package:flutter_application_1/screens/home/widgets/BottomCardWidget1.dart';
import 'package:flutter_application_1/screens/home/widgets/ProductWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/TitleWidget.dart';
import 'package:flutter_application_1/screens/home/other_pages/other_page_widgets/fin_prod_widget.dart';
import 'package:flutter_application_1/service/home_service/HomePageServices.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ProductDetailPage1 extends StatefulWidget {
  ProductDetailPage1({required this.model, super.key});
  ParentCategoryModel model;
  @override
  State<ProductDetailPage1> createState() => _ProductDetailPage1State();
}

class _ProductDetailPage1State extends State<ProductDetailPage1>
    with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  bool isLess1 = true;
  bool isLess2 = true;
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetProductService.getProductDetail(widget.model.id),
        builder: (context, snapshot) {
          print(snapshot.data);
          return snapshot.connectionState == ConnectionState.done
              ? DefaultTabController(
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
                                    itemCount: snapshot.data!.result!
                                        .variations![0].files!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          snapshot.data!.result!.variations![0]
                                              .files![index].url!,
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
                                    snapshot.data!.result!.variations![0].files!
                                                .length !=
                                            0
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.grey1,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            padding: const EdgeInsets.all(7),
                                            child: SmoothPageIndicator(
                                              controller: controller,
                                              count: snapshot.data!.result!
                                                  .variations![0].files!.length,
                                              effect:
                                                  const ColorTransitionEffect(
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
                                        snapshot.data!.result!.name!,
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
                                firstChild:
                                    PDetailPageTab1(model: snapshot.data!),
                                secondChild: AnimatedCrossFade(
                                  firstChild:
                                      PDetailPageTab2(model: snapshot.data!),
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
                              // SizedBox(
                              //   height: snapshot.data!.result!.variations![0]
                              //           .attributeValues!.length *
                              //       50,
                              //   width: MediaQuery.of(context).size.width,
                              //   child: TabBarView(
                              //     controller: tabController,
                              //     children: [
                              //       PDetailPageTab1(model: snapshot.data!),
                              //       PDetailPageTab2(model: snapshot.data!),
                              //       PDetailPageTab3(),
                              //     ],
                              //   ),
                              // ),

                              const SizedBox(
                                height: 20,
                              ),
                              TitleWidget(
                                titleText: 'Товары из той же линейки',
                                withSeeAllButton: true,
                              ),
                              FutureBuilder(
                                  future: GetProductService.getProducts(),
                                  builder: (context, snapshot) {
                                    // print(snapshot.data);
                                    return snapshot.connectionState ==
                                            ConnectionState.done
                                        ?
                                        // snapshot.hasData?
                                        SizedBox(
                                            width: double.infinity,
                                            height: 550,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: snapshot.data!.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  child: ProductWidget(
                                                    index: index,
                                                    model:
                                                        snapshot.data![index],
                                                    isMaxWidth: false,
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? Container(
                                                child:
                                                    // Center(
                                                    //     child: Text(
                                                    //   '${snapshot.data.toString()}',
                                                    //   maxLines: 100,
                                                    // )
                                                    const CircularProgressIndicator(
                                                  strokeWidth: 3,
                                                ),
                                                // ),
                                              )
                                            : Container(
                                                child: Text(
                                                  snapshot.data.toString(),
                                                ),
                                              );
                                    // :
                                  }),

                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.fireColor,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
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
                )
              : snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                      // ),
                    )
                  : Container(
                      child: Text(
                        snapshot.data.toString(),
                      ),
                    );
        });
  }
}
