import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ClearFiltersWidget extends StatefulWidget {
  const ClearFiltersWidget({super.key});

  @override
  State<ClearFiltersWidget> createState() => _ClearFiltersWidgetState();
}

class _ClearFiltersWidgetState extends State<ClearFiltersWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:AppColors.transparent,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.grey1,
        ),
        onPressed: () {},
        child: const Align(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              'Очистить все фильтры',
              style: TextStyle(
                color:AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
