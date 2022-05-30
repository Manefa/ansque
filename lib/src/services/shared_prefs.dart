import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _instance;

  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _instance.setString(key, value);
  }

  String? getString(String key) {
    return _instance.getString(key);
  }

  Future<bool> setInt(String key, int value) async {
    return await _instance.setInt(key, value);
  }

  int? getInt(String key) {
    return _instance.getInt(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _instance.setBool(key, value);
  }

  bool? getBool(String key) {
    return _instance.getBool(key);
  }

  Future<bool> setObject(String key, dynamic value) async {
    return await _instance.setString(key, json.encode(value.toJson()));
  }

  String? getObject(String key) {
    return _instance.getString(key);
  }

  void remove(String key) {
    _instance.remove(key);
  }
}
