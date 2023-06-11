import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;

  // Location coordinates
  final LatLng targetLocation = LatLng(37.422, 122.084);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: false,
        title: Text('Map Page'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: targetLocation,
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: {
          Marker(
            markerId: MarkerId('targetMarker'),
            position: targetLocation,
            infoWindow: InfoWindow(
              title: 'Target Location',
              snippet: 'This is the location I provided',
            ),
          ),
        },
      ),
    );
  }
}
