// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/categories_model/CategoryModel.dart';

// // ignore: must_be_immutable
// class KatalogPagePopupWidget extends StatefulWidget {
//   KatalogPagePopupWidget(
//       {required this.model,
//       required this.index,
//       required this.selectedItem,
//       required this.selectedSubCategory,
//       super.key});
//   CategoryModel model;
//   int index;
//   int selectedSubCategory;
//   String selectedItem;
//   @override
//   State<KatalogPagePopupWidget> createState() => _KatalogPagePopupWidgetState();
// }

// class _KatalogPagePopupWidgetState extends State<KatalogPagePopupWidget> {
//   bool popUpIsOpen = false;
//   List<String> subCategories = [];
//   @override
//   void initState() {
//     for (var e in widget.model.item![widget.index].childs!) {
//       subCategories.add(e.name!);
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       elevation: 5,
//       shadowColor: Colors.black,
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 8,
//       ),
//       offset: const Offset(0, 50),
//       onSelected: (value) {
//         widget.selectedItem = value.toString();
//         popUpIsOpen = false;
//         for (var i = 0; i < subCategories.length; i++) {
//           if (subCategories[i] == widget.selectedItem) {
//             widget.selectedSubCategory = i;
//             setState(() {});
//           }
//         }
//         setState(() {});
//       },
//       onOpened: () {
//         popUpIsOpen = true;
//         setState(() {});
//       },
//       onCanceled: () {
//         popUpIsOpen = false;
//         setState(() {});
//       },
//       initialValue: widget.selectedItem.isEmpty
//           ? widget.model.item![widget.index].childs![0].name!
//           : widget.selectedItem,
//       icon: Row(
//         children: [
//           // SvgPicture.asset(AppIcons.catalogue,color: AppColors.green,),
//           const SizedBox(width: 5),
//           Text(
//             widget.selectedItem.isEmpty
//                 ? widget.model.item![widget.index].childs![0].name!
//                 : widget.selectedItem,
//             textAlign: TextAlign.right,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//               fontSize: 12,
//             ),
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           Icon(
//             popUpIsOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//             size: 20,
//           )
//         ],
//       ),
//       itemBuilder: (BuildContext context) {
//         return subCategories.map((String choice) {
//           return PopupMenuItem<String>(
//             value: choice,
//             child: Text(choice),
//           );
//         }).toList();
//       },
//     );
//   }
// }
