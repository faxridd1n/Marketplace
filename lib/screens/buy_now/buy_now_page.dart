import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/basket/other_pages/order_success_page.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/input_address_widget.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/payment_widget.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/select_addres_widget.dart';

class BuyNowPage extends StatefulWidget {
  const BuyNowPage({super.key});

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  bool paymentType1 = true;
  bool paymentType2 = false;
  bool deliveryType1 = true;
  bool deliveryType2 = false;
  String selectedRegion = '';
  String selectedDistrict = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.appBarShadowColor,
        title: const Text('Оформление заказа'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Выберите тип оплаты'),
              Wrap(
                children: [
                  GestureDetector(
                    onTap: () {
                      paymentType1 = true;
                      paymentType2 = false;
                      setState(() {});
                    },
                    child: PaymentWidget(
                      isSelected: paymentType1,
                      deliveryType: null,
                      paymentType: 0,
                      isPaymentWidget: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      paymentType1 = false;
                      paymentType2 = true;
                      // paymentType3 = false;
                      setState(() {});
                    },
                    child: PaymentWidget(
                      isSelected: paymentType2,
                      deliveryType: null,
                      paymentType: 1,
                      isPaymentWidget: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Выберите тип доставки'),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      deliveryType1 = true;
                      deliveryType2 = false;
                      setState(() {});
                    },
                    child: PaymentWidget(
                      isSelected: deliveryType1,
                      deliveryType: 0,
                      paymentType: null,
                      isPaymentWidget: false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      deliveryType1 = false;
                      deliveryType2 = true;
                      setState(() {});
                    },
                    child: PaymentWidget(
                      isSelected: deliveryType2,
                      deliveryType: 1,
                      paymentType: null,
                      isPaymentWidget: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              deliveryType1 ? const SelectAddresWidget() : const SizedBox(),
              const SizedBox(height: 20),
              const Text('Дополнительная информация'),
              const SizedBox(height: 5),
              const InputAddressWidget(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.green,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const OrderSuccessPage();
                            },
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Text(
                          'Формализация',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
