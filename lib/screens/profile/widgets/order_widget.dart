import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Removed fixed height
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(82, 0, 0, 0),
            blurRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Ensures dynamic height
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text(
                    'Заказ ID:',
                    style: TextStyle(
                      color: AppColors.grey2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '51',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Статус:',
                    style: TextStyle(
                      color: AppColors.grey2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.red, width: 0.5),
                      color: const Color.fromARGB(108, 254, 154, 147),
                    ),
                    child: const Text(
                      'Возврат денег',
                      style: TextStyle(
                        color: AppColors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '8 400 000 сум',
                    style: TextStyle(color: AppColors.green),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showMore = !showMore;
                      });
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Batafsil',
                          style: TextStyle(
                            color: AppColors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: AppColors.green,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                '11:58, 09.10.2024',
                style: TextStyle(
                  color: AppColors.grey2,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          AnimatedCrossFade(
            firstChild: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://arbuzmarket.com/api/v1/Files/16c8f5e1-2c7b-481a-b25f-4c98e2ead7d7'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 70,
                      height: 70, // Flexible sizing
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '180 000 сум',
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '1 шт. х 819 000 сум',
                            style: TextStyle(
                              color: AppColors.grey2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Электрический обогреватель Yoko YMC-2000 M',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            secondChild: const SizedBox(),
            crossFadeState:
                showMore ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
