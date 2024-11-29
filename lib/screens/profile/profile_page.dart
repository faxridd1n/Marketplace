import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_elements.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'profile_bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileBloc profileBloc;

  @override
  void initState() {
    super.initState();
    profileBloc = ProfileBloc()..add(GetUserProfile());
  }

  @override
  void dispose() {
    profileBloc
        .close(); // Ensure the bloc is closed when the widget is disposed
    super.dispose();
  }

  String numberFormatter(String number) {
    return '+${number.substring(0, 3)} (${number.substring(3, 5)}) ${number.substring(5, 8)}-${number.substring(8, 10)}-${number.substring(10)}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => profileBloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (ctx, state) {
          if (state.getUserProfileStatus.isInProgress) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomThicknessIndicator(),
                ),
              ),
            );
          }
          if (state.getUserProfileStatus.isSuccess) {
            return Scaffold(
              backgroundColor: AppColors.white,
              body: SafeArea(
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
              ),
            );
          }
          if (state.getUserProfileStatus.isFailure) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(userTokenBox.get('token')!.token),
                      const SizedBox(height: 10),
                      Text('${state.userProfileModel?.result}')
                    ],
                  ),
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Error'),
              ),
            ),
          );
        },
      ),
    );
  }
}
