import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({this.assetBanner, this.urlBanner, super.key});
  final String? assetBanner;
  final String? urlBanner;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: assetBanner != null
              ? AssetImage(
                  assetBanner!,
                )
              : NetworkImage(urlBanner!),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
