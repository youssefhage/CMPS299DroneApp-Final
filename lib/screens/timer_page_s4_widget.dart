/*
*  timer_page_s4_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';


class TimerPageS4Widget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(top: 124, right: 73),
              child: Text(
                "Timer Page..",
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