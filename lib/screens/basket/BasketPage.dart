import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/basket_model/basket_response_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/basket/other_pages/empty_basket_page.dart';
import 'package:flutter_application_1/screens/basket/widgets/basket_product_widget.dart';
import 'package:flutter_application_1/screens/basket/widgets/bottom_bar_widget.dart';
import 'package:flutter_application_1/screens/basket/widgets/empty_bottom_bar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

List<BasketProductElement> basketProducts = [];
List<BasketProductElement> selectedProducts = [];
int dealSum = 0;

bool isAllSelected = false;
bool isCategorySelected = false;

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late final BasketBloc basketBloc;

  @override
  void initState() {
    basketBloc = BasketBloc()..add(GetBasketProductsEvent());

    super.initState();
  }

  bool isSelected = false;
  ScrollController controller = ScrollController();
  int productCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black,
        title: const Text(
          'Saqlanganlar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocProvider.value(
        value: basketBloc,
        child: BlocBuilder<BasketBloc, BasketState>(
          builder: (ctx, state) {
            if (state.getBasketProductStatus.isInProgress) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state.getBasketProductStatus.isSuccess) {
              basketProducts = state.basketResponseModel!.result!.products!;
              return state.basketResponseModel!.result!.products!.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: AppColors.green,
                                          value: basketProducts.length ==
                                                  selectedProducts.length
                                              ? true
                                              : isAllSelected,
                                          onChanged: (value) {
                                            setState(() {
                                              isAllSelected = value!;
                                              if (isAllSelected) {
                                                selectedProducts =
                                                    basketProducts;
                                                isCategorySelected = true;
                                                for (var e
                                                    in selectedProducts) {
                                                  for (var r in e.prices!) {
                                                    if (r.type == "Price") {
                                                      dealSum +=
                                                          r.value!.toInt();
                                                    }
                                                  }
                                                }
                                              } else {
                                                dealSum = 0;
                                                isCategorySelected = false;
                                                selectedProducts = [];
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Выбрать все товары',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: AppColors.green,
                                                value: selectedProducts
                                                            .length ==
                                                        basketProducts.length
                                                    ? true
                                                    : isCategorySelected,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isCategorySelected = value!;
                                                    if (isCategorySelected) {
                                                      selectedProducts =
                                                          basketProducts;
                                                      isAllSelected = true;
                                                      for (var e
                                                          in selectedProducts) {
                                                        for (var r
                                                            in e.prices!) {
                                                          if (r.type ==
                                                              "Price") {
                                                            dealSum += r.value!
                                                                .toInt();
                                                          }
                                                        }
                                                      }
                                                    } else {
                                                      dealSum = 0;
                                                      isAllSelected = false;
                                                      selectedProducts = [];
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Solara',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: AppColors.grey2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Divider(
                                        height: 1,
                                        color: AppColors.borderColor,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: basketProducts.length,
                                        itemBuilder: (context, index) {
                                          return BasketProductWidget(
                                            model: state.basketResponseModel!
                                                .result!.products![index],
                                            index: index,
                                            isSelected: isAllSelected ||
                                                    isCategorySelected
                                                ? true
                                                : isSelected,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        BottomAppBar(
                          padding: const EdgeInsets.all(0),
                          height: selectedProducts.length == 0
                              ? MediaQuery.of(context).size.height * 0.20
                              : MediaQuery.of(context).size.height * 0.3,
                          elevation: 3,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: selectedProducts.length == 0
                                ? const EmptyBottomBarWidget()
                                : const BottomBarWidget(),
                          ),
                        ),
                      ],
                    )
                  : const EmptyBasketPage();
            }
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          },
        ),
      ),
    );
  }
}
