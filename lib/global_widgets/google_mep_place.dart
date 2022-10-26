
import 'package:google_maps_flutter/google_maps_flutter.dart';
// Note : photo video app bar worked diffrently
GoogleMap Googlemep1(controller) =>
    GoogleMap(
      onMapCreated: controller.onMapCreated,
      initialCameraPosition: CameraPosition(
        target: controller.lastMapPosition,
        zoom: 11.0,
      ),
      mapType: controller.currentMapType,
      markers: controller.place_markers,
      onCameraMove: controller.onCameraMove,
    );


