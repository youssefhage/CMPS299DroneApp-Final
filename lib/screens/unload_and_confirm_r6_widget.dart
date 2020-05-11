/*
*  unload_and_confirm_r6_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:drone_transportation/screens/order_delivered_s9_r7_widget.dart';
import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';

class UnloadAndConfirmR6Widget extends StatelessWidget {
  void onGroup8Pressed(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => OrderDeliveredS9R7Widget()));

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
                margin: EdgeInsets.only(top: 22),
                child: Text(
                  "Unload Drone \nand \nConfirm Package",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 31),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/images/screen-shot-2020-05-07-at-34438-pm.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 72,
                      child: FlatButton(
                        onPressed: () => this.onGroup8Pressed(context),
                        color: AppColors.secondaryElement,
                        shape: RoundedRectangleBorder(
                          side: Borders.primaryBorder,
                          borderRadius: Radii.k30pxRadius,
                        ),
                        textColor: Color.fromARGB(255, 255, 252, 252),
                        padding: EdgeInsets.only(
                            top: 6, left: 24, right: 24, bottom: 6),
                        child: Text(
                          "Confirm",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                          ),
                        ),
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
