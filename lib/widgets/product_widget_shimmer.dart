import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      height: 450,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => customShimmerContainer(),
      ),
    );
  }

  Widget customShimmerContainer() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          buildShimmerItem(height: 170, width: 170),
          const SizedBox(height: 15),
          buildShimmerItem(height: 190, width: 170)
        ],
      ),
    );
  }
}

Widget buildShimmerItem({required double height, required double width}) {
  return Shimmer(
    gradient: const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: <Color>[
          Color.fromRGBO(231, 235, 240, 1),
          Color.fromRGBO(231, 235, 240, 1),
          Color.fromRGBO(251, 251, 251, 0.8),
          Color.fromRGBO(231, 235, 240, 1),
          Color.fromRGBO(231, 235, 240, 1),
        ],
        stops: <double>[
          0,
          0.35,
          0.5,
          0.65,
          2,
        ]),
    period: const Duration(seconds: 2),
    direction: ShimmerDirection.ltr,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
