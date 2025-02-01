import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/see_all_model/filtered_search_model.dart';
import 'package:flutter_application_1/screens/see_all/widgets/check_widget.dart';
import 'package:flutter_application_1/screens/see_all/widgets/clear_filters_widget.dart';
import 'package:flutter_application_1/screens/see_all/widgets/single_select_widget.dart';
import 'package:flutter_application_1/screens/see_all/widgets/switch_widget.dart';

import '../../../core/constants/app_colors.dart';
import 'slider_widget.dart';

void openFilterSheet(
  BuildContext context,
  List<FilteredSearchModel> models,
) {
  showModalBottomSheet(
    backgroundColor:AppColors.transparent,
    context: context,
    useRootNavigator: true,
    isDismissible: true,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 1,
        builder: (ctx, controller) {
          return SingleChildScrollView(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(top: View.of(context).padding.top),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.only(top: 5, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  ...List.generate(
                    models.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: models[index].filterType == 'Range' || models[index].filterType == 'Price'
                            ? SliderWidget(
                                model: models[index],
                              )
                            : models[index].filterType == 'MultipleSelect' && models[index].dataType == 'Text'
                                ? CheckWidget(
                                    label: models[index].name!,
                                    model: models[index],
                                  )
                                : models[index].filterType == 'SingleSelect' && models[index].dataType == 'Text'
                                    ? SingleSelectWidget(
                                        model: models[index],
                                      )
                                    : SwitchWidget(
                                        label: models[index].name!,
                                      ),
                      );
                    },
                  ),
                  const ClearFiltersWidget()
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
