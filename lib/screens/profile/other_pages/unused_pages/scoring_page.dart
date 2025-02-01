import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class ScoringPage extends StatefulWidget {
  const ScoringPage({super.key});

  @override
  State<ScoringPage> createState() => _ScoringPageState();
}

class _ScoringPageState extends State<ScoringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.appBarShadowColor,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Скоринг',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Недоступно',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
