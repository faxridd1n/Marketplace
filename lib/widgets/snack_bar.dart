// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/constants/app_colors.dart';

// snackBar({
//   required bool isHomePage,
//   required BuildContext context,
//   required String name,
//   required bool addProduct,
// }) {
//   ScaffoldMessenger.of(context).hideCurrentSnackBar();
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     duration: const Duration(
//       seconds: 2,
//     ),
//     elevation: 0,
//     backgroundColor: AppColors.transparent,
//     behavior: SnackBarBehavior.floating,
//     margin: EdgeInsets.only(
//       bottom: isHomePage == true
//           ? MediaQuery.of(context).size.height - 250
//           : MediaQuery.of(context).size.height - 200,
//     ),
//     padding: const EdgeInsets.all(0),
//     content: Row(
//       children: [
//         Expanded(child: Container()),
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             border: Border.all(
//               width: 1,
//               color: AppColors.snackBarGreen,
//             ),
//             borderRadius: BorderRadius.circular(10),
//             color: AppColors.snackBarGreenGradient,
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const Icon(
//                 Icons.check_circle,
//                 color: AppColors.snackBarGreen,
//                 size: 25,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     addProduct ? 'Добавлено успешно!' : 'Удален успешно!',
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.black
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width - 100,
//                     child: Text(
//                       addProduct
//                           ? '$name добавлено в корзину'
//                           : '$name  удалено из корзины',
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         color: AppColors.black
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Expanded(child: Container()),
//       ],
//     ),
//   ));
// }
