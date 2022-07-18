import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protel_1/app/modules/auth/views/auth_view.dart';
import 'package:protel_1/app/modules/home/views/home_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightGreen,
      ),

      extendBodyBehindAppBar: true,
      body: SizedBox(
        // children: <Widget>[

        child: Container(
          // height: MediaQuery.of(context).size.height /2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                //alignment: Alignment.topCenter,
                image: AssetImage('assets/pict/Rectangle 12.png',),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 450,),

                SvgPicture.asset(
                  'assets/pict/Hello!.svg',),

                SizedBox(height: 10,),

                SvgPicture.asset(
                  'assets/pict/Swallow bird will come to your nest, and enjoy the goodness_)).svg',),

                SizedBox(height: 100,),
                SizedBox(width: 3000,),
                ElevatedButton(
                  onPressed: () {
                    Get.to(AuthView());
                  },
                  child: SvgPicture.asset(
                    'assets/pict/Group 1.svg',),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
