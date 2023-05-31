import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DocumentReference? _currentUserRef =
      FirebaseFirestore.instance.doc('/users/wpjOPh5kwhVBHNSk2lud3Yc8SdA3');
  DocumentReference? get currentUserRef => _currentUserRef;
  set currentUserRef(DocumentReference? _value) {
    _currentUserRef = _value;
  }

  bool _profileSelected = false;
  bool get profileSelected => _profileSelected;
  set profileSelected(bool _value) {
    _profileSelected = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
