import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/ApiHelper/api_helper.adrt.dart';
import 'package:weather_app/modal/weatherModal.dart';

class Homeprovider extends ChangeNotifier {
  Weather? weathermodal;
  String search = 'Surat';
  bool already = false;
  List<String> weatherLIst = [];

  Future<Weather?> fetchDataFromJson(String city) async {
    final data = await ApiHelper.apiHelper.fetchData(search);
    weathermodal = Weather.fromJson(data);
    return weathermodal;
  }

  void searchCity(String city) {
    search = city;
    notifyListeners();
  }

  void removeFromList(int index) {
    weatherLIst.removeAt(index);
    notifyListeners();
  }

  Future<void> addFavCity(String name, String temp, String type,) async {
    String data = '$name-$temp-$type';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        weatherLIst.add(data);

    await sharedPreferences.setStringList('weatherLIst',weatherLIst);
  }

  Future<void> getFavouriteWeather() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weatherLIst = sharedPreferences.getStringList('weatherLIst')??<String>[];
    notifyListeners();
  }

  Homeprovider() {
    getFavouriteWeather();
  }
}
