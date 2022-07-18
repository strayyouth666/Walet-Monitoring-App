//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'dart:io';
import 'package:get/get.dart';
import 'package:protel_1/app/modules/auth/bindings/auth_binding.dart';
import 'package:protel_1/app/root.dart';
//import 'package:flutter/foundation.dart';
import 'Constants.dart';

import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
// import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  // options: const FirebaseOptions(
  //     apiKey: "AIzaSyAJLimhHyaHcbxtRTNZgCSXvJm8sOvIO1U",
  //     authDomain: "waletku-4ad61.firebaseapp.com",
  //     databaseURL: "https://waletku-4ad61-default-rtdb.asia-southeast1.firebasedatabase.app",
  //     projectId: "waletku-4ad61",
  //     storageBucket: "waletku-4ad61.appspot.com",
  //     messagingSenderId: "904497427586",
  //     appId: "1:904497427586:android:f88289b5a0a71ebf0d709b",
  //     measurementId: "G-M7X1QNM1DD"
  // ),

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AuthBinding(),
      // home: Root(),
      home :const CircularProgressIndicator(),
    ),
  );
}
