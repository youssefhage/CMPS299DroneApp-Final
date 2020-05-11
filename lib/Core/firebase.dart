import 'package:cloud_firestore/cloud_firestore.dart';

class CloudData {
  GeoPoint droneLatLng = GeoPoint(0, 0);
  GeoPoint receiverLatLng = GeoPoint(0, 0);
  GeoPoint senderLatLng = GeoPoint(0, 0);
  bool loadPackage = false;
  bool droneInMotion = false;
  bool tokenInserted = false;
  bool unloadPackage = false;
  String token = "";
  CloudData(
      {this.droneLatLng,
      this.receiverLatLng,
      this.droneInMotion,
      this.loadPackage,
      this.senderLatLng,
      this.tokenInserted,
      this.token,
      this.unloadPackage});

  void convertMap(Map<String, dynamic> map) {
    droneLatLng = map['DroneLatLng'];
    receiverLatLng = map['ReceiverLatLng'];
    senderLatLng = map['SenderLatLng'];
    loadPackage = map['loadPackage'];
    tokenInserted = map['tokenInserted'];
    unloadPackage = map['unloadPackage'];
    droneInMotion = map['droneInMotion'];
  }
}

List<CloudData> _store = [];

void addCloudData(CloudData cld) {
  _store.add(cld);
}

void removeCloudDataByID(CloudData cld) {
  _store.remove(cld.token);
}

void resetCloudData(CloudData cld) {
  _store.clear();
}
