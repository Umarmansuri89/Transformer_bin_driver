
import 'package:google_maps_flutter/google_maps_flutter.dart';
// Note : photo video app bar worked diffrently
GoogleMap Googlemep(controller) =>
    GoogleMap( //Map widget from google_maps_flutter package
      zoomGesturesEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,

      //enable Zoom in, out on map
      initialCameraPosition: CameraPosition( //innital position in map
        target: controller.startLocation, //initial position
        zoom: 14.0, //initial zoom level
      ),
     // markers: controller.markers1,
      markers: Set<Marker>.from(controller.markers),
      //markers to show on map
      polylines: Set<Polyline>.of(controller.polylines.values), //polylines
      mapType: MapType.normal, //map type
      onMapCreated: (controller1) { //method called when map is created
        controller.mapController = controller1;
      },
    );
