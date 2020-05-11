/*
*  order_delivered_s9_r7_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:drone_transportation/screens/inital_screen_widget.dart';
import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';


class OrderDeliveredS9R7Widget extends StatelessWidget {
  
  void onGroup5Pressed(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => InitalScreenWidget()));
  
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
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 203,
                height: 137,
                margin: EdgeInsets.only(top: 130, right: 74),
                child: Image.asset(
                  "assets/images/screen-shot-2020-05-07-at-21011-pm.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 71),
              child: Text(
                "Delivery Done!",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              width: 235,
              height: 60,
              margin: EdgeInsets.only(top: 172),
              child: FlatButton(
                onPressed: () => this.onGroup5Pressed(context),
                color: AppColors.primaryElement,
                shape: RoundedRectangleBorder(
                  side: Borders.primaryBorder,
                  borderRadius: Radii.k30pxRadius,
                ),
                textColor: Color.fromARGB(255, 255, 252, 252),
                padding: EdgeInsets.all(0),
                child: Text(
                  "Close",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontFamily: "Helvetica Neue",
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