import 'dart:convert';

import 'package:bank_app_flutter/model/MonthList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static UserPreferences _instance;
  static SharedPreferences _pref;
  static MonthList _list;

  static UserPreferences get instance {
    if (_instance != null) {
      print("INITIALIZED");
      return _instance;
    }
    print("NOT INITIALIZED");
    _instance = UserPreferences._();
    return _instance;
  }

  UserPreferences._() {
    initialize();
  }

  void initialize() async {
    _pref = await SharedPreferences.getInstance();
  }

  bool isListInit() {
    return _pref.containsKey(userData);
  }

  SharedPreferences getSharedPreferences() {
    return _pref;
  }

  Future saveList(list) async {
    await _pref.setString(userData, json.encode(list));
    // print(UserAnswers.fromJson(json.decode(getQuizz())).quastions[0].toJson());
  }

  bool isVideoInit() {
    return _pref.containsKey(isVideo);
  }
  bool getIsVideoInit() {
    return _pref.getBool(isVideo);
  }
  void saveIsVideo() {
    _pref.setBool(isVideo, true);
  }

  bool isRoutNameInit() {
    return _pref.containsKey(routName);
  }
  void saveRoutName(name) {
    _pref.setString(routName, name);
  }

  String getRoutName() {
    return _pref.getString(routName);
  }
  void savePlanList(list) {
    _pref.setString(planList, json.encode(list));
  }
  MonthList getList() {
    _list = MonthList.fromJson(json.decode(_pref.getString(userData)));
    return _list;
  }
  MonthList getPlanList() {
    _list = MonthList.fromJson(json.decode(_pref.getString(planList)));
    return _list;
  }

  Future<bool> clear() async {
    return await _pref.clear();
  }

  static final String userData = "userData";
  static final String planList = "planList";
  static final String routName = "routName";
  static final String isVideo = "isVideo";

}
