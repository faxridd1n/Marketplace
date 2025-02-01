import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/widgets/tab_navigator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/hive/user_token.dart';
import '../../widgets/login_dialog.dart';

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
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 5, vsync: this, animationDuration: Duration.zero)
          ..addListener(() {
            setState(() {
              _selectedIndex = _tabController.index;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: HomeTabControllerProvider(
        controller: _tabController,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
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
            backgroundColor: AppColors.white,
            onTap: (value) {
              if (value == 2) {
                // Check if the token is empty
                final tokenModel = userTokenBox.get('token');
                if (tokenModel == null || tokenModel.token.isEmpty) {
                  // Show login dialog and prevent navigation
                  loginDiolog(context, () {
                    setState(() {});
                  });
                  return;
                }
              }
              // Change the tab if not blocked by the login dialog
              _tabController.animateTo(value);
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
                label: translation(context).homePage,
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
                label: translation(context).catalogPage,
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
                  label: translation(context).basketPage,
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
                label: translation(context).favoritePage,
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
                label: translation(context).profilePage,
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

class HomeTabControllerProvider extends InheritedWidget {
  final TabController controller;

  const HomeTabControllerProvider({
    super.key,
    required super.child,
    required this.controller,
  });

  static HomeTabControllerProvider of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>();
    assert(result != null, 'No HomeTabControllerProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;
}
