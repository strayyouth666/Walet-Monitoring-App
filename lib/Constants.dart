import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:protel_1/app/modules/nest/controllers/nest_controller.dart';
import 'app/modules/auth/controllers/auth_controller.dart';

AuthController authController = AuthController.instance;
NestController nestController = NestController.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp(
    // options: const FirebaseOptions(
    // apiKey: 'AIzaSyDtfeMndF_TdL94aJDK-UdQFybV9JfcqNo',
    // appId: '1:904497427586:android:4bc50dc88d3bcae00d709b',
    // messagingSenderId: '904497427586',
    // projectId: 'waletku-4ad61',
    // databaseURL: 'https://waletku-4ad61-default-rtdb.asia-southeast1.firebasedatabase.app/',
    // ),
);
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
GoogleSignIn googleSign = GoogleSignIn();