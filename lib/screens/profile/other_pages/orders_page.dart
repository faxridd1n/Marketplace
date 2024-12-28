import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/widgets/order_widget.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import '../../../core/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../profile_bloc/profile_bloc.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late final ProfileBloc profileBloc;
  @override
  void initState() {
    super.initState();
    profileBloc = ProfileBloc()..add(GetUserOrdersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: profileBloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (ctx, state) {
          if (state.getUserOrdersStatus.isInProgress) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child:CustomLoadingIndicator(),
                ),
              ),
            );
          }
          if (state.getUserOrdersStatus.isSuccess) {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                itemCount: state
                    .userOrdersModel!.result.allCount, // Example item count
                itemBuilder: (context, index) {
                  // Each item will be dynamically sized based on OrderWidget's content
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: OrderWidget(
                      ordersModel: state.userOrdersModel!.result.items[index],
                    ), // No fixed size, adapts to its content
                  );
                },
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Error'),
              ),
            ),
          );
        },
      ),
    );
  }
}
