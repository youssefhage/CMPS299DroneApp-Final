/*
*  inital_screen_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone_transportation/Core/crud.dart';
import 'package:drone_transportation/Core/firebase.dart';
import 'package:drone_transportation/screens/enter_token_r2_widget.dart';
import 'package:drone_transportation/screens/send_package_s2_widget.dart';
import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

dynamic token;

class InitalScreenWidget extends StatelessWidget {
  void onGroup5Pressed(BuildContext context, dynamic tk) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SendPackageS2Widget(
                token: tk,
              )));

  void onGroup3Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => EnterTokenR2Widget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Container(
              width: 292,
              height: 60,
              margin: EdgeInsets.only(top: 319),
              child: FlatButton(
                onPressed: () async {
                  try {
                    Position position = await Geolocator().getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.bestForNavigation);

                    CloudData clData = CloudData(
                      senderLatLng:
                          GeoPoint(position.latitude, position.longitude),
                      tokenInserted: false,
                      unloadPackage: false,
                      loadPackage: false,
                      droneInMotion: false,
                      token: token,
                    );
                    addCloudData(clData);
                    token = await FBoperations.createRecord(clData);
                    // print(token);
                    if (token != null) {
                      onGroup5Pressed(context, token);
                      // print(token);
                    }
                  } catch (exception) {
                    return exception;
                  }
                },
                color: AppColors.primaryElement,
                shape: RoundedRectangleBorder(
                  side: Borders.primaryBorder,
                  borderRadius: Radii.k30pxRadius,
                ),
                textColor: Color.fromARGB(255, 255, 252, 252),
                padding: EdgeInsets.all(0),
                child: Text(
                  "Sender",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: 292,
              height: 65,
              margin: EdgeInsets.only(top: 84),
              child: FlatButton(
                onPressed: () => this.onGroup3Pressed(context),
                color: AppColors.secondaryBackground,
                shape: RoundedRectangleBorder(
                  side: Borders.primaryBorder,
                  borderRadius: BorderRadius.all(Radius.circular(32.5)),
                ),
                textColor: Color.fromARGB(255, 255, 252, 252),
                padding: EdgeInsets.all(0),
                child: Text(
                  "Request",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
