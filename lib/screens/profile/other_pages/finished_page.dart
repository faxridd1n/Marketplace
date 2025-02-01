import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/order_model/user_orders_model.dart';
import '../widgets/order_widget.dart';

class FinishedPage extends StatefulWidget {
  final UserOrdersModel ordersModel;
  const FinishedPage({required this.ordersModel, super.key});

  @override
  State<FinishedPage> createState() => _FinishedPageState();
}

class _FinishedPageState extends State<FinishedPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      itemCount: widget.ordersModel.result.items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: OrderWidget(
            ordersModel: widget.ordersModel.result.items[index],
          ),
        );
      },
    );
  }
}
