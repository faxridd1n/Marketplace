import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/buy_now/buy_now_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/price_function.dart';
import '../basket_page.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Итого',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
              return Text(
                addSpaceEveryThreeCharacters(state.basketResponseModel.result.originPrice.toString()),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              );
            })
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 1,
          color: AppColors.borderColor,
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  'Товары, ${state.basketResponseModel.result.products.length} шт.',
                ),
                Text(
                  addSpaceEveryThreeCharacters(state.basketResponseModel.result.originPrice.toString()),
                )
              ],
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Доставка',
            ),
            Text(
              'Бесплатно',
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
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
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const BuyNowPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Text(
                    'Перейти к оформлению',
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
      ],
    );
  }
}
