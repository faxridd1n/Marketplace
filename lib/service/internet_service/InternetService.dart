// import 'dart:io';

// import 'package:flutter/material.dart';

// bool hasInternet=false;
// Future checkInternetConnection(BuildContext context,Function setState) async{
//   try{
//     final result=await InternetAddress.lookup('codingzest.com');
//     if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
//       hasInternet=true;
//       setState();
//     }

//   }on SocketException catch(_){
//     hasInternet=false;
//     setState();
//   }
// }