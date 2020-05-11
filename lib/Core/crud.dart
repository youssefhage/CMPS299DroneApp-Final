import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone_transportation/Core/firebase.dart';

var _token;
final databaseReference = Firestore.instance;

class FBoperations {
  // Map<String, dynamic> datalist = {
  //     'DroneLatLng': cloudData.droneLatLng,
  //     'ReceiverlatLng': cloudData.receiverLatLng,
  //     'SenderLatLng': cloudData.senderLatLng,
  //     'tokenInserted': cloudData.tokenInserted,
  //     'loadPackage': cloudData.loadPackage,
  //     'unloadPackage': cloudData.unloadPackage,
  // }

  static Future<bool> docExists(String tk) async {
    // bool bl;
    // databaseReference.document("transports/$tk").get().then((onValue) {
    //   bl = onValue.exists ? true : false;
    // });
    // print(bl);
    // return bl;
    try {
      final snapshot =
          await databaseReference.collection('transports').document(tk).get();
      if (snapshot.exists) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      print(exception.toString());
    }
  }

  static getToken() {
    if (_token == null) {
      return null;
    } else {
      return _token;
    }
  }

  static createRecord(CloudData cloudData) async {
    DocumentReference ref =
        await databaseReference.collection("transports").add({
      'DroneLatLng': cloudData.droneLatLng,
      'ReceiverLatLng': cloudData.receiverLatLng,
      'SenderLatLng': cloudData.senderLatLng,
      'tokenInserted': cloudData.tokenInserted,
      'loadPackage': cloudData.loadPackage,
      'unloadPackage': cloudData.unloadPackage,
      'droneInMotion': cloudData.droneInMotion,
    });
    print(ref.documentID);
    _token = ref.documentID;
    return _token.toString();
  }

  static void getData(dynamic token) {
    databaseReference
        .collection("transports")
        .document(token)
        .get()
        .then((DocumentSnapshot ds) {
      ds.data;
    });
  }

  static void modifyTrack(String nameTrack) {
    if (nameTrack == "tokenInserted") {}
  }

  static void updateField(tk, documentName, data) async {
    try {
      await databaseReference
          .collection('transports')
          .document(tk)
          .updateData({documentName: data});
    } catch (e) {
      print(e.toString());
    }
  }

  static void updateMultipleFields(tk, Map<String, dynamic> map) async {
    try {
      await databaseReference
          .collection('transports')
          .document(tk)
          .updateData(map);
    } catch (e) {
      print(e.toString());
    }
  }

  static void dataListener(
    String documentID,
    String dataToRetreive,
    Function goto,
  ) {
    bool checker = false;
    bool done = false;
    DocumentReference reference =
        databaseReference.collection('transports').document(documentID);

    reference.snapshots().listen(
      (querySnapshot) async {
        print(querySnapshot.data[dataToRetreive]);
        checker = await querySnapshot.data[dataToRetreive];
        if (checker == true) {
          done = true;
          // print("\ntkEnter: $tkEntered");
          if (done) {
            // print("Done");
            () => goto;
          }
        }
        // if (querySnapshot.data["tokenInserted"] == true) {

        // }
      },
    );
  }
}
