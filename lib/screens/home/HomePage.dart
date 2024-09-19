import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/drawer/DrawerPage.dart';
import 'package:flutter_application_1/screens/home/home_bloc/home_bloc.dart';
import 'package:flutter_application_1/screens/home/widgets/BannerWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/BottomCardWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/HomePopUp.dart';
import 'package:flutter_application_1/screens/home/widgets/TitleWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/home_text_field_widget.dart';
import 'package:flutter_application_1/screens/home/widgets/product_list_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'widgets/CategoryWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.85, keepPage: true);
  String selectedItem = 'Toshkent shahri';
  bool popUpIsOpen = false;
  late final HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc()..add(GetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        }),
        elevation: 1,
        shadowColor: Colors.black,
        actions: [
          HomePopUpMenuWidget(false, AppIcons.location),
        ],
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: AppColors.grey3,
              height: 0.5,
            ),
            const HomeTextFieldWidget(),
            const Divider(
              color: AppColors.grey3,
              height: 0.5,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 141,
              child: PageView.builder(
                controller: controller,
                itemCount: 4,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: BannerWidget(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(7),
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
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
                      child: CircularProgressIndicator(),
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
                    child: Text('Error'),
                  );
                },
              ),
            ),
            ProductListWidget(index: 0),
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
