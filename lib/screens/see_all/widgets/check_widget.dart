import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/see_all_model/filtered_search_model.dart';

// ignore: must_be_immutable
class CheckWidget extends StatefulWidget {
  CheckWidget({required this.label, required this.model, super.key});
  String label;
  FilteredSearchModel model;
  @override
  State<CheckWidget> createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
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
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Row(
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
              Text(values![0]),
            ],
          ),
          const SizedBox(height: 10),
          Row(
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
                  value: isSecondSelected,
                  onChanged: (value) {
                    isSecondSelected = !isSecondSelected;

                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
              Text(values![1]),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
