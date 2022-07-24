import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import '../model/weather.dart';
class FetchApi with ChangeNotifier{
  String? apikey='ed60fcfbd110ee65c7150605ea8aceea';
  String? cityname='coimbatore';
  // https://api.openweathermap.org/data/2.5/forecast?q=kumbakonam&appid=ed60fcfbd110ee65c7150605ea8aceea
  String? get city=>cityname;
   Future<WeatherForecastModel> get_weather(city) async{
          var url='https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apikey';
          final response=await http.get(Uri.parse(url));
          
          if(response.statusCode==200){
            print(cityname);
              var response_json=WeatherForecastModel.fromJson(jsonDecode(response.body));
              print(response.body);
              notifyListeners();
              return WeatherForecastModel.fromJson(jsonDecode(response.body));
          }else{
            throw Exception('Json failed');
            
          }
  }
}