import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ImagePreload extends StatelessWidget {
  const ImagePreload({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => Stack(
      children: [
        Positioned(
          top: 0,
          right: -1,
          left: 0,
          bottom: 0,
          child: Container(color: Colors.white),
        ),
        Shimmer(
          gradient: const LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft, colors: <Color>[
            Color.fromRGBO(231, 235, 240, 1),
            Color.fromRGBO(231, 235, 240, 1),
            Color.fromRGBO(251, 251, 251, 0.8),
            Color.fromRGBO(231, 235, 240, 1),
            Color.fromRGBO(231, 235, 240, 1),
          ], stops: <double>[
            0,
            0.35,
            0.5,
            0.65,
            2,
          ]),
          period: const Duration(seconds: 2),
          direction: ShimmerDirection.ltr,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
