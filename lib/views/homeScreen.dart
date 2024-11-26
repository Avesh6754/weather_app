import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ApiHelper/api_helper.adrt.dart';
import 'package:weather_app/modal/weatherModal.dart';
import 'package:weather_app/provider/HomeProvider.dart';

import 'component/currentStatus.dart';
import 'component/hourBox.dart';
import 'component/textfiled.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtSearch=TextEditingController();
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
              Weather weather = snapshot.data!;

              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: (provoidertrue.weathermodal!.currentModal.is_day==1)?AssetImage(day):AssetImage(night)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SingleChildScrollView(
                    child: Current_Status(txtSearch: txtSearch, provoiderfalse: provoiderfalse, provoidertrue: provoidertrue, weather: weather),
                  ),
                ),
              );;
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}





//img.freepik.com/free-photo/starry-sky-town_23-2151642596.jpg?ga=GA1.2.19654575.1717952195&semt=ais_hybrid";