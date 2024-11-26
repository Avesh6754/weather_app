import 'package:flutter/material.dart';

import '../../provider/HomeProvider.dart';


class Sunrise_Sunt extends StatelessWidget {
  const Sunrise_Sunt({
    super.key,
    required this.provoidertrue,
  });

  final Homeprovider provoidertrue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${provoidertrue.weathermodal!.forcatModal.forcastday[0].astro.sunrise} sunrise',
            style: TextStyle(
                fontSize: 17, color: Colors.white),
          ),
          Text(
            '${provoidertrue.weathermodal!.forcatModal.forcastday[0].astro.sunset} sunset',
            style: TextStyle(
                fontSize: 17, color: Colors.white),
          )
        ],
      ),
    );
  }
}