import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/product_detail_model/organization_contact_model.dart';
import 'package:flutter_application_1/screens/organization_page/organization_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/language/language_constants.dart';
import '../../../widgets/custom_cachedd_image.dart';

// import '../../../models/home_model/organization_model.dart';

// ignore: must_be_immutable
class OrganizationContactWidget extends StatelessWidget {
  OrganizationContactWidget(
      {required this.isSingle,
      // required this.model,
      required this.contactModel,
      super.key});
  bool isSingle;
  // OrganizationModel? model;
  OrganizationContactModel? contactModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrganizationPage(
              categoryId: contactModel!.result.organizationId,
              contactModel: contactModel!,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCachedImage(
                            height: 60,
                            width: 60,
                            borderRadius: BorderRadius.circular(100),
                            imageUrl:
                                'https://business.energymarket.uz/api/v1/files/69431af3-7645-4837-98bb-cfa2931e317c',
                          ),
                          // const CircleAvatar(
                          //   radius: 28,
                          //   backgroundImage: NetworkImage(
                          //       'https://business.energymarket.uz/api/v1/files/69431af3-7645-4837-98bb-cfa2931e317c'),
                          //   // backgroundImage: AssetImage(AppImages.partner),
                          // ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  contactModel!.result.organizationName,
                                  maxLines: 2,
                                  style: const TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.yellow,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${contactModel!.result.rating}',
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '(${contactModel?.result.reviewCount.toInt()} ${translation(context).comments})',
                                    style: const TextStyle(
                                      color: AppColors.grey2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      height: 1,
                      color: AppColors.borderColor,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.grey1,
                          child: SvgPicture.asset(AppIcons.call),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              translation(context).phoneNumber,
                              style: const TextStyle(color: AppColors.grey2),
                            ),
                            Text(
                              contactModel!.result.phone,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.grey1,
                          child: SvgPicture.asset(AppIcons.mail),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Text(
                              translation(context).emailAddress,
                              style: const TextStyle(color: AppColors.grey2),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Text(
                                contactModel!.result.email,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.grey1,
                          child: SvgPicture.asset(AppIcons.location2),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              translation(context).address,
                              style: const TextStyle(color: AppColors.grey2),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Text(
                                contactModel!.result.address,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
