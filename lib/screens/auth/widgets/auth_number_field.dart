// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/auth_model/register_user_model.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// import '../../../core/constants/AppColors.dart';

// class AuthNumberField extends StatefulWidget {
//   const AuthNumberField({required this.userModel,super.key});
//   final RegisterUserModel userModel;
//   @override
//   State<AuthNumberField> createState() => _AuthNumberFieldState();
// }

// class _AuthNumberFieldState extends State<AuthNumberField> {
//   TextEditingController numberController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     numberController.text = '+998';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Номер телефона',
//           style: TextStyle(
//             color: AppColors.grey2,
//             fontWeight: FontWeight.w500,
//             fontSize: 12,
//           ),
//         ),
//         const SizedBox(height: 10),
//         SizedBox(
//           height: 50,
//           child: TextFormField(
//             onTapOutside: (event) {
//               FocusScope.of(context).unfocus();
//             },
//             onChanged: (value) {
//               if(){

//               }
//             },
//             cursorWidth: 1.5,
//             controller: numberController,
//             // focusNode: focusNode,
//             inputFormatters: [
//               MaskTextInputFormatter(
//                 mask: "### ## ### ## ##",
//                 filter: {"#": RegExp(r'[0-9]')},
//               )
//             ],
//             validator: (value) {
//               if(value==null||value.isEmpty){
//                 return 'Enter your number correctly';
//               }
//               return null;
//             },
//             keyboardType: TextInputType.number,
//             style: const TextStyle(
//               wordSpacing: 0,
//               letterSpacing: 0,
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//             textAlignVertical: TextAlignVertical.top,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(
//                   width: 1,
//                   color: AppColors.grey3,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(
//                   width: 1,
//                   color: AppColors.grey3,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(
//                   width: 1,
//                   color: AppColors.grey3,
//                 ),
//               ),
//             ),
//             cursorColor: AppColors.green,
//           ),
//         ),
//       ],
//     );
//   }
// }
