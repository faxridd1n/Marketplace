import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class PaymentWidget extends StatelessWidget {
  List paymentLogo = [
    SvgPicture.asset(AppIcons.terminal),
    SvgPicture.asset(AppIcons.card),
    SvgPicture.asset(AppIcons.cash),
  ];
  List deliveryLogo = [
    SvgPicture.asset(AppIcons.deliverToAddress),
    SvgPicture.asset(AppIcons.deliverToBranch),
  ];

  List paymentTitle = [
    'Terminal',
    'Online karta orqali',
    'Naqd',
  ];
  List paymentText = [
    'Оператор колл-центра поможет вам получить лимит',
    'UZCARD, HUMO, Visa, Mastercard',
    'Yetib borgandan so’ng naqd pul ko’rinishida',
  ];
  List deliveryText = [
    'Доставка',
    'Самовывоз',
  ];
  PaymentWidget(
      {required this.isSelected,
      required this.deliveryType,
      required this.paymentType,
      required this.isPaymentWidget,
      super.key});
  int? paymentType;
  bool isSelected;
  int? deliveryType;
  bool isPaymentWidget;
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        margin: const EdgeInsets.only(
          top: 10,
          // right: deliveryType != null
          //     ? deliveryType == 0
          //         ? 10
          //         : 0
          //     : paymentType == 0
          //         ? 10
          //         : 0,
        ),
        width: isPaymentWidget
            ? double.infinity
            : MediaQuery.of(context).size.width * 0.43,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? AppColors.selectedPayment : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.green : AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isPaymentWidget
                ? paymentLogo[paymentType!]
                : deliveryLogo[deliveryType!],
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: isPaymentWidget
                      ? MediaQuery.of(context).size.width * 0.6
                      : MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    isPaymentWidget
                        ? paymentTitle[paymentType!]
                        : deliveryText[deliveryType!],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                isPaymentWidget
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.72,
                        child: Text(
                          paymentText[paymentType!],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}