import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:protel_1/app/modules/nested/controllers/nested_controller.dart';

class NestedView extends GetView<NestedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                SizedBox(height: 70,),
                SvgPicture.asset(
                  'assets/pict1/Frame 4.svg',),
                SvgPicture.asset(
                  'assets/pict3/eva_arrow-ios-back-outline.svg',),
                SvgPicture.asset(
                  'assets/pict1/Fan.svg',),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/pict3/Nest 1.svg',),

                    SvgPicture.asset(
                      'assets/pict1/bx_bx-home-alt.svg',),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}