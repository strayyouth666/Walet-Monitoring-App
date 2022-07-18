library nest_view;

// import 'dart:async';
// import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:protel_1/app/modules/home/views/home_view.dart';
import 'package:protel_1/app/modules/profile/views/profile_view.dart';
// import '../../../../Constants.dart';
import '../controllers/nest_controller.dart';

// part '/widgets/map_tools.dart';



class NestView extends StatelessWidget {
  // final Set<Marker> _markers = {};
  final LatLng _currentPosition = LatLng(3.595196, 98.672226);
  // late final ArgumentCallback<LatLng> onTap;
  final NestController controller = Get.put(NestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
        Container(
          child: Obx(() =>
            GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: CameraPosition(
                    target: _currentPosition,
                    zoom: 14.0,
                  ),
                markers: Set.from(controller.myMarker),
                onTap:  controller.handleTap,
                ),
                ),
                ),
        // Positioned(
        // top: 30.0,
        // right: 15.0,
        // left: 15.0,
        // child:
        //   Container(
        //     height: 50.0,
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10.0),
        //         color: Colors.white
        // ),
        //     child:  Obx(() =>
        //       TextField(
        //       decoration: InputDecoration(
        //         hintText: 'Enter Address',
        //         border: InputBorder.none,
        //         contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
        //         suffixIcon: IconButton(
        //           icon: Icon(Icons.search),
        //
        //           onPressed: () {
        //             controller.;
        //           }
        //             iconSize: 30.0,
        //             ),
        //             ),
        //             ),
        //             ),
        //             ),
        //             ),
                    Column(
                    // mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                    //SizedBox(width: 1000,),
                    SizedBox(height: 200,),


                    Container(
                    child:
                    Padding(
                    padding: const EdgeInsets.all(10.0),
                    // child: SvgPicture.asset(
                    //   'assets/pict1/search.svg',),
                    ),
                    ),
                    SizedBox(height: 300,),
                    Container(
                    child: Row(
                    children: [
                    Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    SizedBox(width: 30,),
                          SizedBox(height: 30,),
                          // SvgPicture.asset(
                          //   'assets/pict1/Your Nest.svg',),
                          // SizedBox(width: 200,),
                          //
                          // SvgPicture.asset(
                          //   'assets/pict/plusbut.svg',),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  // children: [
                    // SvgPicture.asset(
                    //   'assets/pict1/nest1.svg',),
                    // SvgPicture.asset(
                    //   'assets/pict1/nest2.svg',),
                  // ],
                ),
              ),


              //Text('Nestt', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
              // Padding(
              // padding: const EdgeInsets.all(8.0),
              // child: Text(
              //   "70%", //test data
              //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              // ),


              SizedBox(height: 150,),
              Container(
                child: Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //SizedBox(width: 110,),
                    //SizedBox(height: 100,),
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
    ],
    ),
      );

  }




}



//
// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }
//
// class MapSampleState extends State<MapSample> {
//   Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('find your cage!'),
//         icon: Icon(Icons.directions),
//       ),
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
