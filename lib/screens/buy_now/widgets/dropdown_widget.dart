import 'package:flutter/material.dart';

class BuyNowDropDownWidget extends StatefulWidget {
  const BuyNowDropDownWidget({super.key});

  @override
  State<BuyNowDropDownWidget> createState() => _BuyNowDropDownWidgetState();
}

class _BuyNowDropDownWidgetState extends State<BuyNowDropDownWidget> {
  List<String> regions = [
    'Сырдарьинская область',
    'Хорезмская область',
    'Кашкадарьинская область',
    'Самаркандская область',
    'Республика Каракалпакстан',
    'Ферганская область',
    'Бухарская область',
    'Сурхандарьинская область',
    'Наманганская область',
    'Навоийская область',
    'Андижанская область',
    'Джизакская область',
    'Ташкентская область',
    'город Ташкент',
  ];
  String selectedRegion = '';
  bool popUpIsOpen = false;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      offset: const Offset(0, 50),
      onSelected: (value) {
        selectedRegion = value.toString();
        popUpIsOpen = false;
        setState(() {});
      },
      onOpened: () {
        popUpIsOpen = true;
        setState(() {});
      },
      onCanceled: () {
        popUpIsOpen = false;
        setState(() {});
      },
      initialValue: selectedRegion.isEmpty ? regions[0] : selectedRegion,
      icon: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          Text(
            selectedRegion.isEmpty ? regions[0] : selectedRegion,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            popUpIsOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          ),
        ],
      ),
      itemBuilder: (BuildContext context) {
        return regions.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
    //  SizedBox(
    //   height: 50,
    //   child: DropdownButtonFormField(

    //     menuMaxHeight: 300,
    //     icon: GestureDetector(
    //       onTap: () {
    //         selectedRegion = '';
    //         setState(() {});
    //       },
    //       child: Visibility(
    //         visible: selectedRegion.isEmpty ? false : true,
    //         child: SvgPicture.asset(
    //           AppIcons.xIcon,
    //           height: 20,
    //           width: 20,
    //           color: AppColors.grey2,
    //         ),
    //       ),
    //     ),
    //     hint: Text(
    //       selectedRegion.isEmpty ? 'Mintaqani tanlang' : selectedRegion,
    //       style: const TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.w400,
    //         color: AppColors.grey2,
    //       ),
    //     ),
    //     decoration: InputDecoration(

    //       suffixIcon: const SizedBox(
    //         width: 50,
    //         height: 30,
    //         child: IntrinsicHeight(
    //           child: Row(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               VerticalDivider(
    //                 color: Colors.black,
    //                 thickness: 0.5,
    //               ),
    //               Icon(
    //                 Icons.keyboard_arrow_down_rounded,
    //                 color: AppColors.grey2,
    //               ),
    //               SizedBox(width: 5)
    //             ],
    //           ),
    //         ),
    //       ),
    //       enabledBorder: OutlineInputBorder(
    //         borderSide: const BorderSide(color: AppColors.grey3, width: 1),
    //         borderRadius: BorderRadius.circular(12),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12),
    //         borderSide: const BorderSide(
    //           color: Colors.blue,
    //         ),
    //       ),
    //       filled: true,
    //       fillColor: AppColors.grey1,
    //     ),
    //     dropdownColor: Colors.white,
    //     // value: selectedRegion,
    //     onChanged: (String? newValue) {
    //       setState(() {
    //         selectedRegion = newValue!;
    //       });
    //     },

    //     items: regions.map((String value) {
    //       return DropdownMenuItem<String>(

    //         alignment: Alignment.bottomLeft,
    //         value: value,
    //         child: SizedBox(
    //           width: MediaQuery.of(context).size.width * 0.5,
    //           child: Text(
    //             value,
    //             style: const TextStyle(
    //               fontSize: 14,
    //               fontWeight: FontWeight.w400,
    //               color: Colors.black,
    //             ),
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //         ),
    //       );
    //     }).toList(),
    //   ),
    // );
  }
}
