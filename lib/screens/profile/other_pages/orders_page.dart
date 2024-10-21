import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/widgets/order_widget.dart';
import '../../../core/constants/app_colors.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
          'Мои заказы',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: 10, // Example item count
        itemBuilder: (context, index) {
          // Each item will be dynamically sized based on OrderWidget's content
          return const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: OrderWidget(), // No fixed size, adapts to its content
          );
        },
      ),
    );
  }
}
