import 'dart:async';

import 'package:cvs_mobile_application/APIs/AuthAPIs.dart';
import 'package:cvs_mobile_application/Config.dart';
import 'package:cvs_mobile_application/Models/UserModel.dart';
import 'package:cvs_mobile_application/email_verification.dart';
import 'package:cvs_mobile_application/terns_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/places.dart';

import 'loginScreen.dart';

class MapScreeen extends StatefulWidget {
  final user;
  const MapScreeen({Key? key, required this.user}) : super(key: key);

  @override
  State<MapScreeen> createState() => _MapScreeenState();
}

class _MapScreeenState extends State<MapScreeen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController ResultController = TextEditingController();

  final Completer<GoogleMapController> _controllerGooglrMap = Completer();
  late GoogleMapController newgoogleMapController;
  late Position currentPosition;
  double bottempadding = 0.0;
  Set<Marker> markerSet = {};
  UserModel userModel = UserModel();

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
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng latLngPosition =
          LatLng(currentPosition.latitude, currentPosition.longitude);
      CameraPosition cameraPosition =
          new CameraPosition(target: latLngPosition, zoom: 14);
      newgoogleMapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {
        markerSet.add(Marker(
          markerId: MarkerId("myMarker"),
          position: latLngPosition,
          infoWindow: InfoWindow(title: "My Location"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ));
      });
    }
  }

  //Initial Location
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    Prediction place;
    userModel = widget.user;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: 250.0),
            child: GoogleMap(
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
              markers: markerSet,
              onMapCreated: (GoogleMapController Controller) {
                _controllerGooglrMap.complete(Controller);
                newgoogleMapController = Controller;
                locatePosition();
                setState(() {
                  bottempadding = 300.0;
                });
              },
            ),
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
                          onTap: () async => {
                                place = (await PlacesAutocomplete.show(
                                    context: context,
                                    apiKey: mapKey,
                                    mode: Mode.overlay,
                                    types: [],
                                    strictbounds: false,
                                    logo: Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Select Location",
                                              style: TextStyle(
                                                  fontFamily: 'Avenir Roman',
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(
                                              Icons.location_on,
                                              color:
                                                  Color.fromRGBO(5, 129, 98, 1),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    components: [
                                      Component(Component.country, 'pk')
                                    ],

                                    //google_map_webservice package
                                    onError: (err) {
                                      print(err);
                                    }))!,
                                if (place != null)
                                  {
                                    ResultController.text =
                                        place.description.toString(),
                                    findPlaces(place),
                                  },
                              },
                          controller: searchController,
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
                          controller: ResultController,
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
                            hintText: ResultController.text,
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
                        var response = AuthAPIs()
                            .signup('/mechanic/signup', userModel)
                            .then((value) => {
                                  if (value['status'] == "Success")
                                    {
                                      Fluttertoast.showToast(
                                          msg: value['message']),
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  Terms_Condition())),
                                    }
                                  else
                                    {
                                      Fluttertoast.showToast(
                                          msg: value['message'])
                                    }
                                })
                            .catchError((err) {
                          print(err);
                        });
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

  Future<LatLng> findPlaces(Prediction place) async {
    //form google_maps_webservice package
    final plist = GoogleMapsPlaces(
      apiKey: mapKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
      //from google_api_headers package
    );
    String placeid = place.placeId.toString();
    final detail = await plist.getDetailsByPlaceId(placeid);
    final geometry = detail.result.geometry!;
    final lat = geometry.location.lat;
    final lang = geometry.location.lng;
    var newlatlang = LatLng(lat, lang);
    var shopName = detail.result.name;
    newgoogleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: newlatlang, zoom: 17)));
    // ignore: prefer_collection_literals
    Set<Marker> newmarker = Set<Marker>.of(
      <Marker>[
        Marker(
          draggable: true,
          onDragEnd: (newPosition) {
            markerDragEnd(newPosition);
          },
          markerId: const MarkerId("1"),
          position: newlatlang,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: const InfoWindow(
            title: 'Pick Location',
          ),
        )
      ],
    );
    setState(() {
      userModel.shopName = shopName;
      userModel.shopAddressLat = lat.toString();
      userModel.shopAddressLong = lang.toString();
      searchController.text = place.description.toString();
      markerSet = newmarker;
    });
    return newlatlang;
  }

  void markerDragEnd(LatLng newPosition) async {
    var newlatlang = LatLng(newPosition.latitude, newPosition.longitude);
    newgoogleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: newlatlang, zoom: 17)));
    setState(() {
      // ignore: prefer_collection_literals
      markerSet = Set<Marker>.of(
        <Marker>[
          Marker(
            draggable: true,
            onDragEnd: (newPosition) {
              setState(() {
                userModel.shopAddressLat = newPosition.latitude.toString();
                userModel.shopAddressLong = newPosition.longitude.toString();
              });
              markerDragEnd(newPosition);
            },
            markerId: MarkerId("1"),
            position: LatLng(newPosition.latitude, newPosition.longitude),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: const InfoWindow(
              title: 'Pick Location',
            ),
          )
        ],
      );
    });
  }
}
//  Container(
//                           height: 70.0,
//                           width: 70.0,
//                           decoration: BoxDecoration(
//                             color: const Color(0xfff7f4f8),
//                             borderRadius: BorderRadius.circular(50),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 spreadRadius: 1,
//                                 blurRadius: 10,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: const Icon(Icons.camera_alt,
//                               color: Colors.green, size: 35)),