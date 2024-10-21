import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import '../../../models/product_detail_model/product_detail_model.dart';

// ignore: must_be_immutable
class MyDialog extends StatefulWidget {
  MyDialog({required this.model, required this.index, super.key});
  ProductDetailModel model;
  int index;

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  List images = [];
  int selectedImageIndex = 0;
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  void initState() {
    super.initState();
    for (var e in widget.model.result!.variations![0].files!) {
      images.add(e.url!);
    }
    selectedImageIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          height: 400,
          width: MediaQuery.of(context).size.width,
          child:
              // PageView.builder(
              //   onPageChanged: (value) {
              //     selectedImageIndex = value;
              //     setState(() {});
              //   },
              //   controller: controller,
              //   itemCount: images.length,
              //   itemBuilder: (context, index) => Padding(
              //     padding: const EdgeInsets.only(right: 15),
              //     child:
              Center(
            child: Image.network(
              images[selectedImageIndex],
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Image(
                  image: AssetImage(
                      AppImages.noImage), // Path to your local fallback image
                );
              },
            ),
          ),
          //     ),
          //   ),
        ),
        Expanded(child: Container()),
      ],
    );
    // AlertDialog(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(0),
    //   ),
    //   insetPadding: const EdgeInsets.all(0),
    //   contentPadding: const EdgeInsets.all(0),
    //   backgroundColor: const Color.fromARGB(115, 0, 0, 0),
    //   content: Stack(
    //     children: [
    //       Stack(
    //         children: [
    //           SizedBox(
    //             height: MediaQuery.of(context).size.height,
    //             width: MediaQuery.of(context).size.width,
    //             child: Padding(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 60,
    //                 vertical: 60,
    //               ),
    //               child: Center(
    //                 child: Image.network(
    //                   images[selectedImageIndex],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: MediaQuery.of(context).size.height * 0.45,
    //             right: 5,
    //             child: GestureDetector(
    //               onTap: () {
    //                 if (images.length != 1 &&
    //                     selectedImageIndex != images.length - 1) {
    //                   selectedImageIndex += 1;
    //                   setState(() {});
    //                 }
    //               },
    //               child: CircleAvatar(
    //                 backgroundColor: AppColors.grey2,
    //                 radius: 20,
    //                 child: Center(
    //                   child: Icon(
    //                     Icons.arrow_forward_ios_rounded,
    //                     color:
    //                         widget.model.result!.variations![0].files!.length ==
    //                                 1
    //                             ? AppColors.grey3
    //                             : selectedImageIndex == images.length - 1
    //                                 ? AppColors.grey3
    //                                 :AppColors.white,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: MediaQuery.of(context).size.height * 0.45,
    //             left: 5,
    //             child: GestureDetector(
    //               onTap: () {
    //                 if (selectedImageIndex != 0 && images.length != 1) {
    //                   selectedImageIndex -= 1;
    //                 }
    //                 setState(() {});
    //               },
    //               child: CircleAvatar(
    //                 backgroundColor: AppColors.grey2,
    //                 radius: 20,
    //                 child: Center(
    //                   child: Icon(
    //                     Icons.arrow_back_ios_new_rounded,
    //                     color: selectedImageIndex == 0
    //                         ? AppColors.grey3
    //                         :AppColors.white,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Positioned(
    //         top: 15,
    //         right: 10,
    //         child: GestureDetector(
    //           onTap: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: CircleAvatar(
    //             backgroundColor: AppColors.grey2,
    //             radius: 15,
    //             child: SvgPicture.asset(
    //               AppIcons.xIcon,
    //               color:AppColors.white,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
