import 'package:flutter/material.dart';

import '../../provider/HomeProvider.dart';


class WindKmp extends StatelessWidget {
  const WindKmp({
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
            '${provoidertrue.weathermodal!.currentModal.wind_mph} mp/h',
            style: TextStyle(
                fontSize: 20, color: Colors.white),
          ),
          Text(
            '${provoidertrue.weathermodal!.currentModal.wind_kph}kp/h',
            style: TextStyle(
                fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}