import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/basket/basket_page.dart';
// import 'package:flutter_application_1/screens/basket/basket_page.dart';
import 'package:flutter_application_1/screens/category/catalog_page.dart';
import 'package:flutter_application_1/screens/favorite/favorite_page.dart';
import 'package:flutter_application_1/screens/home/home_page.dart';
// import 'package:flutter_application_1/screens/profile/login_page.dart';
import 'package:flutter_application_1/screens/profile/profile_page.dart';

import '../components/hive/user_token.dart';
import '../screens/login/login_page.dart';
// import '../screens/profile/profile_page.dart';

enum NavItemEnum {
  home,
  category,
  basket,
  favorite,
  profile;

  bool get isHome => this == NavItemEnum.home;
  bool get isCategory => this == NavItemEnum.category;
  bool get isBasket => this == NavItemEnum.basket;
  bool get isFavorite => this == NavItemEnum.favorite;
  bool get isProfile => this == NavItemEnum.profile;
}

class TabNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final NavItemEnum tabItem;

  const TabNavigator(
      {required this.tabItem, required this.navigatorKey, super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: widget.navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        final routeBuilders =
            _routeBuilders(context: context, routeSettings: routeSettings);
        return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context));
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(
      {required BuildContext context, required RouteSettings routeSettings}) {
    final tabItem = widget.tabItem;
    if (tabItem.isHome) {
      return {'/': (context) => const HomePage()};
    }
    if (tabItem.isCategory) {
      return {'/': (context) => const CatalogPage()};
    }
    if (tabItem.isBasket) {
      return {
        '/': (context) => const BasketPage()
      };
    }
    if (tabItem.isFavorite) {
      return {'/': (context) => const FavoritePage()};
    }
    if (tabItem.isProfile) {
      return {
        '/': (context) => const ProfilePage()
      };
    }
    return {};
  }

  @override
  bool get wantKeepAlive => true;
}
