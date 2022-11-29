import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreeen extends StatefulWidget {
  const MapScreeen({Key? key}) : super(key: key);

  @override
  State<MapScreeen> createState() => _MapScreeenState();
}

class _MapScreeenState extends State<MapScreeen> {
  final Completer<GoogleMapController> _controllerGooglrMap = Completer();
  late GoogleMapController newgoogleMapController;
  late Position currentPosition;
  double bottempadding = 0.0;

  void locatePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

// Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        FlutterError("Location is not Enabled");
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLatposition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatposition, zoom: 14);
    newgoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  //Initial Location
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Stack(children: [
          SizedBox(
            height: 392,
            width: 360,
            child: Column(
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/backarrow.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.0,
                ),
                TextFormField(
                    cursorColor: Colors.lightGreen,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Store Name',
                      labelStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Outfit',
                          color: Colors.green),
                      hintText: 'Search  Store ',
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(5, 129, 98, 1))),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    )),
              ],
            ),
          ),
          GoogleMap(
            myLocationEnabled: true,
            padding: EdgeInsets.only(bottom: bottempadding),
            mapType: MapType.normal,
            compassEnabled: true,
            mapToolbarEnabled: true,
            tiltGesturesEnabled: false,
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: (GoogleMapController Controller) {
              _controllerGooglrMap.complete(Controller);
              newgoogleMapController = Controller;
              locatePosition();
              setState(() {
                bottempadding = 300.0;
              });
            },
          ),
        ]),
      ),
    );
  }
}