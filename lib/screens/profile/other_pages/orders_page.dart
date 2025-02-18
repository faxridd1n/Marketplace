import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/screens/profile/other_pages/active_page.dart';
import 'package:flutter_application_1/screens/profile/other_pages/finished_page.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import '../../../core/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../profile_bloc/profile_page_bloc/profile_bloc.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late final ProfileBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ProfileBloc()..add(PostOrderResponseEvent(page: 1));
  }

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.transparent,
          shadowColor: AppColors.appBarShadowColor,
          elevation: 2,
          centerTitle: true,
          title: Text(
            translation(context).myOrders,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      surfaceTintColor: AppColors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: selectedTab == 0
                          ? AppColors.green
                          : AppColors.pageBgColor,
                    ),
                    onPressed: () {
                      selectedTab = 0;
                      setState(() {});
                    },
                    child: Text(
                      'Active',
                      style: TextStyle(
                        color: selectedTab == 0
                            ? AppColors.white
                            : AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      surfaceTintColor: AppColors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: selectedTab == 1
                          ? AppColors.green
                          : AppColors.pageBgColor,
                    ),
                    onPressed: () {
                      selectedTab = 1;
                      bloc.add(PostFinishedOrderResponseEvent());
                      setState(() {});
                    },
                    child: Text(
                      'Finished',
                      style: TextStyle(
                        color: selectedTab == 1
                            ? AppColors.white
                            : AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (ctx, state) {
                  if (state.getUserOrdersStatus.isInProgress ||
                      state.getUserFinishedOrdersStatus.isInProgress) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 300),
                        child: CustomLoadingIndicator(),
                      ),
                    );
                  }
                  if (selectedTab == 0 && state.getUserOrdersStatus.isSuccess ||
                      selectedTab == 1 &&
                          state.getUserFinishedOrdersStatus.isSuccess) {
                    return AnimatedCrossFade(
                      firstChild:
                          ActivePage(ordersModel: state.userOrdersModel),
                      secondChild: FinishedPage(
                          ordersModel: state.userFinishedOrdersModel),
                      crossFadeState: selectedTab == 0
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 200),
                    );
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: CustomLoadingIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
