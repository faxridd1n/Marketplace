import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/profile_model/user_profile_model.dart';
import 'package:flutter_application_1/screens/profile/profile_bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class EditPersonalDataPage extends StatefulWidget {
  const EditPersonalDataPage({required this.userProfileModel, super.key});
  final UserProfileModel userProfileModel;
  @override
  State<EditPersonalDataPage> createState() => _EditPersonalDataPageState();
}

class _EditPersonalDataPageState extends State<EditPersonalDataPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();

  numberFormatter(String number) {
    String edittedNumber = '';
    edittedNumber +=
        '+${number.substring(0, 3)} (${number.substring(3, 5)}) ${number.substring(5, 8)}-${number.substring(8, 10)}-${number.substring(10)}';
    return edittedNumber;
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userProfileModel.result.firstName;
    surnameController.text = widget.userProfileModel.result.lastName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        shadowColor: AppColors.appBarShadowColor,
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Личные данные',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Имя',
                    style: TextStyle(
                      color: AppColors.grey2,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) {},
                      cursorWidth: 1.5,
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.grey1,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide:
                              BorderSide(color: AppColors.grey3, width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide:
                              BorderSide(color: AppColors.grey3, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide:
                              BorderSide(color: AppColors.grey3, width: 0.5),
                        ),
                      ),
                      cursorColor: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Фамилия',
                    style: TextStyle(
                      color: AppColors.grey2,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) {},
                      cursorWidth: 1.5,
                      keyboardType: TextInputType.text,
                      controller: surnameController,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.grey1,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide:
                              BorderSide(color: AppColors.grey3, width: 0.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide:
                              BorderSide(color: AppColors.grey3, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide:
                              BorderSide(color: AppColors.green, width: 0.5),
                        ),
                      ),
                      cursorColor: AppColors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildSubmitButton(),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.editUserInfoStatus == FormzSubmissionStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successful'),
            ),
          );
          Navigator.pop(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>
          //         // Pagee(
          //         //       number: requestModel.phoneNumber,
          //         //     )
          //         BlocProvider(
          //       create: (context) => LoginBloc(),
          //       child: LoginOtpPage(
          //         phoneNumber: requestModel.phoneNumber!,
          //       ),
          //     ),
          //   ),
          // );
        } else if (state.editUserInfoStatus == FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed'),
            ),
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.read<ProfileBloc>().add(
                    EditUserInfoEvent(
                      firstName: nameController.text,
                      lastName: surnameController.text,
                    ),
                  );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppColors.green,
            ),
            child: state.editUserInfoStatus.isInProgress
                ? const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppColors.white,
                    ),
                  )
                : const Text(
                    'Сахранить',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
