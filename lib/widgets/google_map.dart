import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protel_1/app/modules/nest/controllers/nest_controller.dart';



// part of nest_view;


class Gmap extends StatelessWidget {
  const Gmap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NestController>(builder: (_) {
      return GoogleMap(
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _.mapCenter,
          zoom: 12,
        ),
        onMapCreated: _.onMapCreated,
        // onCameraMove: _.onCameraMove,
        // onTap: _.onMapTap,
        // markers: _.markers,
      );
    });
  }
}