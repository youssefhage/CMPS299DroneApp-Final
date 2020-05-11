/*
*  send_package_s2_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:drone_transportation/screens/await_token_s3_widget.dart';
import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';

class SendPackageS2Widget extends StatelessWidget {
  String token;
  SendPackageS2Widget({this.token});
  void onGroup5Pressed(BuildContext context, String tk) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AwaitTokenS3Widget(
                token: tk,
              )));

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
            // TextFormField(
            //   // controller: latController,
            //   decoration: InputDecoration(labelText: ''),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: SelectableText(
                  token.toString(),
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            Container(
              width: 292,
              height: 60,
              margin: EdgeInsets.only(top: 319),
              child: FlatButton(
                onPressed: () => this.onGroup5Pressed(context, token),
                color: AppColors.primaryElement,
                shape: RoundedRectangleBorder(
                  side: Borders.primaryBorder,
                  borderRadius: Radii.k30pxRadius,
                ),
                textColor: Color.fromARGB(255, 255, 252, 252),
                padding: EdgeInsets.all(0),
                child: Text(
                  "Done",
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
