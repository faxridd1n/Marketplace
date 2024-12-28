import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/basket/other_pages/empty_basket_page.dart';
import 'package:flutter_application_1/screens/basket/widgets/basket_product_list.dart';
import 'package:flutter_application_1/screens/basket/widgets/bottom_bar_widget.dart';
import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';


// bool isAllSelected = false;
// bool isCategorySelected = false;

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  bool isSelected = false;
  ScrollController controller = ScrollController();
  int productCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.appBarShadowColor,
        title: const Text(
          'Saqlanganlar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<BasketBloc, BasketState>(
        builder: (ctx, state) {
          if (state.getBasketProductStatus.isInProgress) {
            return const Center(
              child: CustomLoadingIndicator(),
            );
          }
          if (state.getBasketProductStatus.isSuccess) {
            return state.basketResponseModel.result.products.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: BasketProductListWidget(
                                    model: state.basketResponseModel,
                                    organizationContactModel:
                                        state.organizationContactModel,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        BottomAppBar(
                          padding: const EdgeInsets.all(0),
                          height:
                              // selectedProducts.isEmpty
                              //     ? MediaQuery.of(context).size.height * 0.20:
                              MediaQuery.of(context).size.height * 0.3,
                          elevation: 3,
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(88, 0, 0, 0),
                                    blurRadius: 2)
                              ],
                              color: AppColors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child:
                                //  selectedProducts.isEmpty
                                //     ? const EmptyBottomBarWidget():
                                const BottomBarWidget(),
                          ),
                        ),
                      ],
                    )
                  : const EmptyBasketPage();
          }
          if (state.getBasketProductStatus.isFailure) {
            return const LoginPage();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
