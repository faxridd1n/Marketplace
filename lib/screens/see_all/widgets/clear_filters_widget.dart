import 'package:flutter/material.dart';

import '../../../core/constants/AppColors.dart';

class ClearFiltersWidget extends StatefulWidget {
  const ClearFiltersWidget({super.key});

  @override
  State<ClearFiltersWidget> createState() => _ClearFiltersWidgetState();
}

class _ClearFiltersWidgetState extends State<ClearFiltersWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppColors.grey1,
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Text(
                'Очистить все фильтры',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
