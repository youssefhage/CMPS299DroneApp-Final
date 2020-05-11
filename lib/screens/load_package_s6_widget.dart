/*
*  load_package_s6_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

//onPressed: () => this.onGroup5Pressed(context),

import 'package:drone_transportation/screens/send_s7_widget.dart';
import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';

class LoadPackageS6Widget extends StatelessWidget {
  void onGroup5Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SendS7Widget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 80),
                child: Text(
                  "Load Package\n and \nStand Away",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Container(
              height: 312,
              margin: EdgeInsets.only(top: 71),
              child: Opacity(
                opacity: 0.99544,
                child: Image.asset(
                  "assets/images/drone-bt.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 235,
                height: 60,
                margin: EdgeInsets.only(bottom: 80),
                child: FlatButton(
                  onPressed: () => this.onGroup5Pressed(context),
                  color: AppColors.secondaryElement,
                  shape: RoundedRectangleBorder(
                    side: Borders.primaryBorder,
                    borderRadius: Radii.k30pxRadius,
                  ),
                  textColor: Color.fromARGB(255, 255, 252, 252),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "Confirm",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
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
