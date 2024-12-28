import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/order_model/post_order_request_model.dart';
import 'package:flutter_application_1/screens/basket/other_pages/order_success_page.dart';
import 'package:flutter_application_1/screens/basket/widgets/bottom_bar_widget.dart';
import 'package:flutter_application_1/screens/buy_now/buy_now_bloc/buy_now_bloc.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/input_address_widget.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/payment_widget.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/select_addres_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../models/basket_model/basket_product_model.dart';
import '../../widgets/indicator.dart';
import '../basket/widgets/basket_product_list.dart';

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

//  List<Map> items=[{'variationId':'','count':1}];
  List<ProductElement> basketProducts = [];
  late final BuyNowBloc buyNowBloc;

  // @override
  // void initState() {
  //   buyNowBloc = BuyNowBloc();
  //   buyNowBloc.add(GetBasketProductsEvent());
  //   super.initState();
  // }

  // void getData() async {
  //   final buyNowBloc = context.read<BuyNowBloc>();
  //   buyNowBloc.add(GetBasketProductsEvent());
  //   await Future.delayed(const Duration(milliseconds: 200));
  //   buyNowBloc.add(GetOrganizationEvent(organizationId: 9));
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuyNowBloc()
        ..add(GetBasketProductsEvent())
        ..add(GetOrganizationEvent(organizationId: 9)),
      child: BlocBuilder<BuyNowBloc, BuyNowState>(
        builder: (ctx, state) {
          if (state.getBasketProductStatus.isInProgress) {
            return Scaffold(
              body: Center(
                child: CustomLoadingIndicator(),
              ),
            );
          }
          if (state.getBasketProductStatus.isSuccess) {
            basketProducts = state.basketResponseModel!.result.products;
            return Scaffold(
              backgroundColor: AppColors.pageBgColor,
              appBar: AppBar(
                surfaceTintColor: AppColors.transparent,
                backgroundColor: AppColors.white,
                elevation: 2,
                shadowColor: AppColors.appBarShadowColor,
                title: const Text('Оформление заказа'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                              Expanded(
                                child: GestureDetector(
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
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: GestureDetector(
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          deliveryType1
                              ? const SelectAddresWidget()
                              : const SizedBox(),
                          const SizedBox(height: 20),
                          const Text('Дополнительная информация'),
                          const SizedBox(height: 5),
                          const InputAddressWidget(),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: _buildSubmitButton(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BasketProductListWidget(
                        model: state.basketResponseModel!,
                        organizationContactModel:
                            state.organizationContactModel!,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const BottomBarWidget(),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }
          if (state.getBasketProductStatus.isFailure) {
            return const Scaffold(
              body: Center(
                child: Text('Fail'),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Text(state.getBasketProductStatus.toString()),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    return BlocConsumer<BuyNowBloc, BuyNowState>(
      listener: (context, state) {
        if (state.postOrderResponseStatus == FormzSubmissionStatus.success) {
          context.read<BuyNowBloc>().add(PostUsersOrderEvent(
              postOrderRequestModel: PostOrderRequestModel()));

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('successful'),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const OrderSuccessPage();
              },
            ),
          );
        } else if (state.postOrderResponseStatus ==
            FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('failed'),
            ),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (ctx) => Pagee(
          //             putLoginOtpResponseModel: state.putLoginOtpResponseModel,
          //           )
          //       //     LoginOtpPage(
          //       //   phoneNumber: numberController.text,
          //       // ),
          //       ),
          // );
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // context.read<BuyNowBloc>().add(
              //       PostUsersOrderEvent(
              //           postOrderRequestModel: PostOrderRequestModel(
              //         paymentType: paymentType1 == true ? 1 : 2,
              //         deliveryType: deliveryType1 == true ? 1 : 2,
              //         regionId: ,
              //         destrictId: ,
              //         address: "",
              //         comment: "",
              //         items: ,
              //       )),
              //     );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppColors.green,
            ),
            child: state.postOrderResponseStatus.isInProgress
                ? const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppColors.white,
                    ),
                  )
                : const Text(
                    'Подтвердить',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
