import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protel_1/app/modules/nest/controllers/nest_controller.dart';

// import 'page.dart';
abstract class GoogleMapExampleAppPage extends StatelessWidget {
  const GoogleMapExampleAppPage(this.leading, this.title);

  final Widget leading;
  final String title;
}
class PlaceMarkerPage extends GoogleMapExampleAppPage {
  PlaceMarkerPage() :  super (const Icon(Icons.place), 'Place marker');

  @override
  Widget build(BuildContext context) {
    return const PlaceMarkerBody();
  }
}

class PlaceMarkerBody extends StatefulWidget {
  const PlaceMarkerBody();

  @override
  State<StatefulWidget> createState() => PlaceMarkerBodyState();
}

typedef MarkerUpdateAction = Marker Function(Marker marker);

class PlaceMarkerBodyState extends State<PlaceMarkerBody> {
  PlaceMarkerBodyState();
  static final LatLng center = const LatLng(-33.86711, 151.1947171);

  GoogleMapController? controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  int _markerIdCounter = 1;
  LatLng? markerPosition;

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        final MarkerId? previousMarkerId = selectedMarker;
        if (previousMarkerId != null && markers.containsKey(previousMarkerId)) {
          final Marker resetOld = markers[previousMarkerId]!
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[previousMarkerId] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        markers[markerId] = newMarker;

        markerPosition = null;
      });
    }
  }

  void _onMarkerDrag(MarkerId markerId, LatLng newPosition) async {
    setState(() {
      this.markerPosition = newPosition;
    });
  }

  void _onMarkerDragEnd(MarkerId markerId, LatLng newPosition) async {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        this.markerPosition = null;
      });
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
                content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 66),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Old position: ${tappedMarker.position}'),
                        Text('New position: $newPosition'),
                      ],
                    )));
          });
    }
  }

  void _add() {
    final int markerCount = markers.length;

    if (markerCount == 12) {
      return;
    }

    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        center.latitude + sin(_markerIdCounter * pi / 6.0) / 20.0,
        center.longitude + cos(_markerIdCounter * pi / 6.0) / 20.0,
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () => _onMarkerTapped(markerId),
      onDragEnd: (LatLng position) => _onMarkerDragEnd(markerId, position),
      onDrag: (LatLng position) => _onMarkerDrag(markerId, position),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  void _remove(MarkerId markerId) {
    setState(() {
      if (markers.containsKey(markerId)) {
        markers.remove(markerId);
      }
    });
  }

  void _changePosition(MarkerId markerId) {
    final Marker marker = markers[markerId]!;
    final LatLng current = marker.position;
    final Offset offset = Offset(
      center.latitude - current.latitude,
      center.longitude - current.longitude,
    );
    setState(() {
      markers[markerId] = marker.copyWith(
        positionParam: LatLng(
          center.latitude + offset.dy,
          center.longitude + offset.dx,
        ),
      );
    });
  }

  void _changeAnchor(MarkerId markerId) {
    final Marker marker = markers[markerId]!;
    final Offset currentAnchor = marker.anchor;
    final Offset newAnchor = Offset(1.0 - currentAnchor.dy, currentAnchor.dx);
    setState(() {
      markers[markerId] = marker.copyWith(
        anchorParam: newAnchor,
      );
    });
  }

  Future<void> _changeInfoAnchor(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final Offset currentAnchor = marker.infoWindow.anchor;
    final Offset newAnchor = Offset(1.0 - currentAnchor.dy, currentAnchor.dx);
    setState(() {
      markers[markerId] = marker.copyWith(
        infoWindowParam: marker.infoWindow.copyWith(
          anchorParam: newAnchor,
        ),
      );
    });
  }

  Future<void> _toggleDraggable(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    setState(() {
      markers[markerId] = marker.copyWith(
        draggableParam: !marker.draggable,
      );
    });
  }

  Future<void> _toggleFlat(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    setState(() {
      markers[markerId] = marker.copyWith(
        flatParam: !marker.flat,
      );
    });
  }

  Future<void> _changeInfo(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final String newSnippet = marker.infoWindow.snippet! + '*';
    setState(() {
      markers[markerId] = marker.copyWith(
        infoWindowParam: marker.infoWindow.copyWith(
          snippetParam: newSnippet,
        ),
      );
    });
  }

  Future<void> _changeAlpha(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final double current = marker.alpha;
    setState(() {
      markers[markerId] = marker.copyWith(
        alphaParam: current < 0.1 ? 1.0 : current * 0.75,
      );
    });
  }

  Future<void> _changeRotation(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final double current = marker.rotation;
    setState(() {
      markers[markerId] = marker.copyWith(
        rotationParam: current == 330.0 ? 0.0 : current + 30.0,
      );
    });
  }

  Future<void> _toggleVisible(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    setState(() {
      markers[markerId] = marker.copyWith(
        visibleParam: !marker.visible,
      );
    });
  }

  Future<void> _changeZIndex(MarkerId markerId) async {
    final Marker marker = markers[markerId]!;
    final double current = marker.zIndex;
    setState(() {
      markers[markerId] = marker.copyWith(
        zIndexParam: current == 12.0 ? 0.0 : current + 1.0,
      );
    });
  }

  void _setMarkerIcon(MarkerId markerId, BitmapDescriptor assetIcon) {
    final Marker marker = markers[markerId]!;
    setState(() {
      markers[markerId] = marker.copyWith(
        iconParam: assetIcon,
      );
    });
  }

  Future<BitmapDescriptor> _getAssetIcon(BuildContext context) async {
    final Completer<BitmapDescriptor> bitmapIcon =
    Completer<BitmapDescriptor>();
    final ImageConfiguration config = createLocalImageConfiguration(context);

    const AssetImage('assets/red_square.png')
        .resolve(config)
        .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
      final ByteData? bytes =
      await image.image.toByteData(format: ImageByteFormat.png);
      if (bytes == null) {
        bitmapIcon.completeError(Exception('Unable to encode icon'));
        return;
      }
      final BitmapDescriptor bitmap =
      BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
      bitmapIcon.complete(bitmap);
    }));

    return await bitmapIcon.future;
  }

  @override
  Widget build(BuildContext context) {
    final MarkerId? selectedId = selectedMarker;
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(-33.852, 151.211),
                zoom: 11.0,
              ),
              markers: Set<Marker>.of(markers.values),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                child: const Text('Add'),
                onPressed: _add,
              ),
              TextButton(
                child: const Text('Remove'),
                onPressed:
                selectedId == null ? null : () => _remove(selectedId),
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                child: const Text('change info'),
                onPressed:
                selectedId == null ? null : () => _changeInfo(selectedId),
              ),
              TextButton(
                child: const Text('change info anchor'),
                onPressed: selectedId == null
                    ? null
                    : () => _changeInfoAnchor(selectedId),
              ),
              TextButton(
                child: const Text('change alpha'),
                onPressed:
                selectedId == null ? null : () => _changeAlpha(selectedId),
              ),
              TextButton(
                child: const Text('change anchor'),
                onPressed:
                selectedId == null ? null : () => _changeAnchor(selectedId),
              ),
              TextButton(
                child: const Text('toggle draggable'),
                onPressed: selectedId == null
                    ? null
                    : () => _toggleDraggable(selectedId),
              ),
              TextButton(
                child: const Text('toggle flat'),
                onPressed:
                selectedId == null ? null : () => _toggleFlat(selectedId),
              ),
              TextButton(
                child: const Text('change position'),
                onPressed: selectedId == null
                    ? null
                    : () => _changePosition(selectedId),
              ),
              TextButton(
                child: const Text('change rotation'),
                onPressed: selectedId == null
                    ? null
                    : () => _changeRotation(selectedId),
              ),
              TextButton(
                child: const Text('toggle visible'),
                onPressed: selectedId == null
                    ? null
                    : () => _toggleVisible(selectedId),
              ),
              TextButton(
                child: const Text('change zIndex'),
                onPressed:
                selectedId == null ? null : () => _changeZIndex(selectedId),
              ),
              TextButton(
                child: const Text('set marker icon'),
                onPressed: selectedId == null
                    ? null
                    : () {
                  _getAssetIcon(context).then(
                        (BitmapDescriptor icon) {
                      _setMarkerIcon(selectedId, icon);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
      Visibility(
        visible: markerPosition != null,
        child: Container(
          color: Colors.white70,
          height: 30,
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              markerPosition == null
                  ? Container()
                  : Expanded(child: Text("lat: ${markerPosition!.latitude}")),
              markerPosition == null
                  ? Container()
                  : Expanded(child: Text("lng: ${markerPosition!.longitude}")),
            ],
          ),
        ),
      ),
    ]);
  }
}