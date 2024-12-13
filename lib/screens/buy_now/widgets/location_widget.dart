import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/buy_now_model/location_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

void openLocationSheet(
  bool isRegionsBottomSheet,
  LocationModel models,
  BuildContext context,
  String selectedRegion,
) {
  // List<String> regions = [
  //   'Сырдарьинская область',
  //   'Хорезмская область',
  //   'Кашкадарьинская область',
  //   'Самаркандская область',
  //   'Республика Каракалпакстан',
  //   'Ферганская область',
  //   'Бухарская область',
  //   'Сурхандарьинская область',
  //   'Наманганская область',
  //   'Навоийская область',
  //   'Андижанская область',
  //   'Джизакская область',
  //   'Ташкентская область',
  //   'город Ташкент',
  // ];
 

  showModalBottomSheet<void>(
    backgroundColor:AppColors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      ScrollController controller = ScrollController();
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
          color:AppColors.white,
        ),
        height: 400,
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 15,
          right: 15,
          left: 15,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.grey3,
                ),
                width: 40,
                height: 5,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'O\'rnatish manzili',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    AppIcons.xIcon,
                    height: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemCount: models.result.regions.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectedRegion = models.result.regions[index].name;
                      Navigator.of(context).pop();
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      //  color:AppColors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            height: 0.5,
                            thickness: 0.5,
                            color: AppColors.grey3,
                          ),
                          const SizedBox(height: 13),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                models.result.regions[index].name,
                              ),
                              index == 0
                                  ? const Icon(
                                      Icons.check_circle_outline_outlined,
                                      color: AppColors.green,
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    },
  );
}
