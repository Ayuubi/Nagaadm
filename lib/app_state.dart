import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
  }

  int _uid = 0;
  int get uid => _uid;
  set uid(int value) {
    _uid = value;
  }
}
