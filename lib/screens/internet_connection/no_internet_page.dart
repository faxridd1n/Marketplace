import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({required this.onRetry, super.key});
  final VoidCallback onRetry;
  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wifi_off_rounded,
                  size: 150,
                  color: AppColors.green,
                ),
                const SizedBox(height: 20),
                const Text(
                  'No Internet Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Please check your internet connection and try again!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.green,
                        ),
                        onPressed: () {
                          widget.onRetry;
                        },
                        child: const Text(
                          'Retry Connection',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
