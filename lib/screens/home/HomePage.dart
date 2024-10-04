import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/assets_path/AppImagesPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/drawer/DrawerPage.dart';
import 'package:flutter_application_1/screens/home/home_bloc/home_bloc.dart';
import 'package:flutter_application_1/screens/home/widgets/BannerWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/CategoryWidget.dart';
// import 'package:flutter_application_1/screens/home/widgets/HomePopUp.dart';
import 'package:flutter_application_1/screens/home/widgets/TitleWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/home_text_field_widget.dart';
import 'package:flutter_application_1/screens/home/widgets/product_list_widget.dart';
import 'package:flutter_application_1/widgets/bottom_info_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        }),
        elevation: 2,
        shadowColor: const Color.fromARGB(86, 0, 0, 0),
        // actions: [
        //   HomePopUpMenuWidget(false, AppIcons.location),
        // ],
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeTextFieldWidget(),
            const SizedBox(height: 10),
            SizedBox(
              height: 141,
              child: PageView.builder(
                controller: _pageController,
                itemCount: banners.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: BannerWidget(
                    banner: banners[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(7),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: banners.length,
                effect: const ColorTransitionEffect(
                  activeDotColor: AppColors.green,
                  dotColor: AppColors.grey3,
                  dotHeight: 7,
                  dotWidth: 7,
                ),
              ),
            ),
            TitleWidget(
              titleText: 'Kategoriyalar',
              withSeeAllButton: false,
              tab: null,
            ),
            BlocProvider.value(
              value: homeBloc,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (ctx, state) {
                  if (state.getCategoryStatus.isInProgress) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(
                            color: AppColors.green, strokeWidth: 3),
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
                        itemCount: state.categoryModel?.item?.length ?? 0,
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
    
            // ProductListWidget(index: 1),
            // ProductListWidget(index: 2),
            // ProductListWidget(index: 3),
            // ProductListWidget(index: 4),
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
