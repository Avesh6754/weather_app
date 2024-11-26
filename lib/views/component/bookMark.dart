import 'package:flutter/material.dart';

import '../../modal/weatherModal.dart';
import '../../provider/HomeProvider.dart';

class AddBookMark extends StatelessWidget {
  const AddBookMark({
    super.key,
    required this.provoidertrue,
    required this.provoiderfalse,
    required this.weather,
  });

  final Homeprovider provoidertrue;
  final Homeprovider provoiderfalse;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        provoiderfalse.addFavCity(
          weather!.locationModal.name,
          weather.currentModal.temp_c.toString(),
          weather.currentModal.condition.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('BookMark'),duration: Duration(seconds: 2),));
      },
      child: Container(
        height: 52,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          'Add city to favorite',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
