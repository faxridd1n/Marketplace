import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/assets_path/AppImagesPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/OrganizationContactModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/OrganizationModel.dart';

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
              shadowColor: isSingle ? Colors.transparent : Colors.black,
              color: isSingle ? AppColors.grey1 : Colors.white,
              child: Container(
                  width: isSingle
                      ? MediaQuery.of(context).size.width * 0.9
                      : MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
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
                                      ? contactModel!.result!.organizationName.toString()
                                      : model!.organizationName.toString(),
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    model == null
                                        ? contactModel!.result!.rating
                                            .toString()
                                        : model!.rating.toString(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '(${model == null ? contactModel!.result!.reviewCount!.toInt().toString() : model!.reviewCount!.toInt().toString()} ta izohlar)',
                                    style: TextStyle(color: AppColors.grey3),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.grey2,
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
                              Text(
                                'Telefon raqam',
                                style: TextStyle(color: AppColors.grey3),
                              ),
                              Text(
                                model == null
                                    ? contactModel!.result!.phone!.toString()
                                    : model!.contact!.phone!.toString(),
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
                              Text(
                                'Email adres',
                                style: TextStyle(color: AppColors.grey3),
                              ),
                              Text(
                                model == null
                                    ? contactModel!.result!.email.toString()
                                    : model!.contact!.email.toString(),
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
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Manzil',
                                style: TextStyle(color: AppColors.grey3),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Text(
                                  model == null
                                      ? contactModel!.result!.address.toString()
                                      : model!.address.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
