import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/Theme_provider.dart';
import 'package:weather/screens/Home.dart';
void main(){
  runApp(
    MultiProvider(
      child: MyApp(),
      providers:[
      ChangeNotifierProvider<ThemeProv>(create: (_)=>ThemeProv())
    ],
    ),
    );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}