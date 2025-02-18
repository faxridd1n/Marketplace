import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class DetailPagePaymentWidget extends StatelessWidget {
  DetailPagePaymentWidget(
      {required this.index,
      required this.buttonIcon,
      required this.gradient1,
      required this.gradient2,
      required this.icon,
      required this.paymentText,
      required this.price,
      required this.realPrice,
      required this.buttonColor,
      super.key});
  int index;
  Color gradient1;
  Color gradient2;
  String paymentText;
  String icon;
  String realPrice;
  String price;
  String buttonIcon;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradient1, gradient2],
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            height: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: buttonColor, width: 1),
            ),
            child: SvgPicture.asset(
              icon,
              fit: index == 3 ? BoxFit.scaleDown : BoxFit.contain,
              height: 25,
              width: 25,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              paymentText,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(child: Container()),
          index == 3
              ? const SizedBox()
              : Text(
                  realPrice,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.grey3,
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index == 3 ? realPrice : price,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                width: 5,
              ),
              index == 1
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: AppColors.yellow,
                      ),
                      child: const Text('x36 oy'),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          index == 3
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      backgroundColor: buttonColor,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Xarid qilish',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                backgroundColor: buttonColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    index == 3 ? AppIcons.cartAdd : AppIcons.edit,
                    color: index == 1 ? Colors.black : AppColors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Rasmiylashtirish',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
