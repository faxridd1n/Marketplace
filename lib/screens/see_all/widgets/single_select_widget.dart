import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../models/see_all_model/filtered_search_model.dart';

// ignore: must_be_immutable
class SingleSelectWidget extends StatefulWidget {
  SingleSelectWidget({required this.model, super.key});
  FilteredSearchModel model;
  @override
  State<SingleSelectWidget> createState() => _SingleSelectWidgetState();
}

class _SingleSelectWidgetState extends State<SingleSelectWidget> {
  bool isFirstSelected = false;
  bool isSecondSelected = false;
  List? values = [];
  @override
  void initState() {
    values = widget.model.values?.split(',');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:AppColors.white,
      ),
      child: ExpansionTile(
        collapsedIconColor: AppColors.grey2,
        initiallyExpanded: true,
        tilePadding: const EdgeInsets.all(0),
        shape: Border.all(color:AppColors.transparent),
        iconColor: AppColors.grey2,
        title: Text(
          widget.model.name!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            // color:AppColors.red,
            height: values!.length * 40,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: values!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 40,
                  // color:AppColors.green,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          side: const BorderSide(
                            width: 1,
                            color: AppColors.grey2,
                          ),
                          checkColor:AppColors.white,
                          activeColor: AppColors.green,
                          value: isFirstSelected,
                          onChanged: (value) {
                            isFirstSelected = !isFirstSelected;
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(values![index]),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
