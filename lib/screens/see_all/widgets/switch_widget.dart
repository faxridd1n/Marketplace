import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/AppColors.dart';

// ignore: must_be_immutable
class SwitchWidget extends StatefulWidget {
  SwitchWidget({required this.label, super.key});
  String label;
  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeColor: AppColors.green,
              ),
            )
          ],
        ));
  }
}
