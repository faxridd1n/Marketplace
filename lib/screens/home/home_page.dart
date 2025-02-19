import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/home/blocs/section_list_bloc/section_list_bloc.dart';
import 'package:flutter_application_1/screens/home/widgets/banner_widget.dart';
import 'package:flutter_application_1/screens/home/widgets/categories_list.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_application_1/screens/home/widgets/home_text_field_widget.dart';
import 'package:flutter_application_1/widgets/product_list_widget.dart';
import 'package:flutter_application_1/widgets/bottom_info_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/home_pop_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late final HomeBloc homeBloc;
  late final SectionListBloc sectionListBloc;

  late final PageController _pageController;

  final List<String> banners = [
    AppImages.banner1,
    AppImages.banner2,
    AppImages.banner3,
  ];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    sectionListBloc = SectionListBloc()..add(GetSectionListEvent());
    // homeBloc = HomeBloc();

    _pageController = PageController(
      viewportFraction: 0.85,
      keepPage: true,
    );

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
    return BlocProvider.value(
      value: sectionListBloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: SvgPicture.asset(AppIcons.taqsimAppLogo),
          ),
          surfaceTintColor: AppColors.transparent,
          backgroundColor: AppColors.white,
          // leading: Builder(builder: (context) {
          //   return IconButton(
          //     onPressed: () {
          //       Scaffold.of(context).openDrawer();
          //     },
          //     icon: const Icon(Icons.menu),
          //   );
          // }),
          elevation: 0,
          shadowColor: AppColors.appBarShadowColor,
          actions: const [
            HomeLanguageChangeDropDownWidget(
              isLanguagePopUp: true,
              // icon: [
              //   AppIcons.languageRu,
              //   AppIcons.languageEn,
              // ],
            ),
          ],
        ),

        // drawer: const DrawerPage(),
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
              const CategoriesListWidget(),
              BlocBuilder<SectionListBloc, SectionListState>(
                  builder: (ctx, state) {
                if (state.getTabsStatus.isInProgress) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: CustomLoadingIndicator(),
                  );
                }
                if (state.getTabsStatus.isSuccess) {
                  // final sections = state.tabModel.result.items;
                  return Column(
                    children: List.generate(state.tabModel.result.items.length,
                        (index) {
                      return Column(
                        children: [
                          SectionProductsListWidget(
                            sectionId: state.tabModel.result.items[index].id
                                .toString(),
                            sectionName:
                                state.tabModel.result.items[index].name,
                            size: 10,
                            page: 1,
                          ),
                          if (index % 2 != 0)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: SizedBox(
                                height: 150,
                                child: BannerWidget(
                                  assetBanner: banners[index == 1
                                      ? 0
                                      : index == 3
                                          ? 1
                                          : 2],
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
                  );
                }
                return const SizedBox.shrink();
              }),
              const BottomInfoWidget()
            ],
          ),
        ),
      ),
    );
  }
}
