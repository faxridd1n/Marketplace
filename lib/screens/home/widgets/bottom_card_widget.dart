// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
// import 'package:flutter_application_1/core/constants/AppColors.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class _BottomInfoWidgetState extends State<BottomInfoWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       color: AppColors.grey1,
//       child: Column(
//         children: [
//           SvgPicture.asset(
//             AppIcons.taqsimLogo,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text('© 2022 «Taqsim»'),
//           const SizedBox(
//             height: 20,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           BottomCardWidget(),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             '©Taqsim 2020–2022. Все права защищены. Указанная в интернет-магазине цена товаров и условия их приобретения действительны на текущую дату.',
//             style: TextStyle(
//               fontSize: 12,
//               color: AppColors.grey2,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class BottomCardWidget extends StatefulWidget {
//   BottomCardWidget({super.key});

//   @override
//   State<BottomCardWidget> createState() => _BottomCardWidgetState();
// }

// class _BottomCardWidgetState extends State<BottomCardWidget> {
//   bool isDropButton1Open = false;
//   bool isDropButton2Open = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color:AppColors.white,
//       ),
//       padding: const EdgeInsets.all(15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ExpansionTile(
//             tilePadding: const EdgeInsets.all(0),
//             shape: Border.all(color:AppColors.transparent),
//             iconColor: AppColors.green,
//             title: const Text(
//               'Biz haqimizda',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             children:const <Widget>[
//                ListTile(
//                 minTileHeight: 30,
//                 minVerticalPadding: 0,
//                 contentPadding: EdgeInsets.all(0),
//                 title: Text(
//                   'Meyoriy hujjatlar',
//                   style: TextStyle(
//                     color: AppColors.grey2,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//                ListTile(
//                 minVerticalPadding: 0,
//                 minTileHeight: 30,
//                 contentPadding: EdgeInsets.all(0),
//                 title: Text(
//                   'Narxni hisoblash',
//                   style: TextStyle(
//                     color: AppColors.grey2,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Divider(
//             height: 1,
//             color: AppColors.grey2,
//           ),
//           ExpansionTile(
//             iconColor: AppColors.green,
//             tilePadding: const EdgeInsets.all(0),
//             shape: Border.all(color:AppColors.transparent),
//             title: const Text(
//               'Hamkorlik',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             children: const <Widget>[
//               ListTile(
//                 minTileHeight: 30,
//                 minVerticalPadding: 0,
//                 contentPadding: EdgeInsets.all(0),
//                 title: Text(
//                   'Meyoriy hujjatlar',
//                   style: TextStyle(
//                     color: AppColors.grey2,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 minTileHeight: 30,
//                 minVerticalPadding: 0,
//                 contentPadding: EdgeInsets.all(0),
//                 title: Text(
//                   'Narxni hisoblash',
//                   style: TextStyle(
//                     color: AppColors.grey2,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Divider(
//             height: 1,
//             color: AppColors.grey2,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'Служба поддержки 24/7',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text('998 97 123-45-67'),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'Почта',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text('support@taqsim.uz'),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text(
//             'Qo\'llab-quvvatlash xizmati dushanbadan - jumagacha, soat 9:00 dan 18:00 gacha',
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: SvgPicture.asset(
//                   AppIcons.instagram,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: SvgPicture.asset(
//                   AppIcons.facebook,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: SvgPicture.asset(
//                   AppIcons.telegram,
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class BottomInfoWidget extends StatefulWidget {
//   const BottomInfoWidget({super.key});

//   @override
//   State<BottomInfoWidget> createState() => _BottomInfoWidgetState();
// }
