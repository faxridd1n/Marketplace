import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_elements.dart';
import '../../core/constants/AppColors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: const Color.fromARGB(83, 0, 0, 0),
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20),
            Align(
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
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Здраствуйте!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Faxriddin',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20),
            ProfileElements(),
            SizedBox(height: 20),
            Align(
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
}
