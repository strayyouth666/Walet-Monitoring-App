import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protel_1/Constants.dart';
import 'package:protel_1/app/modules/auth/views/auth_view.dart';
import 'package:protel_1/app/modules/home/views/home_view.dart';
//import 'package:protel_1/app/routes/app_pages.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          // child: Container(
          //   decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(50.0),
          // ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(height: 67,),
                        SizedBox(width: 168,),
                        Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
                        SizedBox(height: 50,),
                        SizedBox(width: 22,),
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 22,),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://www.shareicon.net/data/512x512/2016/08/18/814068_face_512x512.png'),
                                    radius: 30,
                                  ),

                                  SizedBox(width: 20,),

                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(height: 20,),
                                        Row(
                                          children: [
                                            Text('Farhan Fatur', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(height: 20,),
                                        SizedBox(width: 5,),
                                        Row(
                                          children: [
                                            // SizedBox(width: 30,),
                                            // Text('farhanfatur@gmail.com', style: TextStyle(fontSize: 15, color: Colors.black),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SvgPicture.asset(
                                    'assets/pict1/Frame 4.svg', height: 15,),

                                ],
                              ),

                            ],
                          ),

                        ),
                      ],
                    ),

                  ),


                  SizedBox(height: 42,),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 30,),
                        SvgPicture.asset(
                          'assets/pict1/Dashboard.svg', height: 15,),


                      ],
                    ),

                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 60,),
                            SizedBox(width: 50,),
                            //mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            SvgPicture.asset(
                              'assets/pict1/ic_baseline-fiber-smart-record.svg',),
                            SizedBox(width: 20,),
                            SvgPicture.asset(
                              'assets/pict1/Connected Nest.svg',),
                            SizedBox(width: 60,),
                            SvgPicture.asset(
                              'assets/pict1/2.svg',),
                            SizedBox(width: 20,),
                            SvgPicture.asset(
                              'assets/pict1/ic_round-navigate-next.svg',),


                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 10,),
                            SizedBox(width: 50,),
                            SvgPicture.asset(
                              'assets/pict1/info.svg',),
                            SizedBox(width: 27,),
                            SvgPicture.asset(
                              'assets/pict1/Privacy.svg',),
                            SizedBox(width: 203,),
                            SvgPicture.asset(
                              'assets/pict1/ic_round-navigate-next.svg',),


                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Column(
                          children: [

                            //mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,

                            // SvgPicture.asset(
                            // 'assets/pict1/Dashboard.svg', height: 16,),
                            SizedBox(height: 40,),

                            // SvgPicture.asset(
                            //   'assets/pict1/Switch Account.svg', height: 16,),

                            SizedBox(width: 140,),
                            // TextButton(
                            //   onPressed: () {},
                            //   child: Text("Switch Account", style: TextStyle(
                            //   color: Colors.lightBlue.shade600,
                            //   fontSize: 20,
                            //   fontWeight: FontWeight.w900,
                            // ),
                            // ),
                            // ),

                            TextButton(
                              onPressed: ()  {
                                authController.signOut();
                                Get.to(AuthView());
                              },
                              child: Text("Log Out", style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              ),
                            ),


                            // ElevatedButton(
                            //   onPressed: () {
                            //     Get.to(AuthView());
                            //   },
                            //   child: SvgPicture.asset(
                            //     'assets/pict1/Logout.svg', height: 16,),
                            // ),


                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox (height: 330,),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(HomeView());
                    },
                    child: SvgPicture.asset(
                      'assets/pict/bx_bx-home-alt.svg',),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
