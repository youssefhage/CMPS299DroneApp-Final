/*
*  enter_token_r2_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone_transportation/Core/crud.dart';
import 'package:drone_transportation/screens/map_page.dart';
import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:geolocator/geolocator.dart';

import 'inital_screen_widget.dart';

//!TODO: There is a problem in the Confirm Token Button. Whenever the _textEditingController is empty the app crashes. If data entry is normal app works normally

class EnterTokenR2Widget extends StatelessWidget {
  void onGroup5Pressed(BuildContext context, String tk) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapPage(tk),
        ),
      );
  // ReceiverClass receiver = new ReceiverClass(
  //   id: token,
  //   receiverLatLng: GeoPoint(0, 0),
  // );

  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Please copy the following token and send it to the receiver. \n(ie: over whatsapp)",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: TextFormField(
                    controller: _textEditingController,
                    style: TextStyle(fontSize: 32),
                    decoration: InputDecoration(
                      labelText: 'Enter Token',
                      errorText: _textEditingController.text != null
                          ? 'Value Can\'t Be Empty'
                          : null,
                    ),
                    maxLength: 20,
                  ),
                ),
              ),
            ),
            ProgressButton(
              defaultWidget: Container(
                child: Text(
                  "Check",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
              borderRadius: 30,
              progressWidget: CircularProgressIndicator(),
              width: 292,
              height: 60,
              color: AppColors.primaryElement,
              onPressed: () async {
                // After [onPressed], it will trigger animation running backwards, from end to beginning
                if (_textEditingController.text == null) {
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Can't be empty",
                        ),
                        content: Text("Please Try Again"),
                      );
                    },
                  );
                }

                var tkState =
                    await FBoperations.docExists(_textEditingController.text);
                Position position = await Geolocator().getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.bestForNavigation);
                print(position);
                return () async {
                  // Optional returns is returning a VoidCallback that will be called
                  // after the animation is stopped at the beginning.
                  // A best practice would be to do time-consuming task in [onPressed],
                  // and do page navigation in the returned VoidCallback.
                  // So that user won't missed out the reverse animation.

                  // String txt = _textEditingController.text;
                  if (tkState == true) {
                    FBoperations.updateMultipleFields(
                      token,
                      {
                        'ReceiverLatLng':
                            GeoPoint(position.latitude, position.longitude),
                        'tokenInserted': true,
                      },
                    );
                    onGroup5Pressed(context, token);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Wrong Token",
                            textAlign: TextAlign.center,
                          ),
                          content: Text("Please Check Token and Re-enter"),
                        );
                      },
                    );
                  }
// return showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           content: Text("Please enter data"),
//                         );
//                       });
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
