import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/products_model/parent_category_model.dart';
import 'package:flutter_application_1/screens/home/widgets/BottomCardWidget.dart';
import 'package:flutter_application_1/screens/home/other_pages/other_page_widgets/DetailPageCommentWidget.dart';
import 'package:flutter_application_1/screens/home/other_pages/other_page_widgets/DetailPagePaymentWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/OrganizationContactWidget.dart';
import 'package:flutter_application_1/screens/home/other_pages/other_page_widgets/ProductDetailPopUpWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/TitleWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/TopProductsWidget.dart';
import 'package:flutter_application_1/service/home_service/HomePageServices.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({required this.model, super.key});
  ParentCategoryModel model;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  bool isLess1 = true;
  bool isLess2 = true;

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
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 290,
                                    child: PageView.builder(
                                        controller: controller,
                                        itemCount: snapshot.data!.result!
                                            .variations![0].files!.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image.network(
                                              snapshot
                                                  .data!
                                                  .result!
                                                  .variations![0]
                                                  .files![index]
                                                  .url!,
                                              fit: BoxFit.fill,
                                            ),
                                          );
                                        }),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 15,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: const CircleAvatar(
                                            radius: 18,
                                            backgroundColor: AppColors.grey1,
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Color.fromARGB(
                                                  255, 122, 122, 122),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: AppColors.grey1,
                                            child: SvgPicture.asset(
                                              AppIcons.upload,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.grey3,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      padding: EdgeInsets.all(7),
                                      child: SmoothPageIndicator(
                                        controller: controller,
                                        count: snapshot.data!.result!
                                            .variations![0].files!.length,
                                        effect: const ColorTransitionEffect(
                                          activeDotColor: AppColors.green,
                                          dotHeight: 7,
                                          dotWidth: 7,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        snapshot.data!.result!.name!,
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(snapshot.data!.result!.rating!
                                            .toString()),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '(${snapshot.data!.result!.reviewCount!.toInt()} ta izohlar)',
                                          style:
                                              TextStyle(color: AppColors.grey3),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Wrap(
                                      children: [
                                        DetailPagePaymentWidget(
                                          index: 0,
                                          buttonIcon: AppIcons.kompensatsiya,
                                          gradient1: AppColors
                                              .detailPageGradientGreen1,
                                          gradient2: AppColors
                                              .detailPageGradientGreen2,
                                          icon: AppIcons.kompensatsiya,
                                          paymentText:
                                              'Energiyani tejash jamg\'armasidan sotib olish',
                                          price: '15 192 000 so\'m',
                                          realPrice: '18 000 000 so\'m',
                                          buttonColor: AppColors.green,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        DetailPagePaymentWidget(
                                          index: 1,
                                          buttonIcon: AppIcons.kompensatsiya,
                                          gradient1: AppColors
                                              .detailPageGradientYellow1,
                                          gradient2: AppColors
                                              .detailPageGradientYellow2,
                                          icon: AppIcons.nasiya,
                                          paymentText:
                                              'Muddatli to\'lov orqali sotib olish',
                                          price: '435 540 so\'m',
                                          realPrice: '18 000 000 so\'m',
                                          buttonColor: AppColors.yellow,
                                        ),
                                        SizedBox(
                                          height: 15,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        DetailPagePaymentWidget(
                                          index: 2,
                                          buttonIcon: AppIcons.kompensatsiya,
                                          gradient1: AppColors
                                              .detailPageGradientDarkBlue1,
                                          gradient2: AppColors
                                              .detailPageGradientDarkBlue2,
                                          icon: AppIcons.subsidyaDetail,
                                          paymentText:
                                              'Subsidiya orqali sotib olish',
                                          price: '16 736 860 so\'m',
                                          realPrice: '18 000 000 so\'m',
                                          buttonColor: AppColors.darkBlue,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        DetailPagePaymentWidget(
                                          index: 3,
                                          buttonIcon: AppIcons.kompensatsiya,
                                          gradient1:
                                              AppColors.detailPageGradientBlue1,
                                          gradient2:
                                              AppColors.detailPageGradientBlue2,
                                          icon: AppIcons.shield,
                                          paymentText:
                                              'Asl narxida sotib olish',
                                          price: 'null',
                                          realPrice: '18 000 000',
                                          buttonColor: AppColors.blue,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FutureBuilder(
                                  future:
                                      GetProductService.getOrganizationContact(
                                    widget.model.organizationId,
                                  ),
                                  builder: (context, snapshot) {
                                    print(snapshot.data);
                                    return snapshot.connectionState ==
                                            ConnectionState.done
                                        ? OrganizationContactWidget(
                                            isSingle: true,
                                            model: null,
                                            contactModel: snapshot.data,
                                          )
                                        : snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? Center(
                                                child:
                                                    // Center(
                                                    //     child: Text(
                                                    //   '${snapshot.data.toString()}',
                                                    //   maxLines: 100,
                                                    // )
                                                    CircularProgressIndicator(
                                                  strokeWidth: 3,
                                                ),
                                                // ),
                                              )
                                            : Container(
                                                child: Text(
                                                  snapshot.data.toString(),
                                                ),
                                              );
                                  }),
                              const SizedBox(
                                height: 20,
                              ),

                              // the tab bar with two items
                              SizedBox(
                                height: 50,
                                child: TabBar(
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicatorPadding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  dividerColor: AppColors.grey3,
                                  labelColor: Colors.black,
                                  unselectedLabelColor: AppColors.grey2,
                                  indicatorColor: Colors.black,
                                  controller: tabController,
                                  tabs: [
                                    const Tab(
                                      text: 'Tavsif',
                                    ),
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Sharhlar'),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(27),
                                              color: AppColors.grey3,
                                            ),
                                            child: const Text(
                                              '56',
                                              style: TextStyle(
                                                color: AppColors.grey2,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // create widgets for each tab bar here
                              SizedBox(
                                height: isLess1
                                    ? isLess2
                                        ? 875
                                        : 1800
                                    : 1800,
                                width: MediaQuery.of(context).size.width,
                                child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    //first tab bar view widget
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Tavsif',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  snapshot.data!.result!
                                                      .description!,
                                                  style: TextStyle(
                                                    color: AppColors.grey2,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  maxLines: 10,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Tavsif',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: isLess1 ? 500 : 1500,
                                            child: ListView.builder(
                                                itemCount: isLess1 ? 10 : 30,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 50,
                                                    color: index % 2 == 0
                                                        ? Colors.white
                                                        : AppColors.grey1,
                                                    child: const Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 15,
                                                        right: 15,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'MXIK kodi',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .grey2,
                                                            ),
                                                          ),
                                                          Text('#3421234')
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColors.grey1,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    )),
                                                onPressed: () {
                                                  setState(() {
                                                    isLess1 = !isLess1;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    isLess1
                                                        ? SvgPicture.asset(
                                                            AppIcons.refresh,
                                                          )
                                                        : const SizedBox(),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    isLess1
                                                        ? const Text(
                                                            'Ko\'proq ko\'rish',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )
                                                        : const Text(
                                                            'Kamaytirish',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                    // second tab bar viiew widget
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 15,
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                backgroundColor:
                                                    AppColors.seeAllButtonColor,
                                                shadowColor: Colors.transparent,
                                              ),
                                              onPressed: () {},
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    AppIcons.commentPlus,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    'Sharh qoldirish',
                                                    style: TextStyle(
                                                      color: AppColors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Barcha sharhlar',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Expanded(child: Container()),
                                                const Text(
                                                  'Tartiblash:',
                                                  style: TextStyle(
                                                    color: AppColors.grey2,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    color: AppColors.grey1,
                                                  ),
                                                  child:
                                                      ProductDetailPopUpWidget(),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: isLess2 ? 700 : 1500,
                                            child: ListView.builder(
                                                itemCount: isLess2 ? 3 : 6,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return const DetailPageCommentWidget();
                                                }),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColors.grey1,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 2),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    )),
                                                onPressed: () {
                                                  setState(() {
                                                    isLess2 = !isLess2;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    isLess2
                                                        ? SvgPicture.asset(
                                                            AppIcons.refresh,
                                                          )
                                                        : const SizedBox(),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    isLess2
                                                        ? const Text(
                                                            'Ko\'proq ko\'rish',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )
                                                        : const Text(
                                                            'Kamaytirish',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              TitleWidget(
                                titleText: 'O\'xshash mahsulotlar',
                                withSeeAllButton: true,
                              ),
                              FutureBuilder(
                                  future: GetProductService.getProducts(),
                                  builder: (context, snapshot) {
                                    print(snapshot.data);
                                    return snapshot.connectionState ==
                                            ConnectionState.done
                                        ?
                                        // snapshot.hasData?
                                        SizedBox(
                                            width: double.infinity,
                                            height: 660,
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
                                                  child: TopProductsWidget(
                                                    index: index,
                                                    model:
                                                        snapshot.data![index],
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
                                                    CircularProgressIndicator(
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
                              const SizedBox(
                                height: 30,
                              ),
                              const BottomInfoWidget()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child:
                          // Center(
                          //     child: Text(
                          //   '${snapshot.data.toString()}',
                          //   maxLines: 100,
                          // )
                          CircularProgressIndicator(
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
