import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/drawer/DrawerPage.dart';
import 'package:flutter_application_1/screens/home/home_bloc/home_bloc.dart';
import 'package:flutter_application_1/screens/home/widgets/BannerWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/category_widget.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
// import 'package:flutter_application_1/screens/home/widgets/HomePopUp.dart';
import 'package:flutter_application_1/widgets/title_widget.dart';
import 'package:flutter_application_1/screens/home/widgets/home_text_field_widget.dart';
import 'package:flutter_application_1/widgets/product_list_widget.dart';
import 'package:flutter_application_1/widgets/bottom_info_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../assets_path/app_icons_path.dart';
// import 'widgets/home_pop_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedItem = 'Toshkent shahri';
  bool popUpIsOpen = false;
  late final HomeBloc homeBloc;
  final PageController _pageController = PageController(
    viewportFraction: 0.85,
    keepPage: true,
  );
  Timer? _timer;
  List banners = [
    AppImages.banner1,
    AppImages.banner2,
    AppImages.banner3,
  ];
  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc()..add(GetCategoriesEvent());

    // Auto page switch every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      int nextPage = _pageController.page!.round() + 1;
      if (nextPage == banners.length) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: SvgPicture.asset(AppIcons.taqsimAppLogo)),
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        }),
        elevation: 2,
        shadowColor: AppColors.appBarShadowColor,
        actions: const [
          // HomePopUpMenuWidget(true, AppIcons.language),
        ],
      ),
      drawer: const DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeTextFieldWidget(),
            const SizedBox(height: 10),
            SizedBox(
              height: 141,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: banners.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: BannerWidget(
                        assetBanner: banners[index],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: banners.length,
                          effect: const ExpandingDotsEffect(
                              // paintStyle: PaintingStyle.fill,
                              activeDotColor: AppColors.green,
                              dotColor: AppColors.dotColor,
                              dotHeight: 5,
                              dotWidth: 20,
                              expansionFactor: 1.8
                              // dotWidth: 20,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const TitleWidget(
              titleText: 'Kategoriyalar',
              withSeeAllButton: false,
              categoryId: null,
            ),
            BlocProvider.value(
              value: homeBloc,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (ctx, state) {
                  if (state.getCategoryStatus.isInProgress) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomThicknessIndicator(),
                      ),
                    );
                  }
                  if (state.getCategoryStatus.isSuccess) {
                    return SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.categoryModel?.item.length ?? 0,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                            index,
                            state.categoryModel!,
                          );
                        },
                      ),
                    );
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Error'),
                    ),
                  );
                },
              ),
            ),
            const ProductListWidget(index: 0),
            const ProductListWidget(index: 1),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: SizedBox(
                height: 140,
                child: BannerWidget(
                  assetBanner: null,
                  urlBanner:
                      'https://arbuzmarket.com/api/v1/Files/fc9b6b09-f5e6-4576-b363-87564182d368',
                ),
              ),
            ),
            const ProductListWidget(index: 2),
            const ProductListWidget(index: 3),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: SizedBox(
                height: 140,
                child: BannerWidget(
                  assetBanner: null,
                  urlBanner:
                      'https://arbuzmarket.com/api/v1/Files/60114ce6-0ccd-4c81-a3c5-5b24cf73b333',
                ),
              ),
            ),
            const ProductListWidget(index: 4),
            // ProductListWidget(index: 5),
            // ProductListWidget(index: 6),
            // ProductListWidget(index: 7),
            // ProductListWidget(index: 8),
            const BottomInfoWidget()
          ],
        ),
      ),
    );
  }
}
