import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/basket/other_pages/empty_basket_page.dart';
import 'package:flutter_application_1/screens/basket/widgets/basket_product_list.dart';
import 'package:flutter_application_1/screens/basket/widgets/bottom_bar_widget.dart';
import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_state.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  bool isSelected = false;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.appBarShadowColor,
        title: Text(
          translation(context).basketPage,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
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
                                child: BlocProvider.value(
                                  value: context.read<BasketBloc>(),
                                  child: BasketProductListWidget(
                                    model: state.basketResponseModel,
                                    organizationContactModel:
                                        state.organizationContactModel,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      BottomAppBar(
                        padding: const EdgeInsets.all(0),
                        height: MediaQuery.of(context).size.height * 0.3,
                        elevation: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.appBarShadowColor,
                                blurRadius: 4,
                              )
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
                          child: const BottomBarWidget(
                            authStatus: AuthStatus.authenticated,
                            withButton: true,
                          ),
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
