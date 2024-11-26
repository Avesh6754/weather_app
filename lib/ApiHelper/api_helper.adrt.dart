

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper{

  ApiHelper._();
  static ApiHelper apiHelper=  ApiHelper._();
  Future<Map> fetchData(String search)
  async {
    final api='https://api.weatherapi.com/v1/forecast.json?key=138c2e5f1ff140c8ad2101054243007&q=$search';

    Uri uri=Uri.parse(api);
    Response response=await http.get(uri);
    if(response.statusCode==200)
      {
        final data=response.body;
        Map json=jsonDecode(data);
        return json;
      }
    return {};

  }
}