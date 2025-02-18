import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/see_all_model/filtered_search_model.dart';
import 'package:flutter_application_1/screens/see_all/widgets/clear_filters_widget.dart';
import '../../../core/constants/app_colors.dart';

void openFilterSheet(
  BuildContext context,
  FilteredSearchModel models,
) {
  showModalBottomSheet(
    backgroundColor: AppColors.transparent,
    context: context,
    useRootNavigator: true,
    isDismissible: true,
    builder: (BuildContext context) {
      return FilterSheetContent(models: models);
    },
  );
}

class FilterSheetContent extends StatefulWidget {
  final FilteredSearchModel models;

  const FilterSheetContent({super.key, required this.models});

  @override
  _FilterSheetContentState createState() => _FilterSheetContentState();
}

class _FilterSheetContentState extends State<FilterSheetContent> {
  int? selectedIndex; // Faqat bitta tanlangan element

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
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
              width: 50,
              height: 5,
            ),
          ),
          const SizedBox(height: 15),
          ...List.generate(
            widget.models.result.item.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Transform.scale(
                        scale: 1.15,
                        child: Checkbox(
                          shape: const CircleBorder(),
                          side: const BorderSide(
                            width: 1,
                            color: AppColors.grey2,
                          ),
                          checkColor: AppColors.white,
                          activeColor: AppColors.green,
                          value: selectedIndex == index,
                          onChanged: (value) {
                            if (value == true) {
                              setState(() {
                                selectedIndex = value! ? index : null;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.models.result.item[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          const ClearFiltersWidget()
        ],
      ),
    );
  }
}
