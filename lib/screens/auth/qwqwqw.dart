import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/auth_model/register_confirm_request_model.dart';
// import 'package:flutter_application_1/models/auth_model/register_confirm_response_model.dart';
import 'package:flutter_application_1/models/auth_model/register_user_request_model.dart';
import 'package:flutter_application_1/models/auth_model/register_user_response_model.dart';

class Pagee extends StatefulWidget {
  const Pagee(
      {this.model, this.userResponseModel, this.requestModel, super.key});
  final RegisterUserModel? model;
  final RegisterUserResponseModel? userResponseModel;
  final RegisterConfirmRequestModel? requestModel;
  @override
  State<Pagee> createState() => _PageeState();
}

class _PageeState extends State<Pagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              '${widget.model?.birthDate}',
              maxLines: 20,
            ),
            Text(
              '${widget.model?.confirmPassword}',
              maxLines: 20,
            ),
            Text(
              '${widget.model?.firstname}',
              maxLines: 20,
            ),
            Text(
              '${widget.model?.lastname}',
              maxLines: 20,
            ),
            Text(
              '${widget.model?.middlename}',
              maxLines: 20,
            ),
            Text(
              '${widget.model?.passportNumber}',
              maxLines: 20,
            ),
            Text(
              '${widget.model?.passportSerial}',
              maxLines: 20,
            ),
            Text(
              '${widget.model?.passportType}',
              maxLines: 20,
            ),
            Text(
              '${widget.model?.password}',
              maxLines: 20,
            ),
            Text(
              '${widget.model?.phoneNumber}',
              maxLines: 20,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              widget.userResponseModel?.result?.otpSentPhone ?? 'a',
            ),
            Text(
              '${widget.userResponseModel?.result?.clientId}',
            ),
            Text(
              '${widget.requestModel?.otp}',
            ),
            Text(
              '${widget.requestModel?.clientId}',
            ),
           



            // Text(
            //   '${widget.requestModel?.clientId}',
            // ),
            // Text(
            //   '${widget.requestModel?.otp}',
            // ),
          ],
        ),
      ),
    );
  }
}
