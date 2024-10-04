import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({required this.banner, super.key});
  final String banner;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(
            banner,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
