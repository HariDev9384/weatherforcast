import 'package:flutter/material.dart';
class FramSize{
  static var height,width;
  @override
  static void initState({context}) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
  }

}
