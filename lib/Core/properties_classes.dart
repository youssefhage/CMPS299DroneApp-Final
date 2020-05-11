import 'package:cloud_firestore/cloud_firestore.dart';

class ReceiverClass {
  GeoPoint receiverLatLng;
  String id;
  ReceiverClass({this.receiverLatLng, this.id});
}

class SenderClass {
  GeoPoint senderLatLng;
  String id;
  SenderClass({this.senderLatLng, this.id});
}
