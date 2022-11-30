import 'dart:async';

import 'package:cvs_mobile_application/terns_condition.dart';
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
        padding: EdgeInsets.all(0.0),
        child: Stack(children: [
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
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 255, 255, 0)
                ])),
            height: 500,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onDoubleTap: () {
                              Navigator.pop(context);
                            },
                            child: Image(
                              image: AssetImage('assets/images/backarrow.png'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Store ",
                            style: TextStyle(
                                fontFamily: 'Avenir Roman',
                                fontSize: 32,
                                color: Colors.black),
                          ),
                          Text(
                            "Setup!",
                            style: TextStyle(
                                fontFamily: 'Avenir Roman',
                                fontSize: 32,
                                color: Color.fromRGBO(43, 147, 72, 1)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 26,
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
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(5, 129, 98, 1))),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          cursorColor: Colors.lightGreen,
                          keyboardType: TextInputType.name,
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.my_location,
                              color: Color.fromRGBO(5, 129, 98, 1),
                            ),
                            prefixIcon: Icon(
                              Icons.location_pin,
                              color: Color.fromRGBO(5, 129, 98, 1),
                            ),
                            hintText: 'Ripple Berry',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(5, 129, 98, 1))),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 148.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.topCenter,
                        colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(255, 255, 255, 0)
                    ])),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(children: [
                    Image(
                      image: AssetImage('assets/images/step2_2.png'),
                    ),
                    SizedBox(
                      width: 60.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => Terms_Condition()));
                      },
                      child: Image(
                        image: AssetImage('assets/images/store_button.png'),
                      ),
                    ),
                  ]),
                ),
              ))
        ]),
      ),
    );
  }
}
