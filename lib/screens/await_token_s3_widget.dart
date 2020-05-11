/*
*  await_token_s3_widget.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'dart:async';

import 'package:drone_transportation/Core/crud.dart';
import 'package:drone_transportation/values/values.dart';
import 'package:flutter/material.dart';

import 'map_r4_widget.dart';
import 'timer_page_s4_widget.dart';

class AwaitTokenS3Widget extends StatefulWidget {
  String token;
  AwaitTokenS3Widget({@required this.token});

  @override
  _AwaitTokenS3WidgetState createState() => _AwaitTokenS3WidgetState();
}

class _AwaitTokenS3WidgetState extends State<AwaitTokenS3Widget> {
  bool done = false;
  StreamSubscription streamSubscription;
  bool tkEntered;

  void change(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TimerPageS4Widget(),
        ),
      );
  // void dataListener() {
  //   DocumentReference reference =
  //       Firestore.instance.collection('transports').document(widget.token);

  //   reference.snapshots().listen(
  //     (querySnapshot) async {
  //       print(querySnapshot.data["tokenInserted"]);
  //       tkEntered = await querySnapshot.data["tokenInserted"];
  //       if (tkEntered == true) {
  //         done = true;
  //         // print("\ntkEnter: $tkEntered");
  //         if (done) {
  //           // print("Done");
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => TimerPageS4Widget()));
  //         }
  //       }
  //       // if (querySnapshot.data["tokenInserted"] == true) {

  //       // }
  //     },
  //   );
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     dataListener();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // change(context);
    // setState(() {
    // dataListener();
    FBoperations.dataListener(
      widget.token,
      'tokenInserted',
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => MapR4Widget())),
    );
    // });

    return Scaffold(
      body: WaitWidget(),
      // StreamBuilder(
      //     stream: Firestore.instance
      //         .collection('transports')
      //         .document(widget.token)
      //         .snapshots(),
      //     builder: (context, snapshot) {
      //       print(widget.token);
      //       if (!snapshot.hasData)
      //       // (snapshot.data['tokenInserted'] == false &&
      //       //     snapshot.data['tokenInserted'] != null)
      //       {
      //         return Text(
      //           "No Internet",
      //           textAlign: TextAlign.center,
      //         );
      //       } else if (snapshot.data["tokenInserted"] == true) {
      //         return WaitWidget(
      //           ButtonWidget: ButtonWidget(() {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => TimerPageS4Widget(),
      //               ),
      //             );
      //           }),
      //         );

      // SchedulerBinding.instance.addPostFrameCallback((_) {

      //   Navigator.push(
      //       context,
      //       new MaterialPageRoute(
      //           builder: (context) => TimerPageS4Widget()));

      // });
      // _bloc.dispatch(NavigationComplete());
      // WidgetsBinding.instance.addPostFrameCallback((_) {

      //   var userDocument = snapshot.data;
      // var test = userDocument["unloadPackage"];

      // } else {
      //   return WaitWidget();
      //     }
      //     // else {
      //     // return Text("Hello");
      //     // }

      // }
      // },
      // ),
    );
  }
}

// Widget ButtonWidget(func) {
//   return Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Container(
//       width: 292,
//       height: 65,
//       margin: EdgeInsets.only(top: 84),
//       child: FlatButton(
//         onPressed: func,
//         color: AppColors.primaryElement,
//         shape: RoundedRectangleBorder(
//           side: Borders.primaryBorder,
//           borderRadius: BorderRadius.all(Radius.circular(32.5)),
//         ),
//         textColor: Color.fromARGB(255, 255, 252, 252),
//         padding: EdgeInsets.all(0),
//         child: Text(
//           "Continue",
//           textAlign: TextAlign.left,
//           style: TextStyle(
//             color: AppColors.secondaryText,
//             fontFamily: "Roboto",
//             fontWeight: FontWeight.w400,
//             fontSize: 20,
//           ),
//         ),
//       ),
//     ),
//   );
// }

class WaitWidget extends StatelessWidget {
  // Widget ButtonWidget;
  WaitWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 444,
            child: Image.asset(
              "assets/images/wait_token.png",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 53),
              child: Text(
                "Waiting for receiver \nto input token",
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
        ],
      ),
    );
  }
}
