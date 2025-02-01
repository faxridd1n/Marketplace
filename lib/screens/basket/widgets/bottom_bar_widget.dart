import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/buy_now/buy_now_page.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_state.dart';
import 'package:flutter_application_1/widgets/login_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/price_function.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({this.withButton, this.authStatus, super.key});
  final bool? withButton;
  final AuthStatus? authStatus;
  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              translation(context).total,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
              return Text(
                '${addSpaceEveryThreeCharacters(state.basketResponseModel.result.originPrice.toString())} AED',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              );
            })
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 1,
          color: AppColors.borderColor,
        ),
        const SizedBox(height: 10),
        BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${translation(context).products}, ${state.basketResponseModel.result.products.length} ${translation(context).count}.',
                ),
                Text(
                  '${addSpaceEveryThreeCharacters(state.basketResponseModel.result.originPrice.toString())} AED',
                )
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              translation(context).delivery,
            ),
            Text(
              translation(context).free,
            )
          ],
        ),
        const SizedBox(height: 10),
        widget.withButton != null
            ? Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.green,
                      ),
                      onPressed: () {
                        if (widget.authStatus == AuthStatus.authenticated) {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => const BuyNowPage(),
                            ),
                          );
                        } else {
                          loginDiolog(context, () {
                            setState(() {});
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Text(
                          translation(context).proccedToCheckOut,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
