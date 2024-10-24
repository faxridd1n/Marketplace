import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/organization_contact_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/home_model/organization_model.dart';

// ignore: must_be_immutable
class OrganizationContactWidget extends StatelessWidget {
  OrganizationContactWidget(
      {required this.isSingle,
      required this.model,
      required this.contactModel,
      super.key});
  bool isSingle;
  OrganizationModel? model;
  OrganizationContactModel? contactModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            Card(
              elevation: 5,
              shadowColor: isSingle ? Colors.transparent :AppColors.black,
              color: isSingle ? AppColors.grey1 :AppColors.white,
              child: Container(
                width: isSingle
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(AppImages.partner),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  model == null
                                      ? contactModel?.result?.organizationName ??
                                          'Empty'
                                      : model?.organizationName ?? 'Empty',
                                  maxLines: 2,
                                  style: const TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color:AppColors.yellow,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${model == null ? contactModel?.result?.rating ?? 'Empty' : model?.rating ?? 'Empty'}',
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '(${model == null ? contactModel?.result?.reviewCount?.toInt() ?? 'Empty' : model?.reviewCount?.toInt() ?? 'Empty'} ta izohlar)',
                                    style: const TextStyle(
                                      color: AppColors.grey3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.borderColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.grey1,
                          child: SvgPicture.asset(AppIcons.call),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Telefon raqam',
                              style: TextStyle(color: AppColors.grey3),
                            ),
                            Text(
                              model == null
                                  ? contactModel?.result?.phone??'Empty'
                                  : model?.contact?.phone ??'Empty',
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.grey1,
                          child: SvgPicture.asset(AppIcons.mail),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email adres',
                              style: TextStyle(color: AppColors.grey3),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Text(
                                model == null ? contactModel?.result?.email ?? 'Empty' : model?.contact?.email ?? 'Empty',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.grey1,
                          child: SvgPicture.asset(AppIcons.location2),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Manzil',
                              style: TextStyle(color: AppColors.grey3),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Text(
                                model == null
                                    ? contactModel?.result?.address ?? 'Empty'
                                    : model?.address ?? 'Empty',
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
            ),
          ],
        ),
      ],
    );
  }
}
