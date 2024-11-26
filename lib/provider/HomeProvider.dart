import 'package:flutter/widgets.dart';
import 'package:weather_app/ApiHelper/api_helper.adrt.dart';
import 'package:weather_app/modal/weatherModal.dart';

class Homeprovider extends ChangeNotifier{
   WeatherModal? weathermodal;
  String search='Surat';

  Future<WeatherModal?> fetchDataFromJson(String city)
  async {
    final data=await ApiHelper.apiHelper.fetchData(search);
    weathermodal=WeatherModal.fromJson(data);
    return weathermodal;
  }
}