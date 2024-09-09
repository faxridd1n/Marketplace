// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
// import 'package:flutter_application_1/core/constants/AppColors.dart';
// import 'package:flutter_application_1/models/products_model/parent_category_model.dart';
// import 'package:flutter_application_1/screens/favorite/components/Data.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// List productData = [false, false, false, false, false, false];

// // ignore: must_be_immutable
// class TopProductsWidget extends StatefulWidget {
//   TopProductsWidget({required this.index,required this.model, super.key});
//   int index;
//   ParentCategoryModel model;
//   @override
//   State<TopProductsWidget> createState() => _TopProductsWidgetState();
// }

// class _TopProductsWidgetState extends State<TopProductsWidget> {
//   List payment = ['Kompensatsiya', 'Subsidya', 'Muddatli to\'lov'];

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>  ProductDetailPage(model: widget.model,),
//           ),
//         );
//       },
//       child: Column(
//         children: [
//           Wrap(
//             children: [
//               Card(
//                 elevation: 5,
//                 shadowColor: Colors.black,
//                 color: Colors.white,
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.75,
//                       padding: const EdgeInsets.all(15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.network(
//                             widget.model.variations[0].files[0].url,
//                             fit: BoxFit.fill,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                            Text(
//                             widget.model.name,
//                             maxLines: 2,
//                             style: const TextStyle(fontSize: 16),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                            Row(
//                             children: [
//                               const Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                                 size: 20,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(widget.model.rating.toString()),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 '(${widget.model.reviewCount.toInt()} ta izohlar)',
//                                 style: const TextStyle(color: AppColors.grey3),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                            Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 children: [
//                                   const Text(
//                                     '18 000 000 so\'m',
//                                     style: TextStyle(
//                                         decoration: TextDecoration.lineThrough,
//                                         color: AppColors.grey3),
//                                   ),
//                                   Text(
//                                     '${widget.model.variations[0].prices[1].value.toInt()} so\'m',
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const InkWell(
//                                 child: CircleAvatar(
//                                   backgroundColor: AppColors.green,
//                                   radius: 20,
//                                   child: Icon(
//                                     Icons.arrow_forward,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10),
//                             child: Divider(
//                               height: 1,
//                               color: AppColors.grey3,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 80,
//                             child: Align(
//                               alignment: Alignment.topLeft,
//                               child: Wrap(
//                                 children: [
//                                   Container(
//                                     margin: const EdgeInsets.only(
//                                         bottom: 5, right: 5),
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 5,
//                                       vertical: 8,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.seeAllButtonColor,
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         SvgPicture.asset(
//                                           AppIcons.kompensatsiya,
//                                         ),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Text(
//                                           payment[0],
//                                           style: const TextStyle(
//                                             color: AppColors.green,
//                                             fontSize: 12,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: const EdgeInsets.only(
//                                       bottom: 5,
//                                       right: 5,
//                                     ),
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 5,
//                                       vertical: 8,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.seeAllButtonColor,
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         SvgPicture.asset(
//                                           AppIcons.subsidya,
//                                         ),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Text(
//                                           payment[1],
//                                           style: const TextStyle(
//                                             color: AppColors.green,
//                                             fontSize: 12,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: const EdgeInsets.only(
//                                         bottom: 5, right: 5),
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 5,
//                                       vertical: 8,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.seeAllButtonColor,
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         SvgPicture.asset(
//                                           AppIcons.muddatliTolov,
//                                         ),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Text(
//                                           payment[2],
//                                           style: const TextStyle(
//                                             color: AppColors.green,
//                                             fontSize: 12,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       right: 10,
//                       top: 10,
//                       child: IconButton(
//                         onPressed: () {
//                           setState(
//                             () {
//                               productData[widget.index] =
//                                   !productData[widget.index];
//                               productData[widget.index]
//                                   ? likedProducts += 1
//                                   : likedProducts -= 1;
//                             },
//                           );
//                         },
//                         icon: Icon(
//                           productData[widget.index]
//                               ? Icons.favorite
//                               : Icons.favorite_border,
//                           color: productData[widget.index]
//                               ? AppColors.green
//                               : null,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
