/*
*  wait_outside_r5_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';

class WaitOutsideR5Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -291,
              top: -5,
              right: -432,
              child: Image.asset(
                "assets/images/group-6-2.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 5,
              top: 192,
              child: Text(
                "Drone about to arrive.\nPlease wait outside\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
