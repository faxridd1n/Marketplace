import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/order_model/user_orders_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/language/language_constants.dart';
import '../profile_bloc/profile_page_bloc/profile_bloc.dart';
import '../widgets/order_widget.dart';

class ActivePage extends StatefulWidget {
  final UserOrdersModel ordersModel;
  const ActivePage({required this.ordersModel, super.key});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  int page = 1;
  List<ResultItem> orders = [];
  @override
  void initState() {
    super.initState();
    orders = widget.ordersModel.result.items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: OrderWidget(
                ordersModel: orders[index],
              ),
            ),
            index + 1 == orders.length
                ? BlocConsumer<ProfileBloc, ProfileState>(
                    listenWhen: (previous, current) =>
                        previous.getShowMoreOrdersStatus !=
                        current.getShowMoreOrdersStatus,
                    listener: (context, state) {
                      if (state.getShowMoreOrdersStatus ==
                          FormzSubmissionStatus.success) {
                        orders += state.showMoreOrderModel.result.items;
                        SnackBar(
                          content: Text(translation(context).successful),
                        );
                      } else if (state.getShowMoreOrdersStatus ==
                          FormzSubmissionStatus.failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(translation(context).failed),
                          ),
                        );
                      }
                    },
                    builder: (ctx, state) {
                      return Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                page += 1;
                                context
                                    .read<ProfileBloc>()
                                    .add(ShowMoreOrderEvent(page: page));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: AppColors.green,
                              ),
                              child: state.getShowMoreOrdersStatus.isInProgress
                                  ? const SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        color: AppColors.white,
                                      ),
                                    )
                                  : const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.refresh_outlined,
                                          color: AppColors.white,
                                          size: 30,
                                        ),
                                        SizedBox(width: 5),
                                        const Text(
                                          'Show More',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      );
                    })
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
