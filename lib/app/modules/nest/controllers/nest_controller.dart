// import 'dart:html';
// import 'package:geocoder/geocoder.dart';
// import 'dart:html';
library my_lib;

import 'dart:ffi';

// import 'package:geocoder/geocoder.dart';
// import 'package:geocoder/services/base.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protel_1/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:protel_1/mixin/place_marker.dart';
import 'package:protel_1/mixin/point.dart';
import 'package:rxdart/rxdart.dart';



class NestController extends GetxController with Point {
  static NestController instance = Get.find();

  // var latitude = 'Getting Latitude..'.obs;
  // var longitude = 'Getting Longitude..'.obs;
  // var address = 'Getting Address..'.obs;
  late StreamSubscription<Position> streamSubscription;

  // List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);

  // final LatLng _currentPosition = LatLng(3.595196, 98.672226);
  late final ArgumentCallback<LatLng> onTap;

  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng mapCenter = LatLng(22.52898852325926, 113.83500415831804);
  GoogleMapController? mapController;
  List<Marker> myMarker = RxList([]);
  //List<Address> address = RxList([]);

  // String address = "";
  // String value = "";



  @override
  void onInit() {
    super.onInit();

    // getLocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription.cancel();
  }

  void onMapCreated(GoogleMapController googleMapController) {
    mapController = googleMapController;
  }


  handleTap(LatLng tappedPoint) {
    print(tappedPoint);
    myMarker.add(
        Marker(
            markerId: MarkerId(tappedPoint.toString()),
            position: tappedPoint,
            draggable: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue),
            onDragEnd: (dragEndPosition) {
              print(dragEndPosition);
            }
        ));
  }
  // searchandNavigate() {
  //   Geocoding().locationFromAddress(searchAddr).then((result){
  //     mapController!.animateCamera(CameraUpdate.newCameraPosition(
  //      target:
  //      LatLng(result[0].position.latitude,result[0].position.longitude),
  //       zoom: 10.0)));
  //   });
  //   }



// void showMap({title, latitude, longitude}) async {
//   try {
//     final description = "asia";
//     final coords = Coords(latitude, longitude);
//     final availableMaps = await MapLauncher.installedMaps;
//     showModalBottomSheet(
//       context: Get.context!,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: SingleChildScrollView(
//             child: Container(
//               child: Wrap(
//                 children: [
//                   for (var map in availableMaps)
//                     ListTile(
//                       onTap: () => map.showMarker(
//                         coords: coords,
//                         title: title,
//                         description: description,
//                       ),
//                       title: Text(map.mapName),
//                       leading: SvgPicture.asset(
//                         map.icon,
//                         height: 30.0,
//                         width: 30.0,
//                       ),
//                     )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   } catch (e) {
//     print(e);
//   }
// }


  // getLocation() async {
  //   bool serviceEnabled;
  //
  //   LocationPermission permission;
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     await Geolocator.openLocationSettings();
  //     return Future.error('Location services are disabled.');
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   streamSubscription =
  //       Geolocator.getPositionStream().listen((Position position) {
  //         latitude.value = 'Latitude : ${position.latitude}';
  //         longitude.value = 'Longitude : ${position.longitude}';
  //         getAddressFromLatLang(position);
  //       });
  // }
  //
  //
  // Future<void> getAddressFromLatLang(Position position) async {
  //   List<Placemark> placemark =
  //   await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark place = placemark[0];
  //   address = 'Address : ${place.locality},${place.country}';
  //
  // }
}

