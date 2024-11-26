import 'package:flutter/material.dart';
import 'package:weather_app/views/component/suncondition.dart';
import 'package:weather_app/views/component/textfiled.dart';
import 'package:weather_app/views/component/windSpeed.dart';

import '../../modal/weatherModal.dart';
import '../../provider/HomeProvider.dart';
import 'bookMark.dart';
import 'hourBox.dart';

class Current_Status extends StatelessWidget {
  const Current_Status({
    super.key,
    required this.txtSearch,
    required this.provoiderfalse,
    required this.provoidertrue,
    required this.weather,
  });

  final TextEditingController txtSearch;
  final Homeprovider provoiderfalse;
  final Homeprovider provoidertrue;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 34,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Textfield(txtSearch: txtSearch, provoiderfalse: provoiderfalse),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
            child: Column(
              children: [
                Text(
                  provoidertrue.weathermodal!.locationModal.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '${provoidertrue.weathermodal!.locationModal.region} '", "+'${provoidertrue.weathermodal!.locationModal.country}' ,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              '${provoidertrue.weathermodal!.currentModal.temp_c}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 70),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 48.0),
              child: Text(
                'C',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 30),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weather : ${provoidertrue.weathermodal!.currentModal.condition.text}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ],
        ),
        SizedBox(
          height: 80,
        ),
        HoursBox(provoidertrue: provoidertrue),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 150,
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: [
                  WindKmp(provoidertrue: provoidertrue),
                  SizedBox(
                    height: 9,
                  ),
                  Sunrise_Sunt(provoidertrue: provoidertrue),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Container(
                    width: 207,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Humidity',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Text(
                                  '${provoidertrue.weathermodal!.currentModal.humidity}%',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white)),
                            ],
                          ),
                          Divider(
                            height: 0.2,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'UV',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Text(
                                  '${provoidertrue.weathermodal!.currentModal.uv}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white)),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Divider(
                            height: 0.2,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Pressure',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Text(
                                  '${provoidertrue.weathermodal!.currentModal.pressure_mb}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white)),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Divider(
                            height: 0.2,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Chance of rain',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Text(
                                  '${provoidertrue.weathermodal!.forcatModal.forcastday[0].day.daily_chance_of_rain}%',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        AddBookMark(provoidertrue: provoidertrue, provoiderfalse: provoiderfalse, weather: weather),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}


