import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/models/login_model/post_login_response_model.dart';
import 'package:flutter_application_1/models/login_model/put_login_otp_response_model.dart';
import 'package:flutter_application_1/models/register_model/register_confirm_model/register_confirm_request_model.dart';
import 'package:flutter_application_1/models/register_model/register_confirm_model/register_confirm_response_model.dart';
// import 'package:flutter_application_1/models/auth_model/register_confirm_response_model.dart';
import 'package:flutter_application_1/models/register_model/register_model/register_user_request_model.dart';
import 'package:flutter_application_1/models/register_model/register_model/register_user_response_model.dart';

import '../../components/hive/user_token_model.dart';

class Pagee extends StatefulWidget {
  const Pagee(
      {this.model,
      this.userResponseModel,
      this.registerConfirmRequestModel,
      this.registerConfirmResponseModel,
      this.number,
      this.putLoginOtpResponseModel,
      super.key});
  final RegisterUserRequestModel? model;
  final RegisterUserResponseModel? userResponseModel;
  final RegisterConfirmRequestModel? registerConfirmRequestModel;
  final RegisterConfirmResponseModel? registerConfirmResponseModel;
  final String? number;
  final PutLoginOtpResponseModel? putLoginOtpResponseModel;
  @override
  State<Pagee> createState() => _PageeState();
}

class _PageeState extends State<Pagee> {
  @override
  void initState() {
    super.initState();
    // userTokenBox.delete('token');
    // setState(() {});
    // userTokenBox.put(
    //   'token',
    //   UserTokenModel(
    //     token:
    //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0OTciLCJPcmdhbml6YXRpb25JZCI6IiIsIlVzZXJJZCI6IjQ5NyIsIkRldmljZUlkIjoiMTIyMSIsIlJvbGVJZCI6IjEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJ1c2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6Ijk5ODMzMDAyMDcwMCIsIm5iZiI6MTczMjI2NTk4NCwiZXhwIjoxNzMyODcwNzg0LCJpc3MiOiJ0YXFzaW0udXoiLCJhdWQiOiJIYWxhbFRhcXNpbSJ9.EgrlYd_q4TAfALdwPFVqwu9Tm2_ihz-_dm6HsdL25eg',
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            // Text(
            //   '${widget.model?.birthDate}',
            //   maxLines: 20,
            // ),
            // Text(
            //   '${widget.model?.confirmPassword}',
            //   maxLines: 20,
            // ),
            // Text(
            //   '${widget.model?.firstname}',
            //   maxLines: 20,
            // ),
            // Text(
            //   '${widget.model?.lastname}',
            //   maxLines: 20,
            // ),
            // Text(
            //   '${widget.model?.middlename}',
            //   maxLines: 20,
            // ),
            // Text(
            //   '${widget.model?.passportNumber}',
            //   maxLines: 20,
            // ),
            // Text(
            //   '${widget.model?.passportSerial}',
            //   maxLines: 20,
            // ),
            // Text(
            //   '${widget.model?.passportType}',
            //   maxLines: 20,
            // ),
            // Text(
            //   '${widget.model?.password}',
            //   maxLines: 20,
            // ),
            // Text(
            //   '${widget.model?.phoneNumber}',
            //   maxLines: 20,
            // ),
            // const SizedBox(
            //   height: 50,
            // ),
            // Text(
            //   widget.userResponseModel?.result?.otpSentPhone ?? 'a',
            // ),
            // Text(
            //   '${widget.userResponseModel?.result?.clientId}',
            // ),
            // Text(
            //   '${widget.registerConfirmRequestModel?.otp}',
            // ),
            // Text(
            //   '${widget.registerConfirmRequestModel?.clientId}',
            // ),

            // Text(
            //   '${widget.registerConfirmResponseModel?.result.token}',
            // ),
            // Text(
            //   '${widget.registerConfirmResponseModel?.result.refreshToken}',
            // ),
            // userTokenBox.isNotEmpty
            //     ? Padding(
            //         padding: const EdgeInsets.all(15.0),
            //         child: Text(
            //           'token:${userTokenBox.get('token')!.token.toString()}',
            //           maxLines: 20,
            //         ),
            //       )
            //     : Text('yooooo'),

            // Text(widget.number!),
            // Text(
            //   '${widget.requestModel?.clientId}',
            // ),
            // Text(
            //   '${widget.requestModel?.otp}',
            // ),
            Text(
              '${widget.putLoginOtpResponseModel}',
            ),
          ],
        ),
      ),
    );
  }
}
