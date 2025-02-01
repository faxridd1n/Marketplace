// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/assets_path/app_icons_path.dart';
// import 'package:flutter_application_1/models/products_model/product_model.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../assets_path/app_images_path.dart';
// import '../../core/constants/app_colors.dart';
// import '../../widgets/indicator.dart';
// import '../buy_now/buy_now_page.dart';
// import '../product_detail/product_detail_bloc/product_detail_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';

// class ProductDetailDialog extends StatefulWidget {
//   const ProductDetailDialog({required this.model, super.key});
//   final ProductModel model;
//   @override
//   State<ProductDetailDialog> createState() => _ProductDetailDialogState();
// }

// class _ProductDetailDialogState extends State<ProductDetailDialog> {
//   late final ProductDetailBloc productDetailBloc;
//   bool isFavorite = false;
//   @override
//   void initState() {
//     super.initState();
//     productDetailBloc = ProductDetailBloc()
//       ..add(
//         GetProductDetailEvent(
//           widget.model.variations[0].productId,
//         ),
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: productDetailBloc,
//       child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
//         builder: (ctx, state) {
//           if (state.getDetailStatus.isInProgress) {
//             return Scaffold(
//               body: Center(
//                 child: CustomLoadingIndicator(),
//               ),
//             );
//           }
//           if (state.getDetailStatus.isSuccess) {
//             return Scaffold(
//               backgroundColor: AppColors.white,
//               appBar: AppBar(),
//               body:
//                   // Dialog(
//                   //   backgroundColor: AppColors.white,
//                   //   shape: RoundedRectangleBorder(
//                   //       borderRadius: BorderRadius.circular(12)),
//                   //   child:
//                   SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       top: 20, left: 20, right: 20, bottom: 15),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         state.productDetailModel!.result.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               RatingBar.builder(
//                                 itemSize: 30,
//                                 unratedColor: AppColors.grey3,
//                                 itemCount: 5,
//                                 itemPadding: const EdgeInsets.symmetric(
//                                   horizontal: 0,
//                                   vertical: 15,
//                                 ),
//                                 itemBuilder: (context, index) {
//                                   return const Icon(
//                                     Icons.star_rate_rounded,
//                                     color: AppColors.yellow,
//                                   );
//                                 },
//                                 onRatingUpdate: (rating) {},
//                               ),
//                               const SizedBox(width: 5),
//                               Text(
//                                 state.productDetailModel!.result.rating
//                                     .toInt()
//                                     .toString(),
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 AppIcons.review,
//                                 color: AppColors.yellow,
//                               ),
//                               const SizedBox(width: 5),
//                               Text(
//                                   '${state.productDetailModel!.result.reviewCount.toInt().toString()} отзывов'),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 30,
//                             width: 30,
//                             child: IconButton(
//                               padding: EdgeInsets.all(0),
//                               onPressed: () {
//                                 isFavorite = !isFavorite;
//                                 setState(() {});
//                               },
//                               icon: Icon(
//                                 isFavorite
//                                     ? Icons.favorite
//                                     : Icons.favorite_border,
//                                 color: AppColors.blue,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           const Text(
//                             'В избранное',
//                             style: TextStyle(
//                               color: AppColors.blue,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Image.network(
//                         state.productDetailModel!.result.variations[0].files[0]
//                             .url,
//                         height: 350,
//                       ),
//                       SizedBox(
//                         height: 120,
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: ListView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: state.productDetailModel!.result
//                                 .variations[0].files.length,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) => Container(
//                               margin: const EdgeInsets.all(5),
//                               width: 70,
//                               height: 120,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: (state.productDetailModel!.result
//                                             .variations[0].files.isNotEmpty &&
//                                         state
//                                             .productDetailModel!
//                                             .result
//                                             .variations[0]
//                                             .files[0]
//                                             .url
//                                             .isNotEmpty)
//                                     ? Image.network(
//                                         state.productDetailModel!.result
//                                             .variations[0].files[0].url,
//                                         fit: BoxFit.fitWidth,
//                                         errorBuilder:
//                                             (context, error, stackTrace) {
//                                           return Image.asset(
//                                             AppImages.noImage,
//                                             fit: BoxFit.fitWidth,
//                                           );
//                                         },
//                                       )
//                                     : Image.asset(
//                                         AppImages.noImage,
//                                         fit: BoxFit.fitWidth,
//                                       ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         state.productDetailModel!.result.description.toString(),
//                       ),
//                       const SizedBox(height: 15),
//                       Text(
//                         '${state.productDetailModel!.result.variations[0].prices[0].type == 'Price' ? state.productDetailModel!.result.variations[0].prices[0].value.toInt().toString() : state.productDetailModel!.result.variations[0].prices[1].value.toInt().toString()} AED',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 20,
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 backgroundColor: AppColors.green,
//                               ),
//                               onPressed: () {},
//                               child: const Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 20,
//                                   vertical: 15,
//                                 ),
//                                 child: Text(
//                                   'Купить в рассрочку',
//                                   style: TextStyle(
//                                     color: AppColors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 backgroundColor: AppColors.grey1,
//                               ),
//                               onPressed: () {
//                                 Navigator.of(context, rootNavigator: true).push(
//                                   MaterialPageRoute(
//                                     builder: (context) => const BuyNowPage(),
//                                   ),
//                                 );
//                               },
//                               child: const Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 20,
//                                   vertical: 15,
//                                 ),
//                                 child: Text(
//                                   'Купить сразу',
//                                   style: TextStyle(
//                                     color: AppColors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               // ),
//             );
//           }
//           return const Scaffold(
//             body: Center(
//               child: Text('Error'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
