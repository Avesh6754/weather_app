import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/HomeProvider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Homeprovider provoidertrue =
    Provider.of<Homeprovider>(context, listen: true);
    Homeprovider provoiderfalse =
    Provider.of<Homeprovider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation:11,
        shadowColor: Colors.black54,
        title: const Text(
          'BookMark City',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 26),
        ),
      ),
      body: ListView.builder(
        itemCount: provoidertrue.weatherLIst.length,
        itemBuilder: (context, index) {
          final name = provoidertrue.weatherLIst[index]
              .split('-')
              .sublist(0, 1)
              .join('-');
          final temp = provoidertrue.weatherLIst[index]
              .split('-')
              .sublist(1, 2)
              .join('-');
          final status = provoidertrue.weatherLIst[index]
              .split('-')
              .sublist(2, 3)
              .join('-');
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                  title: Text('City : ${name}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24)),
                  subtitle: Text('${status}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  trailing: Text('${temp}°C',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 38)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}