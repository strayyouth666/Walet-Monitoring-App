import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:protel_1/app/modules/auth/views/auth_view.dart';
import 'package:protel_1/app/modules/home/views/home_view.dart';
import '../../../../Constants.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HumidityController extends GetxController{
  late DatabaseReference _humidity;
  late StreamSubscription<Event> _humiditySubs;
  var humidity;
  void onInit() {
    super.onInit();
    _humidity = FirebaseDatabase.instance.reference().child('FirebaseIOT2').child("humidity");
    _humiditySubs = _humidity.onValue.listen((Event event) {
      humidity= event.snapshot.value.toString().obs;
    });
    // final FirebaseDatabase humdb = FirebaseDatabase();
    // _humidity = humdb.reference().child('FirebaseIOT/humidity');
    // humdb.reference().get().then((value) => {humidity=value as RxInt});
  }
  void onClose() {
    super.onClose();
    _humiditySubs.cancel();
  }
}

class TemperatureController extends GetxController{
  late DatabaseReference _temperature;
  late StreamSubscription<Event> _temperatureSubs;
  var temperature;

  void onInit() {
    super.onInit();
    _temperature = FirebaseDatabase.instance.reference().child('/FirebaseIOT2/temperature');
    _temperatureSubs = _temperature.onValue.listen((Event event) {
      temperature= event.snapshot.value.toString().obs;
    }, onError: (Object o) {
      log(o.toString());
    });
    // final FirebaseDatabase tempdb = FirebaseDatabase();
    // _temperature = tempdb.reference().child('FirebaseIOT/humidity');
    // tempdb.reference().get().then((value) => {temperature=value as RxInt});
  }
  void onClose() {
    super.onClose();
    _temperatureSubs.cancel();
  }
}

class AirqualityController extends GetxController{
  late DatabaseReference _airquality;
  late StreamSubscription<Event> _airqualitySubs;
  var airquality;


  void onInit() {
    super.onInit();
    _airquality = FirebaseDatabase.instance.reference().child('/FirebaseIOT2/airquality');
    _airqualitySubs = _airquality.onValue.listen((Event event) {
      airquality= event.snapshot.value.toString().obs;
    }, onError: (Object o) {
      log(o.toString());
    });
    // final FirebaseDatabase tempdb = FirebaseDatabase();
    // _temperature = tempdb.reference().child('FirebaseIOT/humidity');
    // tempdb.reference().get().then((value) => {temperature=value as RxInt});
  }
  void onClose() {
    super.onClose();
    _airqualitySubs.cancel();
  }
}
class FanController extends GetxController {
  final dbRef = FirebaseDatabase.instance.reference();
  var fan;
  bool value = false;
  List<FanController> myFan = RxList([]);

  onUpdate() {
    value = !value;
  }

  Future<void> writeData() async {
    dbRef.child('FirebaseIOT2').set({"control": !value});
  }
}



class AuthController extends GetxController {

  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  bool isSwitched = false;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // _humidity = FirebaseDatabase.instance.reference().child('FirebaseIOT').child("humidity");
    // _temperature = FirebaseDatabase.instance.reference().child('FirebaseIOT').child("temperature");
    // _humiditySubs = _humidity.onValue.listen((event) {
    //   var _humidity= event.snapshot.value.obs ?? 0;
    // });
    // _temperatureSubs = _temperature.onValue.listen((event) {
    //   var _temperature= event.snapshot.value.obs ?? 0;
    // });
  }

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);


    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);


    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => AuthView());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => HomeView());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => AuthView()) ;
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(()=> HomeView());
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            // ignore: invalid_return_type_for_catch_error
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void register(String email, String password, String username, String fullname) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.back();
    } catch (e) {
      Get.snackbar(
        "Error sign up in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e){
      Get.snackbar(
          "Error login in",
          e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    await auth.signOut();
  }


  @override
  void onClose() {
    //super.onClose();
    // _humiditySubs.cancel();
    // _temperatureSubs.cancel();
  }

}
