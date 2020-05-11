import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../values/values.dart';

class MapPage extends StatefulWidget {
  static String id = "MapPage";
  String token;
  MapPage(this.token);

  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Set<Polyline> lines = {};
  Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor receiverIcon, droneIcon;

  @override
  void initState() {
    super.initState();
    // setCustomMapPin();

    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            'assets/pin_red_tracker.png')
        .then((onValue) {
      receiverIcon = onValue;
    });
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'assets/drones.png')
        .then((onValue) {
      droneIcon = onValue;
    });
  }

  // double currentLongitude = 0;
  // double currentLatitude = 0;

  // void getCurrentLocation() async {
  //   Position currentLocator = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  //   if (mounted) {
  //     setState(
  //       () {
  //         currentLatitude = currentLocator.latitude;
  //         currentLongitude = currentLocator.longitude;
  //         print("Latitude: $currentLocator \nLongitude: $currentLongitude");
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 14,
            child: StreamBuilder(
              // DocumentSnapshot snapshot= await Firestore.instance.collection('channels').document('567890').
              stream: Firestore.instance
                  .collection('transports')
                  .document(widget.token)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Image.asset("assets/no_internet_connection.png");
                } else if (snapshot.data['DroneLatLng'] != null &&
                    snapshot.data['ReceiverLatLng'] != null &&
                    snapshot.data['SenderLatLng'] != null) {
                  GeoPoint droneLatLng = snapshot.data['DroneLatLng'];
                  GeoPoint receiverLatLng = snapshot.data['ReceiverLatLng'];
                  GeoPoint senderLatLng = snapshot.data['SenderLatLng'];
                  Future<void> changeCameraPosition() async {
                    final GoogleMapController controller =
                        await _controller.future;
                    controller.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(
                            droneLatLng.latitude,
                            droneLatLng.longitude,
                          ),
                          zoom: 13),
                    ));
                  }

                  changeCameraPosition();
                  return MaterialApp(
                    title: 'Google Maps Polylines',
                    home: Scaffold(
                      body: GoogleMap(
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        markers: {
                          Marker(
                              markerId: MarkerId('Drone Marker'),
                              position: LatLng(
                                droneLatLng.latitude,
                                droneLatLng.longitude,
                              ),
                              icon: droneIcon),
                          Marker(
                              markerId: MarkerId('Receiver Marker'),
                              position: LatLng(
                                senderLatLng.latitude,
                                senderLatLng.longitude,
                              ),
                              icon: receiverIcon),
                        },
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                              droneLatLng.latitude, //0 for drone
                              droneLatLng.longitude,
                            ),
                            zoom: 13),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },

                        // onCameraMoveStarted: () => changeCameraPosition(),
                        polylines: {
                          Polyline(
                            points: [
                              LatLng(
                                receiverLatLng.latitude,
                                receiverLatLng.longitude,
                              ),
                              LatLng(
                                senderLatLng.latitude, //0 for drone
                                senderLatLng.longitude,
                              ),
                              LatLng(
                                droneLatLng.latitude, //0 for drone
                                droneLatLng.longitude,
                              ),
                            ],
                            color: Colors.blueGrey,
                            polylineId: PolylineId("line_one"),
                          ),
                        },
                      ),
                    ),
                  );
                } else {
                  return Scaffold(
                    body: Container(
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 254,
                            height: 270,
                            margin: EdgeInsets.only(top: 136),
                            child: Image.asset(
                              "assets/images/wait-sand.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 47),
                            child: Text(
                              "Waiting Drone to\n Arrive to Sender",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                // try {
                //   var droneLatLng = snapshot.data.documents[0];
                //   var gotoLATLNG = snapshot.data.documents[1];
                //   var senderLatLng = snapshot.data.documents[2];
                // } catch (exception) {
                //   return Image.asset("assets/no_internet_connection.png");
                // }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              color: Color(0xFF63F09C),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Time To Arrive",
                      ),
                      Text("Destination")
                    ],
                  ),
                  CountDown(
                    seconds: 124,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              //add action on tap
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8, left: 16, right: 16),
                  child: Text(
                    "Cancel",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
