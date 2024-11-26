import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/HomeProvider.dart';
import 'package:weather_app/views/favorite.dart';
import 'package:weather_app/views/homeScreen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (context) => Homeprovider(),)
    ],builder: (context, child) => MaterialApp(debugShowCheckedModeBanner: false,routes: {
      '/':(context)=>Homescreen(),
      '/fav':(context)=>FavScreen()
    },),);
  }
}
