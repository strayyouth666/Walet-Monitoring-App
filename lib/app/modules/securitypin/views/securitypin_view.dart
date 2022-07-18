// import 'package:flutter/material.dart';
// import 'package:flutter_lock_screen/flutter_lock_screen.dart';
// // import 'package:local_auth/local_auth.dart';
// import 'package:protel_1/app/modules/auth/views/auth_view.dart';
//
// //import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import '../controllers/securitypin_controller.dart';
//
// class SecuritypinView extends GetView<SecuritypinController> {
//
//   // List<String> currentPin = ["", "", "", "","", ""];
//   // TextEditingController pinOneController = TextEditingController();
//   // TextEditingController pinTwoController = TextEditingController();
//   // TextEditingController pinThreeController = TextEditingController();
//   // TextEditingController pinFourController = TextEditingController();
//   // TextEditingController pinFiveController = TextEditingController();
//   // TextEditingController pinSixController = TextEditingController();
//
//   int pinIndex = 0;
//   bool isFingerprint = false;
//   // bool get mounted => _element != null;
//
//   Future<Null> biometrics() async {
//     // final LocalAuthentication auth = new LocalAuthentication();
//     // bool authenticated = false;
//
//     // try {
//       // authenticated = await auth.authenticateWithBiometrics(
//       //     localizedReason: 'Scan your fingerprint to authenticate',
//       //     useErrorDialogs: true,
//       //     stickyAuth: false);
//     // } on PlatformException catch (e) {
//     //   print(e);
//     // }
//     // if (!mounted) return;
//     // // ignore: unnecessary_statements
//     // if (authenticated)  ()
//     // {
//     //     isFingerprint = true;
//     //   };
//   // }
//
//
//   @override
//   Widget build (BuildContext context) {
//     var myPass = [1, 2, 3, 4];
//     return LockScreen(
//         title: "This is Screet ",
//         passLength: myPass.length,
//         bgImage: "images/pass_code_bg.jpg",
//         //fingerPrintImage: "images/fingerprint.png",
//         showFingerPass: true,
//         fingerFunction: biometrics,
//         fingerVerify: isFingerprint,
//         borderColor: Colors.white,
//         showWrongPassDialog: true,
//         wrongPassContent: "Wrong pass please try again.",
//         wrongPassTitle: "Opps!",
//         wrongPassCancelButtonText: "Cancel",
//         passCodeVerify: (passcode) async {
//           for (int i = 0; i < myPass.length; i++) {
//             if (passcode[i] != myPass[i]) {
//               return false;
//             }
//           }
//
//           return true;
//         },
//         onSuccess: () {
//           Navigator.of(context).pushReplacement(
//               new MaterialPageRoute(builder: (BuildContext context) {
//                 return AuthView();
//               }));
//         });
//   }
// }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
