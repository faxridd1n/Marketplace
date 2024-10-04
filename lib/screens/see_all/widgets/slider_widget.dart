import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/see_all_model/filtered_search_model.dart';

import '../../../core/constants/AppColors.dart';

// ignore: must_be_immutable
class SliderWidget extends StatefulWidget {
  SliderWidget({required this.model, super.key});

  FilteredSearchModel model;
  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  RangeLabels labels = const RangeLabels('start', 'end');
  List<double> variables = [];
  late RangeValues values;
  @override
  void initState() {
    List data = widget.model.values!.split('-');
    for (var e in data) {
      variables.add(double.parse(e));
    }
    values = RangeValues(variables[0], variables[1]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ExpansionTile(
        collapsedIconColor: AppColors.grey2,
        initiallyExpanded: true,
        tilePadding: const EdgeInsets.all(0),
        shape: Border.all(color: Colors.transparent),
        iconColor: AppColors.grey2,
        title: Text(
          widget.model.name!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: <Widget>[
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.grey2)),
                    child: Row(
                      children: [
                        const Text(
                          'от',
                          style: TextStyle(
                            color: AppColors.grey2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          variables[0].toInt().toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.grey2)),
                    child: Row(
                      children: [
                        const Text(
                          'до',
                          style: TextStyle(
                            color: AppColors.grey2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          variables[1].toInt().toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 10.0),
              thumbColor:Colors.white, // Set thumb color here
              disabledThumbColor: AppColors.grey3, // Color for disabled state
              
              activeTrackColor: AppColors.green, // Active track color (thumb to right side)
              inactiveTrackColor: AppColors.grey3, // Inactive track color (left side)
              overlayColor: AppColors.green.withOpacity(0.2), // Color when dragging thumb
              valueIndicatorColor: AppColors.green, // Color of value indicator popup
              valueIndicatorTextStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            child: RangeSlider(
              // activeColor: AppColors.primaryColor,
              // inactiveColor: AppColors.grey2,
              min: values.start,
              max: values.end,
              labels: RangeLabels(
                values.start.round().toString(),
                values.end.round().toString(),
              ),
              divisions: 1,
              values: values,
              onChanged: (RangeValues value) {
                values = value;
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
