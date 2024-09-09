// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/categories_model/CategoryModel.dart';

// import '../katalog_bloc/katalog_bloc.dart';

// // ignore: must_be_immutable
// class KatalogPagePopupWidget extends StatefulWidget {
//   KatalogPagePopupWidget(
//       {required this.model,
//       required this.katalogBloc,
//       required this.index,
//       // required this.selectedItem,
//       required this.selectedSubCategory,
//       super.key});
//   CategoryModel model;
//   KatalogBloc katalogBloc;
//   int index;
//   int selectedSubCategory;
//   // String selectedItem;
//   @override
//   State<KatalogPagePopupWidget> createState() => _KatalogPagePopupWidgetState();
// }

// class _KatalogPagePopupWidgetState extends State<KatalogPagePopupWidget> {
//   String selectedItem='';
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
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       elevation: 5,
//       shadowColor: Colors.black,
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 8,
//       ),
//       offset: const Offset(0, 50),
//       onSelected: (value) {
//         popUpIsOpen = false;
//         selectedItem = value.toString();
//         for (var i = 0; i < subCategories.length; i++) {
//           if (subCategories[i] == selectedItem) {
//             widget.selectedSubCategory = i;
//             widget.katalogBloc.add(GetKatalogEvent(widget.model.item![widget.index]
//                 .childs![widget.selectedSubCategory].id!));
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
//       initialValue: 
//       selectedItem.isEmpty
//           ? widget.model.item![widget.index].childs![0].name!
//           : selectedItem,
//       icon: Row(
//         children: [
//           const SizedBox(width: 5),
//           Text(
//             selectedItem.isEmpty
//                 ? widget.model.item![widget.index].childs![0].name!
//                 : selectedItem,
//             textAlign: TextAlign.right,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
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
