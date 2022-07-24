import 'package:flutter/material.dart';
import 'package:weather/responsive/FrameSize.dart';
class ThemeProv with ChangeNotifier{
  var icon_pos=FramSize.height*0.001;
  Color BackgroundColor=Color.fromARGB(255, 88, 46, 157);
  Color ForgroundColor=Colors.white;
  Color NavigatoBarColor=Color.fromARGB(33, 255, 255, 255);
  bool theme=true;
  IconData Toggle_icon=Icons.dark_mode_outlined;
  double get pos=>icon_pos;
  IconData get icon=>Toggle_icon;
  Color get bc=>BackgroundColor;
  Color get fc=>ForgroundColor;
  
  DarkTOLight(){
    icon_pos=FramSize.height*0.034;
    Toggle_icon=Icons.light_mode_outlined;
    BackgroundColor=Colors.white;
    ForgroundColor=Colors.black;
    NavigatoBarColor=Color.fromARGB(49, 0, 0, 0);
    notifyListeners();
    print('dark to light');
    theme=false;
    notifyListeners();
  }
  LightToDark(){
    icon_pos=FramSize.height*0.001;
    Toggle_icon=Icons.dark_mode_outlined;
    BackgroundColor=Color.fromARGB(255, 88, 46, 157);
    NavigatoBarColor=Color.fromARGB(33, 255, 255, 255);
    ForgroundColor=Colors.white;
    theme=true;
    notifyListeners();
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}