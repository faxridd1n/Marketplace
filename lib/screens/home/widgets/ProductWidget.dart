import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/products_model/parent_category_model.dart';
import 'package:flutter_application_1/screens/basket/BasketPage.dart';
import 'package:flutter_application_1/screens/home/other_pages/ProductDetailPage1.dart';
import 'package:flutter_application_1/service/basket_service/basket_service.dart';

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  ProductWidget(
      {required this.index,
      required this.model,
      required this.isMaxWidth,
      super.key});
  bool isMaxWidth;
  int index;
  ParentCategoryModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage1(
              model: model,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Wrap(
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.black,
                color: Colors.white,
                child: Container(
                  width: isMaxWidth
                      ? double.infinity
                      : MediaQuery.of(context).size.width * 0.7,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(
                                model.variations[0].files[0].url,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 240,
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${model.variations[0].prices[1].value.toInt()} сум',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                '180 000 сум',
                                style: TextStyle(
                                  // decoration: TextDecoration.lineThrough,
                                  color: AppColors.grey3,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            child: Text(
                              'x 12 мес',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        model.name,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.green,
                                ),
                                onPressed: () async {
                                  bool isAlreadyHave = false;
                                  for (var e in basketProducts) {
                                    if (e.id == model.id) {
                                      isAlreadyHave = true;
                                    }
                                  }
                                  if (!isAlreadyHave) {
                                    final response =
                                        await BasketService.postBasketProducts(
                                      model.variations[0].id,
                                    );
                                    
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  child: Text(
                                    'в корзину',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: AppColors.grey1,
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
