import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ContractsPage extends StatefulWidget {
  const ContractsPage({super.key});

  @override
  State<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.appBarShadowColor,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Контракты',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.grey2,
                radius: 30,
                child: Center(
                    child: Icon(
                  Icons.percent,
                  color: AppColors.white,
                )),
              ),
              SizedBox(height: 10),
              Text(
                'У вас нет действующей контракт',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
