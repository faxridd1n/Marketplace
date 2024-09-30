import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/see_all_model/filtered_search_model.dart';
import 'package:flutter_application_1/screens/see_all/widgets/check_widget.dart';
import 'package:flutter_application_1/screens/see_all/widgets/clear_filters_widget.dart';
import 'package:flutter_application_1/screens/see_all/widgets/single_select_widget.dart';
import 'package:flutter_application_1/screens/see_all/widgets/switch_widget.dart';
import '../../../core/constants/AppColors.dart';
import 'slider_widget.dart';

void openFilterSheet(
  BuildContext context,
  List<FilteredSearchModel>? models,
) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      ScrollController controller = ScrollController();
      return StatefulBuilder(
        builder: (context, setState) => Stack(
          children: [
            Column(
              children: [
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 239, 239, 239),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                       left: 5,right: 5,top: 5, bottom: 80),
                  height: MediaQuery.of(context).size.height -
                      200 /*(kTextTabBarHeight)*/,
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
                      const SizedBox(height: 15),
                      Expanded(
                        child: MediaQuery.removePadding(
                          context:context,
                          removeTop:true,
                          removeBottom: true,
                          child: Scrollbar(
                            thumbVisibility: true,
                            radius: Radius.circular(10),
                            thickness: 5,
                            child: ListView.builder(
                              controller: controller,
                              shrinkWrap: true,
                              itemCount: models!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: models[index].filterType == 'Range' ||
                                          models[index].filterType == 'Price'
                                      ? SliderWidget(
                                          model: models[index],
                                        )
                                      : models[index].filterType ==
                                                  'MultipleSelect' &&
                                              models[index].dataType == 'Text'
                                          ? CheckWidget(
                                              label: models[index].name!,
                                              model: models[index],
                                            )
                                          : models[index].filterType ==
                                                      'SingleSelect' &&
                                                  models[index].dataType == 'Text'
                                              ? SingleSelectWidget(
                                                  model: models[index],
                                                )
                                              : SwitchWidget(
                                                  label: models[index].name!,
                                                ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 0,
              child: ClearFiltersWidget(),
            )
          ],
        ),
      );
    },
  );
}
