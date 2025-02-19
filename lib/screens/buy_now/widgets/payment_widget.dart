import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentWidget extends StatefulWidget {
  PaymentWidget(
      {required this.isSelected,
      required this.deliveryType,
      required this.paymentType,
      required this.isPaymentWidget,
      super.key});
  final int? paymentType;
  final bool isSelected;
  final int? deliveryType;
  final bool isPaymentWidget;
  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  List paymentLogo = [
    // SvgPicture.asset(AppIcons.terminal),
    SvgPicture.asset(AppIcons.card),
    SvgPicture.asset(AppIcons.cash),
  ];
  List deliveryLogo = [
    SvgPicture.asset(AppIcons.deliverToAddress),
    SvgPicture.asset(AppIcons.deliverToBranch),
  ];

  // List paymentTitle = [];
  // List paymentText = [];
  // List deliveryText = [];
  // @override
  // void initState() {
  //   super.initState();
  //   paymentTitle.add(
  //     [
  //       translation(context).onlineCards,
  //       translation(context).cash,
  //     ],
  //   );
  //   paymentText.add([
  //     translation(context).uzcardHumoVisaMastercard,
  //     translation(context).payInCashUponArrival,
  //   ]);
  //   deliveryText.add([
  //     translation(context).delivery,
  //     translation(context).pickup,
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 15,
          ),
          // width: isPaymentWidget
          //     ? double.infinity
          //     : MediaQuery.of(context).size.width * 0.43,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:
                widget.isSelected ? AppColors.selectedPayment : AppColors.white,
            border: Border.all(
              color:
                  widget.isSelected ? AppColors.green : AppColors.borderColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.isPaymentWidget
                  ? paymentLogo[widget.paymentType!]
                  : deliveryLogo[widget.deliveryType!],
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // width: isPaymentWidget
                    //     ? MediaQuery.of(context).size.width * 0.6
                    //     : MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      widget.isPaymentWidget
                          ? widget.paymentType == 0
                              ? translation(context).onlineCards
                              : translation(context).cash
                          : widget.deliveryType == 0
                              ? translation(context).delivery
                              : translation(context).pickup,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  widget.isPaymentWidget
                      ? SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.72,
                          child: Text(
                            widget.paymentType == 0
                                ? translation(context).uzcardHumoVisaMastercard
                                : translation(context).payInCashUponArrival,
                            maxLines: 1,
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
      ],
    );
  }
}
