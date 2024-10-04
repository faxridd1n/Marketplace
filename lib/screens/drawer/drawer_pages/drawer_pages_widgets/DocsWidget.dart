import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocsWidget extends StatelessWidget {
  const DocsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 5,
        shadowColor: Colors.black,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromARGB(135, 157, 229, 247),
                child: SvgPicture.asset(
                  AppIcons.document,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Qayta tiklanadigan energiya manbalaridan foydalanish haqida',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {},
                child: const Row(
                  children: [
                    Text(
                      'Batafsil',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.green,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
