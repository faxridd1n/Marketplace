import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../assets_path/AppIconsPath.dart';
import '../../../core/constants/AppColors.dart';

class EmptyBottomBarWidget extends StatefulWidget {
  const EmptyBottomBarWidget({super.key});

  @override
  State<EmptyBottomBarWidget> createState() => _EmptyBottomBarWidgetState();
}

class _EmptyBottomBarWidgetState extends State<EmptyBottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.basketBox,
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Text(
                'Выберите товары, чтобы перейти к оформлению заказа',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColors.green,
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              'Перейти к оформлению',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
