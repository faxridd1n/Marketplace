import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/price_function.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/core/utils/build_context_extension.dart';
import 'package:flutter_application_1/models/product_detail_model/product_detail_model.dart';
import 'package:flutter_application_1/screens/buy_now/buy_now_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../user_auth_bloc/user_auth_bloc.dart';
import '../../../user_auth_bloc/user_auth_state.dart';
import '../../../widgets/login_dialog.dart';
import '../../basket/basket_bloc/basket_bloc.dart';

class FinProdWidget extends StatefulWidget {
  const FinProdWidget({
    required this.model,
    // required this.authStatus,
    super.key,
  });
  final ProductDetailModel model;
  // final AuthStatus authStatus;

  // int index;
  @override
  State<FinProdWidget> createState() => _FinProdWidgetState();
}

class _FinProdWidgetState extends State<FinProdWidget> {
  int selectedMonths = 0;
  List oy = [3, 6, 9, 12];

  // final List<bool> _selectedFruits = <bool>[true, false, false, false];
  String price = '';
  @override
  void initState() {
    price = addSpaceEveryThreeCharacters(
        widget.model.result.variations[0].prices[0].value.toString());

    super.initState();
  }

  int basketProductCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 20,
          //     vertical: 20,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         widget.model.result!.variations![0].prices![0].type == 'Price'
          //             ? addSpaceEveryThreeCharacters(widget
          //                 .model.result!.variations![0].prices![0].value!
          //                 .toInt()
          //                 .toString())
          //             : addSpaceEveryThreeCharacters(widget
          //                 .model.result!.variations![0].prices![0].value!
          //                 .toInt()
          //                 .toString()),
          //         style: const TextStyle(
          //           decoration: TextDecoration.lineThrough,
          //           decorationColor: AppColors.grey2,
          //           color: AppColors.grey2,
          //         ),
          //       ),
          //       const SizedBox(height: 10),
          //       Row(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(100),
          //               color: AppColors.pink,
          //             ),
          //             padding: const EdgeInsets.symmetric(
          //               horizontal: 5,
          //               vertical: 2,
          //             ),
          //             child: const Text(
          //               '-12%',
          //               style: TextStyle(
          //                 color: AppColors.white,
          //               ),
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           Text(
          //             widget.model.result!.variations![0].prices![0].type ==
          //                     'Price'
          //                 ? addSpaceEveryThreeCharacters(widget
          //                     .model.result!.variations![0].prices![0].value!
          //                     .toInt()
          //                     .toString())
          //                 : addSpaceEveryThreeCharacters(widget
          //                     .model.result!.variations![0].prices![1].value!
          //                     .toInt()
          //                     .toString()),
          //             style: const TextStyle(
          //               fontSize: 18,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(height: 25),
          //       LayoutBuilder(
          //         builder: (context, constraints) => ToggleButtons(
          //           onPressed: (int index) {
          //             setState(() {
          //               // The button that is tapped is set to true, and the others to false.
          //               for (int i = 0; i < _selectedFruits.length; i++) {
          //                 _selectedFruits[i] = i == index;
          //                 selectedMonths = index;
          //               }
          //             });
          //           },
          //           borderColor: AppColors.borderColor,
          //           borderRadius: const BorderRadius.all(Radius.circular(8)),
          //           selectedBorderColor: AppColors.blue,
          //           selectedColor: AppColors.white,
          //           fillColor: AppColors.blue,
          //           color: AppColors.black,
          //           constraints: BoxConstraints.expand(
          //               width: constraints.maxWidth / 4 - 5),
          //           isSelected: _selectedFruits,
          //           children: const [
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   '3',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //                 Text(
          //                   'мес',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 )
          //               ],
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   '6',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //                 Text(
          //                   'мес',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   '9',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //                 Text(
          //                   'мес',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 )
          //               ],
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   '12',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //                 Text(
          //                   'мес',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 )
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: 25),
          //     ],
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.model.result.variations[0].prices[0].type == 'Price'
                      ? addSpaceEveryThreeCharacters((widget
                                  .model.result.variations[0].prices[0].value
                                  .toInt() /
                              oy[selectedMonths])
                          .toInt()
                          .toString())
                      : addSpaceEveryThreeCharacters((widget
                                  .model.result.variations[0].prices[1].value
                                  .toInt() /
                              oy[selectedMonths])
                          .toInt()
                          .toString()),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  'AED',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    if (basketProductCount != 0)
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 80,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.grey1,
                                ),
                                onPressed: () {
                                  if (basketProductCount != 0) {
                                    // isAddedBasket = true;
                                    final variationId =
                                        widget.model.result.variations[0].id;
                                    context.read<BasketBloc>().add(
                                          PostBasketProductBasketEvent(
                                            productVariationId: variationId,
                                            count: basketProductCount,
                                          ),
                                        );
                                    setState(() {
                                      basketProductCount -= 1;
                                    });
                                    context.showPopUp(
                                      context,
                                      title: translation(context).successful,
                                      message: widget.model.result.name,
                                    );
                                  }
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: AppColors.black,
                                  size: 25,
                                ),
                              ),
                            ),
                            Text(
                              basketProductCount.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 80,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.grey1,
                                ),
                                onPressed: () {
                                  // isAddedBasket = true;
                                  basketProductCount += 1;
                                  final variationId =
                                      widget.model.result.variations[0].id;
                                  context.read<BasketBloc>().add(
                                        PostBasketProductBasketEvent(
                                          productVariationId: variationId,
                                          count: basketProductCount,
                                        ),
                                      );
                                  setState(() {});
                                  context.showPopUp(
                                    context,
                                    title: translation(context).successful,
                                    message: widget.model.result.name,
                                  );
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: AppColors.black,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: AppColors.green,
                            ),
                            onPressed: () {
                              if (context
                                      .read<AuthenticationBloc>()
                                      .state
                                      .userAuthStatus ==
                                  AuthStatus.authenticated) {
                                final variationId =
                                    widget.model.result.variations[0].id;

                                context.read<BasketBloc>().add(
                                      PostBasketProductBasketEvent(
                                        productVariationId: variationId,
                                        count: basketProductCount,
                                      ),
                                    );
                                setState(() {
                                  basketProductCount = 1;
                                });
                                context.showPopUp(
                                  context,
                                  title: translation(context).successful,
                                  message: widget.model.result.name,
                                );
                              } else {
                                loginDiolog(context, () {
                                  setState(() {});
                                });
                              }
                            },
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              child: Text(
                                translation(context).goToBasket,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.grey1,
                  ),
                  onPressed: () {
                    if (context
                            .read<AuthenticationBloc>()
                            .state
                            .userAuthStatus ==
                        AuthStatus.authenticated) {
                      final variationId = widget.model.result.variations[0].id;
                      basketProductCount += 1;
                      context.read<BasketBloc>().add(
                            PostBasketProductBasketEvent(
                              productVariationId: variationId,
                              count: basketProductCount,
                            ),
                          );

                      context.showPopUp(
                        context,
                        title: translation(context).successful,
                        message: widget.model.result.name,
                      );
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => const BuyNowPage(),
                        ),
                      );
                      setState(() {});
                    } else {
                      loginDiolog(context, () {
                        setState(() {});
                      });
                    }
                    // if (widget.authStatus == AuthStatus.authenticated) {
                    //   Navigator.of(context, rootNavigator: true).push(
                    //     MaterialPageRoute(
                    //       builder: (context) => const BuyNowPage(),
                    //     ),
                    //   );
                    // } else {
                    //   loginDiolog(context, () {
                    //     setState(() {});
                    //   });
                    // }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Text(
                      translation(context).buyNow,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
