
import '../../provider/HomeProvider.dart';
import 'package:flutter/material.dart';
class HoursBox extends StatelessWidget {
  const HoursBox({
    super.key,
    required this.provoidertrue,
  });

  final Homeprovider provoidertrue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.watch_later,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  ' 24 - Hour Forecast',
                  style: TextStyle(
                      color: Colors.white, fontSize: 18),
                ),
              ],
            ),
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
                      .length,
                      (index) {
                    final hour = provoidertrue
                        .weathermodal!
                        .forcatModal
                        .forcastday
                        .first
                        .hour[index];
                    return Container(
                      height: 120,
                      width: 80,
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          Text(
                            '${hour.time.split(" ").sublist(1, 2).join(" ")}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Image.network(
                              'https:${hour.hourConditionModal.icon}'),
                          Text(
                            '${hour.temp_c}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}