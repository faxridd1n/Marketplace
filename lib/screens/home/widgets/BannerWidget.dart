import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppImagesPath.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        AppImages.banner1,
        fit: BoxFit.fill,
      ),
    );
  }
}
