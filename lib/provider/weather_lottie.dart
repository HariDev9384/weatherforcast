import 'weather_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
class weather_lotti with ChangeNotifier{
  String? cli_lottie;
  var climate;
  String? get c=>climate;
  weather_lotti(snapshot){
  climate=snapshot.data.list![0].weather[0].main;
  switch (climate) {
    case 'Sunrise':
          cli_lottie='https://assets1.lottiefiles.com/packages/lf20_stwvst8g.json';
          notifyListeners();
         break;
    case 'Sunset':
           cli_lottie='https://assets1.lottiefiles.com/packages/lf20_stwvst8g.json';
           notifyListeners();
         break;
    case 'Clouds':
            cli_lottie='https://assets1.lottiefiles.com/packages/lf20_x7fydhul.json';
            notifyListeners();
            break;
    case 'Snow':
             cli_lottie='https://assets1.lottiefiles.com/private_files/lf30_usl23etb.json';
            notifyListeners();
            break;
    case 'Rain':
             cli_lottie='https://assets6.lottiefiles.com/private_files/lf30_orqfuyox.json';
            notifyListeners();
            break;
  }
  }
@override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}