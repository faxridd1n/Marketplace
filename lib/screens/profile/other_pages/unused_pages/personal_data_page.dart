// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/constants/app_colors.dart';
// import 'package:flutter_application_1/models/profile_model/user_profile_model.dart';
// import 'package:flutter_application_1/screens/profile/other_pages/change_password_page.dart';
// import 'package:flutter_application_1/screens/profile/other_pages/edit_number_page.dart';
// import 'package:flutter_application_1/screens/profile/widgets/delete_personal_data_diolog.dart';

// class PersonalDataPage extends StatefulWidget {
//   const PersonalDataPage({required this.userProfileModel, super.key});
//   final UserProfileModel userProfileModel;
//   @override
//   State<PersonalDataPage> createState() => _PersonalDataPageState();
// }

// class _PersonalDataPageState extends State<PersonalDataPage> {
//   numberFormatter(String number) {
//     String edittedNumber = '';
//     edittedNumber +=
//         '+${number.substring(0, 3)} (${number.substring(3, 5)}) ${number.substring(5, 8)}-${number.substring(8, 10)}-${number.substring(10)}';
//     return edittedNumber;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         shadowColor: AppColors.appBarShadowColor,
//         surfaceTintColor: AppColors.transparent,
//         backgroundColor: AppColors.white,
//         elevation: 2,
//         centerTitle: true,
//         title: const Text(
//           'Личные данные',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(
//                   color: AppColors.grey3,
//                   width: 0.5,
//                 ),
//               ),
//               margin: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 20,
//               ),
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: AppColors.grey1,
//                     ),
//                     padding: const EdgeInsets.all(15),
//                     margin: const EdgeInsets.only(bottom: 15),
//                     child: Text(
//                       widget.userProfileModel.result.firstName,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: AppColors.grey1,
//                     ),
//                     padding: const EdgeInsets.all(15),
//                     margin: const EdgeInsets.only(bottom: 15),
//                     child: Text(
//                       widget.userProfileModel.result.lastName,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: AppColors.grey1,
//                     ),
//                     padding: const EdgeInsets.all(15),
//                     margin: const EdgeInsets.only(bottom: 15),
//                     child: Text(
//                       widget.userProfileModel.result.middleName,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: AppColors.grey1,
//                     ),
//                     padding: const EdgeInsets.all(15),
//                     margin: const EdgeInsets.only(bottom: 15),
//                     child: Text(
//                       widget.userProfileModel.result.birthDate.substring(0, 10),
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: AppColors.grey1,
//                     ),
//                     padding: const EdgeInsets.all(15),
//                     margin: const EdgeInsets.only(bottom: 15),
//                     child: const Expanded(
//                       child: Text(
//                         'г.Ташкент,Мирабадский район',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: AppColors.grey1,
//                     ),
//                     padding: const EdgeInsets.all(15),
//                     margin: const EdgeInsets.only(bottom: 20),
//                     child: Text(
//                       numberFormatter(
//                           widget.userProfileModel.result.phoneNumber),
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return const EditNumberPage();
//                           },
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       backgroundColor: AppColors.green,
//                     ),
//                     child: const Text(
//                       'Изменить номер',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return const ChangePasswordPage();
//                           },
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       backgroundColor: AppColors.green,
//                     ),
//                     child: const Text(
//                       'Сменить пароль',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) {
//                       //       return const ProfilePage();
//                       //     },
//                       //   ),
//                       // );
//                       deletePersonalDataDiolog(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       backgroundColor: AppColors.green,
//                     ),
//                     child: const Text(
//                       'Удалить личные данные',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
