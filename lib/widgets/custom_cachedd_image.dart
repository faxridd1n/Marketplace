import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/widgets/image_preloader.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomCachedImage({
    this.imageUrl = "",
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.color,
    this.borderRadius,
    super.key,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        color: color,
        fit: fit,
        fadeInDuration: const Duration(milliseconds: 150),
        fadeOutDuration: const Duration(milliseconds: 150),
        placeholderFadeInDuration: const Duration(milliseconds: 150),
        placeholder: (context, url) => placeholder ?? const ImagePreload(),
        errorWidget: (context, url, error) => errorWidget ?? Image.asset(AppImages.noImage),
      ),
    );
  }
}
