import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/order_model/post_order_request_model.dart';
import 'package:flutter_application_1/models/profile_model/user_profile_model.dart';
import 'package:flutter_application_1/screens/basket/other_pages/order_success_page.dart';
import 'package:flutter_application_1/screens/basket/widgets/bottom_bar_widget.dart';
import 'package:flutter_application_1/screens/buy_now/buy_now_bloc/buy_now_bloc.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/buy_now_product_list.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/input_address_widget.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/payment_widget.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/select_addres_widget.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/user_info_input_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../core/language/language_constants.dart';
import '../../models/basket_model/basket_product_model.dart';
import '../../widgets/indicator.dart';

class BuyNowPage extends StatefulWidget {
  const BuyNowPage({
    // required this.authStatus,
    super.key,
  });
  // final AuthStatus authStatus;
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
  List<Item> items = [];
  List<ProductElement> basketProducts = [];
  late final UserProfileModel userProfileModel;
  late final BuyNowBloc buyNowBloc;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  numberFormatter(String number) {
    String edittedNumber = '';
    edittedNumber +=
        '+${number.substring(0, 3)} (${number.substring(3, 5)}) ${number.substring(5, 8)}-${number.substring(8, 10)}-${number.substring(10)}';
    return edittedNumber;
  }

  @override
  void initState() {
    buyNowBloc = BuyNowBloc();
    // if (widget.authStatus == AuthStatus.authenticated) {
    getData();

    // }
    // else if (widget.authStatus == AuthStatus.unAuthenticated) {
    //   buyNowBloc.add(GetRegionsEvent());
    // } else {
    //   getData();
    // }
    super.initState();
  }

  void getData() async {
    buyNowBloc.add(GetBasketProductsEvent());
    await Future.delayed(const Duration(milliseconds: 200));
    buyNowBloc.add(GetOrganizationEvent(organizationId: 9));
    await Future.delayed(const Duration(milliseconds: 200));
    buyNowBloc.add(GetUserProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.appBarShadowColor,
        title: Text(translation(context).placingAnOrder),
      ),
      body: BlocProvider.value(
        value: buyNowBloc,
        child: BlocBuilder<BuyNowBloc, BuyNowState>(
          builder: (ctx, state) {
            if (state.getBasketProductStatus.isInProgress ||
                state.organizationContactStatus.isInProgress ||
                state.getUserProfileStatus.isInProgress) {
              return const Center(
                child: CustomLoadingIndicator(),
              );
            }
            if (state.getUserProfileStatus.isSuccess &&
                state.getBasketProductStatus.isSuccess &&
                state.organizationContactStatus.isSuccess) {
              nameController.text =
                  '${state.userProfileModel.result.firstName} ${state.userProfileModel.result.lastName}';
              numberController.text =
                  state.userProfileModel.result.phoneNumber.substring(3);
              basketProducts = state.basketResponseModel.result.products;
              return SingleChildScrollView(
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
                          Text(translation(context).selectPaymentType),
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
                          Text(translation(context).selectDeliveryType),
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
                              const SizedBox(width: 10),
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
                          UserInfoInputSection(
                              nameController: nameController,
                              numberController: numberController),
                          const SizedBox(height: 20),
                          deliveryType1
                              ? const SelectAddresWidget()
                              : const SizedBox(),
                          const SizedBox(height: 20),
                          Text(translation(context).additionalInformation),
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
                    if (state.basketResponseModel.result.products.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: BuyNowProductList(
                          model: state.basketResponseModel,
                          organizationContactModel:
                              state.organizationContactModel,
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const BottomBarWidget(
                        withButton: null,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            }
            if (state.getBasketProductStatus.isFailure ||
                state.getUserProfileStatus.isFailure ||
                state.getUserProfileStatus.isFailure) {
              return Center(
                child: Text(translation(context).failed),
              );
            }
            return const Center(
              child: SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return BlocConsumer<BuyNowBloc, BuyNowState>(
      listener: (context, state) {
        if (state.postOrderResponseStatus == FormzSubmissionStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(translation(context).successful),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return OrderSuccessPage(
                  responseModel: state.postOrderResponseModel,
                );
              },
            ),
          );
        } else if (state.postOrderResponseStatus ==
            FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(translation(context).failed),
            ),
          );

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (ctx) => Pagee(
          //       postOrderResponseModel: state.postOrderResponseModel,
          //       postOrderRequestModel: PostOrderRequestModel(
          //         paymentType: state.paymentType,
          //         deliveryType: state.deliveryType,
          //         comment: state.comment,
          //         address: state.address,
          //         regionId: state.regionId,
          //         destrictId: state.destrictId,
          //         items: state.items,
          //       ),
          //     ),
          //   ),
          // );
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (state.basketResponseModel.result.products.isNotEmpty) {
                final List<Item> itemsList = [];
                for (var e in state.basketResponseModel.result.products) {
                  itemsList.add(Item(
                    variationId: e.id,
                    count: e.count,
                  ));
                }
                context
                    .read<BuyNowBloc>()
                    .add(GetVariationEvent(items: itemsList));

                context.read<BuyNowBloc>().add(SelectPaymentTypeEvent(
                      paymentType: paymentType1 == true ? 1 : 2,
                    ));
                context.read<BuyNowBloc>().add(SelectDeliveryTypeEvent(
                      deliveryType: deliveryType1 == true ? 1 : 2,
                    ));
                context.read<BuyNowBloc>().add(
                      PostUsersOrderEvent(
                        orderRequestModel: PostOrderRequestModel(
                          paymentType: state.paymentType,
                          deliveryType: state.deliveryType,
                          regionId: state.regionId,
                          destrictId: state.destrictId,
                          address: state.address,
                          comment: state.comment,
                          items: state.items,
                        ),
                      ),
                    );
              }
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
                : Text(
                    translation(context).formalization,
                    style: const TextStyle(
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
