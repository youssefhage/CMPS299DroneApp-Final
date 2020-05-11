/*
*  waiting_drone_to_sender_r3_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone_transportation/Core/crud.dart';
import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';

class WaitingDroneToSenderR3Widget extends StatelessWidget {
  dynamic token;
  GeoPoint receiverLaLng;
  WaitingDroneToSenderR3Widget(
      {@required this.token, @required this.receiverLaLng});

  @override
  Widget build(BuildContext context) {
    // FBoperations.updateField(
    //   token,
    //   'ReceiverLatLng',
    //   receiverLaLng,
    // );
    FBoperations.updateMultipleFields(
      token,
      {
        'ReceiverLatLng': receiverLaLng,
        'tokenInserted': true,
      },
    );
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
}
