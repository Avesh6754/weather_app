import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ApiHelper/api_helper.adrt.dart';
import 'package:weather_app/modal/weatherModal.dart';
import 'package:weather_app/provider/HomeProvider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final day = 'assets/image/day.jfif';
    final night = 'assets/image/night.jpeg';
    Homeprovider provoidertrue =
        Provider.of<Homeprovider>(context, listen: true);
    Homeprovider provoiderfalse =
        Provider.of<Homeprovider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.black54,
        body: FutureBuilder(
          future: provoiderfalse.fetchDataFromJson(provoidertrue.search),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModal weatherModal = snapshot.data!;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: (provoidertrue
                                        .weathermodal!.currentModal.is_day ==
                                    1)
                                ? AssetImage(day)
                                : AssetImage(night))),
                    child: Column(
                      children: [
                        TextField(),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                '${provoidertrue.weathermodal!.locationModal.name}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ' ${provoidertrue.weathermodal!.currentModal.temp_c}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 80,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    ' C',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: -1.0,
                                        fontSize: 40,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                ' ${provoidertrue.weathermodal!.currentModal.condition.text}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white24),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timer_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '24 - Hour Forecast ',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                                provoidertrue
                                                    .weathermodal!
                                                    .forcatModal
                                                    .forcastday
                                                    .first
                                                    .hour
                                                    .length, (index) {
                                              final hour = provoidertrue
                                                  .weathermodal!
                                                  .forcatModal
                                                  .forcastday
                                                  .first
                                                  .hour[index];
                                              return Container(
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        '${hour.time.split(' ').sublist(1, 2).join('')}',
                                                        style: TextStyle(
                                                            color: Colors.white)),
                                                    Image.network(
                                                        "https:${hour.hourConditionModal.icon}"),
                                                    Text('${hour.temp_c}',
                                                        style: TextStyle(
                                                            color: Colors.white))
                                                  ],
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white24),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Text(
                                                    '${provoidertrue.weathermodal!.currentModal.wind_mph} mp/h',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    '${provoidertrue.weathermodal!.currentModal.wind_kph} Kp/h',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white24),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Text(
                                                  '${provoidertrue.weathermodal!.forcatModal.forcastday[0].astro.sunrise} sunsrise',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  '${provoidertrue.weathermodal!.forcatModal.forcastday[0].astro.sunset} sunset',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    width: 210,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white24),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Humidity',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(
                                                  '${provoidertrue.weathermodal!.currentModal.humidity} ',
                                                  style: TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('UV',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(
                                                  '${provoidertrue.weathermodal!.currentModal.uv} ',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Pressure',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(
                                                  '${provoidertrue.weathermodal!.currentModal.pressure_mb} ',
                                                  style: TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Chance of rain',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(
                                                  '${provoidertrue.weathermodal!.forcatModal.forcastday[0].day.daily_chance_of_rain}%',
                                                  style: TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white24,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13),
                              child: Text(
                                "Add City to BookMark",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
