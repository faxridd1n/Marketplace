import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/assets_path/AppImagesPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/basket_response_model.dart';
import 'package:flutter_application_1/screens/basket/widgets/basket_product_widget.dart';
import 'package:flutter_application_1/service/basket_service/basket_service.dart';
import 'package:flutter_svg/svg.dart';

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
        title: const Text(
          'Saqlanganlar',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
          future: BasketService.getBasketProducts(),
          builder: (context, snapshot) {
            basketProducts=snapshot.data!.result!.products!;
            return snapshot.connectionState == ConnectionState.done
                ? snapshot.data!.result!.products!.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.emptyBasket,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'В корзине пока ничего нет',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Вы можете начать покупки с главной страницы или воспользоваться поиском, если ищете что-то конкретное.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: AppColors.green,
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                child: Text(
                                  'Перейти в каталог',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    :
                    // Text(snapshot.data!.result!.products.toString(),maxLines: 200,)
                    Column(
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
                                            value: isAllSelected,
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
                                                  value: isCategorySelected,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      isCategorySelected =
                                                          value!;
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
                                                              dealSum += r
                                                                  .value!
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
                                              model: snapshot.data!,
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
                                : MediaQuery.of(context).size.height * 0.27,
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
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.basketBox,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Expanded(
                                              child: Text(
                                                'Выберите товары, чтобы перейти к оформлению заказа',
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: AppColors.green,
                                          ),
                                          onPressed: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                            child: Text(
                                              'Перейти к оформлению',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Итого',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              dealSum.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Товары, ${selectedProducts.length} шт.',
                                            ),
                                            Text(
                                              dealSum.toString(),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Доставка',
                                            ),
                                            Text(
                                              'Бесплатно',
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: AppColors.green,
                                          ),
                                          onPressed: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                            child: Text(
                                              'Перейти к оформлению',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      )
                : snapshot.connectionState == ConnectionState.waiting
                    ? Container(
                        child: Center(
                          child: const CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ),
                      )
                    : Text(
                        snapshot.data!.result.toString(),
                      );
          }),
    );
  }

  // Widget basketProductWidget(
  //   int index,
  //   bool isSelected,
  // ) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
  //     width: MediaQuery.of(context).size.width,
  //     height: 130,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Row(
  //           children: [
  //             SizedBox(
  //               height: 24,
  //               width: 24,
  //               child: Checkbox(
  //                 checkColor: Colors.white,
  //                 activeColor: AppColors.green,
  //                 value: isSelected,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     isSelected = value!;
  //                     if (isSelected) {
  //                       selectedProducts.add(basketProducts[index]);
  //                     } else {
  //                       selectedProducts.remove(basketProducts[index]);
  //                     }
  //                   });
  //                 },
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 5,
  //             ),
  //             SizedBox(
  //               height: 90,
  //               width: 60,
  //               child: Image.network(
  //                 basketProducts[index].variations[0].files[0].url,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 10,
  //             ),
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         const Text(
  //                           '182 132 сум',
  //                           style: TextStyle(
  //                             fontSize: 14,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Container(
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(100),
  //                             color: AppColors.yellow,
  //                           ),
  //                           padding: const EdgeInsets.symmetric(
  //                             horizontal: 5,
  //                           ),
  //                           child: const Text(
  //                             'x 12 мес',
  //                             style: TextStyle(
  //                               fontSize: 12,
  //                               fontWeight: FontWeight.w500,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const Text(
  //                       '180 000 сум',
  //                       style: TextStyle(
  //                         // decoration: TextDecoration.lineThrough,
  //                         color: AppColors.grey3,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   width: MediaQuery.of(context).size.width * 0.4,
  //                   child: const Text(
  //                     'Цифровой мультиметр UNI-T UT890C',
  //                     maxLines: 2,
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w400,
  //                     ),
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             GestureDetector(
  //               onTap: () {
  //                 setState(() {
  //                   for (var e in basketProducts) {
  //                     if (e.id == basketProducts[index].id) {
  //                       basketProducts.remove(e);
  //                       setState(() {});
  //                     }
  //                   }
  //                 });
  //               },
  //               child: Container(
  //                 height: 25,
  //                 width: 25,
  //                 child: SvgPicture.asset(
  //                   AppIcons.xIcon,
  //                 ),
  //               ),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 GestureDetector(
  //                   onTap: () {
  //                     setState(() {
  //                       productCount != 1
  //                           ? productCount -= 1
  //                           : productCount = 1;
  //                     });
  //                   },
  //                   child: Container(
  //                     padding: EdgeInsets.all(2),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(100),
  //                       color: AppColors.borderColor,
  //                     ),
  //                     child: Icon(
  //                       Icons.remove,
  //                       size: 20,
  //                       color:
  //                           productCount == 1 ? AppColors.grey2 : Colors.black,
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text(
  //                   productCount.toString(),
  //                   style: const TextStyle(
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   width: 10,
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     setState(() {
  //                       productCount += 1;
  //                     });
  //                   },
  //                   child: Container(
  //                     padding: EdgeInsets.all(2),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(100),
  //                       color: AppColors.borderColor,
  //                     ),
  //                     child: const Icon(
  //                       Icons.add,
  //                       size: 20,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
