import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_elements.dart';
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
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: profileBloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (ctx, state) {
          if (state.getUserProfileStatus.isInProgress) {
            return const Scaffold(
              body: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(
                    color: AppColors.green,
                    strokeWidth: 3,
                  ),
                ),
              ),
            );
          }
          if (state.getUserProfileStatus.isSuccess) {
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                backgroundColor: AppColors.white,
                surfaceTintColor: AppColors.transparent,
                shadowColor: AppColors.appBarShadowColor,
                elevation: 2,
                centerTitle: true,
                title: const Text(
                  'Marketplace',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: AppColors.grey1,
                        radius: 40,
                        child: Center(
                          child: Icon(
                            Icons.person_rounded,
                            color: AppColors.grey2,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Здраствуйте!',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        state.userProfileModel!.result.phoneNumber,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ProfileElements(),
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
