/*
*  send_s7_widget.dart
*  Drone App Transportation
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */

import 'package:flutter/material.dart';

import '../values/values.dart';

class SendS7Widget extends StatelessWidget {
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
                width: 252,
                height: 201,
                margin: EdgeInsets.only(top: 55),
                child: Image.asset(
                  "assets/images/group-7.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 350,
              margin: EdgeInsets.only(top: 7),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 258,
                    child: Text(
                      "Make sure you’re \nfew meters away!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.accentText,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: 0.99544,
                      child: Image.asset(
                        "assets/images/drone-bt.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 183,
                height: 60,
                margin: EdgeInsets.only(bottom: 81),
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  border: Border.fromBorderSide(Borders.primaryBorder),
                  borderRadius: Radii.k30pxRadius,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Send",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
