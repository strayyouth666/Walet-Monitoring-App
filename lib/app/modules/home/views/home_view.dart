import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:protel_1/app/modules/auth/controllers/auth_controller.dart';
import 'package:protel_1/app/modules/nest/views/nest_view.dart';
import 'package:protel_1/app/modules/profile/views/profile_view.dart';
import '../controllers/home_controller.dart';

// class HomePageGlobal extends StatefulWidget {
//   const HomePageGlobal({Key? key, required this.app}) : super(key: key);
//   final FirebaseApp app;
//
//   @override
//   HomeView createState() =>

//     HomeView();
//
// }
class HomeView extends GetView<HomeController>{
  final dbRef = FirebaseDatabase.instance.reference();
  final counterC = Get.put(HomeController());
  //var value = 0.obs;
  final HumidityController humidity = Get.put(HumidityController());
  final TemperatureController temperature = Get.put(TemperatureController());
  final AirqualityController airquality = Get.put(AirqualityController());
  final FanController fan = Get.put(FanController());

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    //final size = 200.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('walet')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Stack(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          //height: 64,
                          //margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://www.shareicon.net/data/512x512/2016/08/18/814068_face_512x512.png'),
                              ),

                              SizedBox(width: 200,),

                              SvgPicture.asset(
                                'assets/pict/mic.svg',),

                              SizedBox(width: 30,),

                              SvgPicture.asset(
                                'assets/pict/plusbut.svg',),

                            ],
                          ),
                        ),

                        SizedBox(height: 10,),
                        SizedBox(width: 1,),
                        Container(
                          height: 64,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Welcome, User' , style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),),
                                    //Text('halo'),
                                    Text('Your Swallow is waiting for you'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 12,
                            primary: false,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                //margin: EdgeInsets.all (4.0),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10,),

                                    Text('Air Temperature'),

                                    SvgPicture.asset(
                                      'assets/pict/rectangle.svg', height: 16,),
                                    // SvgPicture.asset(
                                    //   'assets/pict/circle.svg',),
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 25,),
                                          Obx(() =>
                                              Text(
                                                temperature.temperature.string),
                                          ),
                                                //"${snapshot.data!.snapshot.value["temperature:"].toString()},",
                                                // "30",
                                                // style: TextStyle(
                                                //     fontSize: 15),),
                                          //),
                                          // ),
                                          //children: <Widget>[
                                          SizedBox(height: 40,),


                                          Text('Nest 1'),
                                          SizedBox(height: 5,),
                                          // SvgPicture.asset(
                                          //   'assets/pict/Group 32.svg',),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      //SizedBox(height: 10,),

                                      Text('Air Humidity'),

                                      SvgPicture.asset(
                                        'assets/pict/rectangle.svg',
                                        height: 7,),

                                      Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle
                                        ),

                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height: 34,),

                                            Obx(() =>
                                                Text(
                                                    humidity.humidity.string),
                                            ),
                                            //),

                                            //children: <Widget>[

                                            //SvgPicture.asset(
                                              //'assets/pict/Group 37.svg',),


                                            SizedBox(height: 40,),

                                            Text('Nest 1'),
                                            SizedBox(height: 5,),
                                            // SvgPicture.asset(
                                            //   'assets/pict/Group 32.svg',),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                        Container(
                          height: 200,
                          //width: 00,
                          child: Column(

                            //mainAxisSpacing: 3,
                            //crossAxisSpacing: 3,
                            //primary: false,
                            //crossAxisCount: 1,
                            children: <Widget>[

                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 25),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //SizedBox(height: 10,),

                                      Text('Air Quality'),
                                    SizedBox(height: 20,),
                                    Column(
                                    children: <Widget>[
                                      SizedBox(height: 25,),
                                      Obx(() =>
                                          Text(
                                              airquality.airquality.string),
                                      ),

                                      SvgPicture.asset(
                                        'assets/pict/rectangle.svg',
                                        height: 16,),
                                      // SvgPicture.asset(
                                      //   'assets/pict/Group 39.svg',),
                                      SizedBox(height: 27,),

                                      Text('Nest 1'),
                                      SizedBox(height: 5,),
                                      // SvgPicture.asset(
                                      //   'assets/pict/Group 32.svg',),


                                    ],
                                  ),
                                  ],
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(height: 50,),
                              SvgPicture.asset(
                                'assets/pict2/mdi_fan.svg',),
                              SizedBox(width: 15,),
                              SvgPicture.asset(
                                'assets/pict2/Fannn.svg',),
                              SizedBox(width: 150,),
                              // LiteRollingSwitch(
                              //   //initial value
                              //   value: false,
                              //   textOn: 'On',
                              //   textOff: 'Off',
                              //   colorOn: Colors.greenAccent[700],
                              //   colorOff: Colors.redAccent[700],
                              //   iconOn: Icons.done,
                              //   iconOff: Icons.remove_circle_outline,
                              //   textSize: 15.0,
                              //   onChanged: (bool state) {
                              //     //Use it to manage the different states
                              //     print('Current State of SWITCH IS: $state');
                              //   },
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 35,),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(height: 50,),
                              SvgPicture.asset(
                                'assets/pict2/fan.svg',),
                              SizedBox(width: 15,),
                              SvgPicture.asset(
                                'assets/pict2/Mist Maker.svg',),
                              SizedBox(width: 90,),
                              // LiteRollingSwitch(
                              //   //initial value
                              //   value: false,
                              //   textOn: 'On',
                              //   textOff: 'Off',
                              //   colorOn: Colors.greenAccent[700],
                              //   colorOff: Colors.redAccent[700],
                              //   iconOn: Icons.done,
                              //   iconOff: Icons.remove_circle_outline,
                              //   textSize: 15.0,
                              //   onChanged: (bool state) {
                              //
                              //     // Fan: Set.from(controller.),
                              //     // controller.,
                              //     // FanController.();
                              //     //Use it to manage the different states
                              //     print('Current State of SWITCH IS: $state');
                              //   },
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),

                        Container(
                          child: Row(
                            //mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //SizedBox(width: 110,),
                              SizedBox(height: 100,),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(HomeView());
                                },
                                child: SvgPicture.asset(
                                  'assets/pict/bx_bx-home-alt.svg',),
                              ),


                              SizedBox(width: 30,),

                              ElevatedButton(
                                onPressed: () {
                                  Get.to(NestView());
                                },
                                child: SvgPicture.asset(
                                  'assets/pict1/ic_baseline-fiber-smart-record.svg',),
                              ),

                              SizedBox(width: 30,),

                              ElevatedButton(
                                onPressed: () {
                                  Get.to(ProfileView());
                                },
                                child: SvgPicture.asset(
                                  'assets/pict/Vector.svg',),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }


  Future<void> writeData() async {
    //dbRef.child("FirebaseIOT2").set({"switch": value});
    //dbRef.child("FirebaseIOT").set({"led": value});
  }
}
