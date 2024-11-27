import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class PaymentWidget extends StatelessWidget {
  List paymentLogo = [
    // SvgPicture.asset(AppIcons.terminal),
    SvgPicture.asset(AppIcons.card),
    SvgPicture.asset(AppIcons.cash),
  ];
  List deliveryLogo = [
    SvgPicture.asset(AppIcons.deliverToAddress),
    SvgPicture.asset(AppIcons.deliverToBranch),
  ];

  List paymentTitle = [
    // 'Terminal',
    'Картой онлайн',
    'При получении',
  ];
  List paymentText = [
    // 'Оператор колл-центра поможет вам получить лимит',
    'UZCARD, HUMO, Visa, Mastercard',
    'Наличные/терминал по запросу',
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
          top: 15,
        ),
        width: isPaymentWidget
            ? double.infinity
            : MediaQuery.of(context).size.width * 0.43,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? AppColors.selectedPayment : AppColors.white,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
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
