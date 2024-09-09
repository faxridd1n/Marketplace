import 'package:flutter/material.dart';

import '../../../assets_path/AppImagesPath.dart';
import '../../../core/constants/AppColors.dart';

class EmptyBasketPage extends StatelessWidget {
  const EmptyBasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.emptyBasket,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'В корзине пока ничего нет',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Вы можете начать покупки с главной страницы или воспользоваться поиском, если ищете что-то конкретное.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(
            height: 20,
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
                'Перейти в каталог',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}
