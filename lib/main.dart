/*
*  main.dart
*  Drone Transportation
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';

import 'screens/inital_screen_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitalScreenWidget(),
    );
  }
}

/*
AwaitTokenS3Widget check
InitalScreenWidget check
OrderDeliveredS9R7Widget check
UnloadAndConfirmR6Widget check
WaitingDroneToSenderR3Widget check
SendS7Widget check
WaitOutsideR5Widget check
LoadPackageS6Widget check
SendPackageS2Widget check

EnterTokenR2Widget not check similar to SendPackageS2Widget


Map not done
Timer not done


*/
