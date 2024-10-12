import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/price_function.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/buy_now/buy_now_page.dart';

// ignore: must_be_immutable
class FinProdWidget extends StatefulWidget {
  FinProdWidget({required this.model, super.key});
  ProductModel model;
  @override
  State<FinProdWidget> createState() => _FinProdWidgetState();
}

class _FinProdWidgetState extends State<FinProdWidget> {
  int selectedMonths = 0;
  List oy = [3, 6, 9, 12];

  final List<bool> _selectedFruits = <bool>[true, false, false, false];
  String price = '';
  @override
  void initState() {
    price = addSpaceEveryThreeCharacters(
        widget.model.variations[0].prices[0].value.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.variations[0].prices[0].type == 'Price'
                      ? addSpaceEveryThreeCharacters(widget
                          .model.variations[0].prices[0].value
                          .toInt()
                          .toString())
                      : addSpaceEveryThreeCharacters(widget
                          .model.variations[0].prices[0].value
                          .toInt()
                          .toString()),
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.grey2,
                    color: AppColors.grey2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.pink,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      child: const Text(
                        '-12%',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.model.variations[0].prices[0].type == 'Price'
                          ? addSpaceEveryThreeCharacters(widget
                              .model.variations[0].prices[0].value
                              .toInt()
                              .toString())
                          : addSpaceEveryThreeCharacters(widget
                              .model.variations[0].prices[1].value
                              .toInt()
                              .toString()),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                LayoutBuilder(
                  builder: (context, constraints) => ToggleButtons(
                    
                    onPressed: (int index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < _selectedFruits.length; i++) {
                          _selectedFruits[i] = i == index;
                          selectedMonths = index;
                        }
                      });
                    },
                    borderColor: AppColors.borderColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    selectedBorderColor: Colors.blue,
                    selectedColor: Colors.white,
                    fillColor: Colors.blue,
                    color: Colors.black,
                    constraints: BoxConstraints.expand(width: constraints.maxWidth/4-5),
                    isSelected: _selectedFruits,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '3',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'мес',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '6',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'мес',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '9',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'мес',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '12',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'мес',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.variations[0].prices[0].type == 'Price'
                          ? addSpaceEveryThreeCharacters((widget
                                      .model.variations[0].prices[0].value
                                      .toInt() /
                                  oy[selectedMonths])
                              .toInt()
                              .toString())
                          : addSpaceEveryThreeCharacters((widget
                                      .model.variations[0].prices[1].value
                                      .toInt() /
                                  oy[selectedMonths])
                              .toInt().toString()),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'сум/мес',
                      style: TextStyle(
                        color: AppColors.grey2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.borderColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                      'Купить в рассрочку',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.grey1,
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) => BuyNowPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Text(
                      'Купить сразу',
                      style: TextStyle(
                        color: Colors.black,
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
