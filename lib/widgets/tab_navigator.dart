import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/basket/basket_page.dart';
import 'package:flutter_application_1/screens/category/category_page.dart';
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
  void initState() {
    super.initState();
    // userTokenBox.put(
    //   'token',
    //   UserTokenModel(
    //     token:
    //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0OTciLCJPcmdhbml6YXRpb25JZCI6IiIsIlVzZXJJZCI6IjQ5NyIsIkRldmljZUlkIjoiMTIyMSIsIlJvbGVJZCI6IjEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJ1c2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6Ijk5ODMzMDAyMDcwMCIsIm5iZiI6MTczMjI2NTk4NCwiZXhwIjoxNzMyODcwNzg0LCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.EgrlYd_q4TAfALdwPFVqwu9Tm2_ihz-_dm6HsdL25eg',
    //   ),
    // );
    // setState(() {});
  }

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
      return {'/': (context) => const CategoryPage()};
    }
    if (tabItem.isBasket) {
      return {'/': (context) => const BasketPage()};
    }
    if (tabItem.isFavorite) {
      return {'/': (context) => const FavoritePage()};
    }
    if (tabItem.isProfile) {
      return {
        '/': (context) => userTokenBox.isNotEmpty &&
                userTokenBox.get('token') != null &&
                userTokenBox.get('token')!.token.isNotEmpty
            ? const ProfilePage()
            : const LoginPage()
      };
    }
    return {};
  }

  @override
  bool get wantKeepAlive => true;
}
