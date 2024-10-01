import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BannerWidget extends StatelessWidget {
  BannerWidget({required this.banner, super.key});
  String banner;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(
          banner,
        ),
        fit: BoxFit.fill
        ),
      ),
      // child: Image.asset(
      //   banner,
      //   // AppImages.banner1,
      //   fit: BoxFit.fill,
      // ),
    );
  }
}
