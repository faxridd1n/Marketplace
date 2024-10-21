import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/widgets/tab_navigator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with SingleTickerProviderStateMixin {
  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.home: GlobalKey<NavigatorState>(),
    NavItemEnum.category: GlobalKey<NavigatorState>(),
    NavItemEnum.basket: GlobalKey<NavigatorState>(),
    NavItemEnum.favorite: GlobalKey<NavigatorState>(),
    NavItemEnum.profile: GlobalKey<NavigatorState>(),
  };
  late final TabController _tabController;
  int _selectedIndex = 0;

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );
  late final BasketBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BasketBloc()..add(GetBasketProductsEvent());
    _tabController =
        TabController(length: 5, vsync: this, animationDuration: Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: PopScope(
        child: Scaffold(
          backgroundColor:AppColors.white,
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              _buildPageNavigator(NavItemEnum.home),
              _buildPageNavigator(NavItemEnum.category),
              _buildPageNavigator(NavItemEnum.basket),
              _buildPageNavigator(NavItemEnum.favorite),
              _buildPageNavigator(NavItemEnum.profile),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor:AppColors.white,
            onTap: (value) {
              _tabController.animateTo(value);
              setState(() {
                _selectedIndex = value;
              });
            },
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.green,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.home,
                  height: 24,
                  width: 24,
                ),
                label: 'Главная',
                activeIcon: SvgPicture.asset(
                  AppIcons.home,
                  color: AppColors.green,
                  height: 24,
                  width: 24,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.category,
                  height: 24,
                  width: 24,
                ),
                label: 'Каталог',
                activeIcon: SvgPicture.asset(
                  AppIcons.category,
                  color: AppColors.green,
                  height: 24,
                  width: 24,
                ),
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.shop,
                    height: 24,
                    width: 24,
                  ),
                  label: 'Корзина',
                  activeIcon: SvgPicture.asset(
                    AppIcons.shop,
                    height: 24,
                    width: 24,
                    color: AppColors.green,
                  )),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  size: 24,
                  color: AppColors.grey2,
                ),
                label: 'Избранное',
                activeIcon: SvgPicture.asset(
                  AppIcons.likeFiilled,
                  height: 24,
                  color: AppColors.green,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.profile,
                  height: 24,
                  width: 24,
                ),
                label: 'Профиль',
                activeIcon: SvgPicture.asset(
                  AppIcons.profile,
                  color: AppColors.green,
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
