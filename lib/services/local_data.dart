import 'dart:async';

import 'package:flexicharge/enums/event_type.dart';
import 'package:flexicharge/models/charger.dart';
import 'package:flexicharge/models/charger_point.dart';
import 'package:flexicharge/models/transaction.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// It's a class that holds data that is used by the app
class LocalData {
  List<Charger> chargers = [];
  String qrCode = '';
  List<ChargerPoint> chargerPoints = [];
  LatLng userLocation = LatLng(0, 0);
  int chargingCharger = -1;
  Transaction transactionSession = Transaction();
  bool isButtonActive = true;
  int chargingPercentage = 0;
  //late Timer timer; This is commented out because a temporary
  //fake timer is used to simulate a charging session.
  late StreamController<EventType> controller;
  late Stream stream;

  LocalData() {
    controller = StreamController.broadcast();
    stream = controller.stream;
  }

  BitmapDescriptor greenMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor redMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor blackMarkerIcon = BitmapDescriptor.defaultMarker;
}
