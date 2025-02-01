import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';

class DetailPageCommentWidget extends StatelessWidget {
  const DetailPageCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Image.asset(
                  AppImages.commentAvatar,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daisy Murphy',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'July, 23 2020',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey2,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.grey1,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: const Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.yellow,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.yellow,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.yellow,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.yellow,
                    ),
                    Icon(
                      Icons.star_border_rounded,
                      color: AppColors.grey2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'We suggest youSony α, is a camera system introduced on 5 June 2006. It uses and expands upon Konica Minolta camera technologies, including the Minolta AF SLR lens mount…',
            style: TextStyle(
              color: AppColors.grey2,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(
                      AppImages.commentImage2,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 52,
                width: 52,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(
                      AppImages.commentImage1,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 52,
                width: 52,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 1,
            color: AppColors.grey3,
          )
        ],
      ),
    );
  }
}
