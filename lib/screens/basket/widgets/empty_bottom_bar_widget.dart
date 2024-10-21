import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../assets_path/app_icons_path.dart';
import '../../../core/constants/app_colors.dart';

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
            backgroundColor: const Color.fromARGB(186, 58, 96, 78),
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
                color:AppColors.white,
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
