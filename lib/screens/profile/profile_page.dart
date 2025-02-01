import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_elements.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'profile_bloc/profile_page_bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String numberFormatter(String number) {
    return '+${number.substring(0, 3)} (${number.substring(3, 5)}) ${number.substring(5, 8)}-${number.substring(8, 10)}-${number.substring(10)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (ctx, state) {
          if (state.getUserProfileStatus.isInProgress) {
            return const SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CustomLoadingIndicator(),
                ),
              ),
            );
          }
          if (state.getUserProfileStatus.isSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppIcons.avatar),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.userProfileModel!.result.firstName} ${state.userProfileModel!.result.lastName}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              numberFormatter(
                                  state.userProfileModel!.result.phoneNumber),
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.grey2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ProfileElements(
                      userProfileModel: state.userProfileModel!,
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'v1.0.0',
                        style: TextStyle(
                          color: AppColors.grey3,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state.getUserProfileStatus.isFailure) {
            return const LoginPage();
          }
          return SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(state.getUserProfileStatus.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
