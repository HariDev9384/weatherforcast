
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/provider/Theme_provider.dart';
import 'package:weather/provider/weather_lottie.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/responsive/FrameSize.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    FramSize.initState(context: context);
    return FutureBuilder<WeatherForecastModel>(
      future: FetchApi().get_weather('coimbatore'),
      builder: (context,AsyncSnapshot<WeatherForecastModel> snapshot){
      var date=snapshot.data!.list![0].dtTxt;
      DateTime parsedate=DateFormat('yyyy-mm-dd ').parse(date);
      var inputDate = DateTime.parse(parsedate.toString());
      var outputFormat = DateFormat('yyyy-mm-dd');
      var output=outputFormat.format(inputDate);
        return Consumer<ThemeProv>(
        builder: (context, toggle, child) => 
        LayoutBuilder(
          builder: (context, constraints) {
          if(constraints.maxWidth>400){
            return Scaffold(
              backgroundColor: Colors.red,
            );
          }else{
            return Scaffold(
              backgroundColor:  Colors.transparent,
              body: Stack(
                children: [
                  Container(
                    height: FramSize.height/1,
                    width: FramSize.width/1,
                    color: toggle.BackgroundColor,
                    child: Stack(
                    
                      children: [
                        //customappbar
                        Positioned(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: FramSize.height*0.04,
                              left: FramSize.width*0.02,
                              right: FramSize.width*0.02,
                            ),
                            width: FramSize.width/1,
                            height: FramSize.height/13,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Menu_Drawer
                                Container(
                                  height: FramSize.height*0.08,
                                  width: FramSize.height/12.5,
                                  child: Icon(Icons.menu,color: toggle.ForgroundColor),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.transparent,
                                  ),
                                ),
                                //selectlocation
                                Container(
                                  height: FramSize.height*0.08,
                                  width: FramSize.height/4,
                                  
                                  child: Container(
                                    child: 
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on_outlined,
                                        color: Color.fromARGB(255, 44, 33, 243),
                                        ),
                                        Text('Coimbatore',
                                        style: TextStyle(
                                          color: toggle.ForgroundColor
                                        ),
                                        ),
                                        Icon(Icons.keyboard_arrow_down_rounded,
                                        color: toggle.ForgroundColor,)
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                  ),
                                ),
                              //theme
                                InkWell(
                                  onTap: (){
                                    //print(weather_lotti(snapshot).climate);
                                    print(snapshot.data!.list![0].weather![0].main);
                                    (toggle.theme)?toggle.DarkTOLight():toggle.LightToDark();
                                    
                                    toggle.notifyListeners();
                                    print(ThemeProv().icon_pos);
                                    
                                  },
                                  child: Container(
                                    height: FramSize.height*0.04,
                                    width: FramSize.width/6.5,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          
                                          left: toggle.icon_pos,
                                          child: Container(
                                            height: FramSize.width*0.084,
                                            width: FramSize.width*0.08,
                                            child: Icon(toggle.Toggle_icon,color:(toggle.theme)? Colors.white: Color.fromARGB(255, 88, 46, 157)),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: toggle.NavigatoBarColor,
                                        
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: toggle.NavigatoBarColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //color: Colors.white10,
                          ),
                        ),
                        //body
                        Positioned(
                          
                          top: FramSize.height*0.15,
                          child: Container(
                            padding: EdgeInsets.all(FramSize.height*0.015),
                            height: FramSize.height/1.35,
                            width: FramSize.width/1,
                          
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Today's Forcast",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FramSize.height*0.03,
                                    color: toggle.ForgroundColor
                                  ),
                                  ),
                                ],
                              ),
                              //today_forcast_container
                              Container(
                                height: FramSize.height*0.36,
                                width: FramSize.width*1,
                                color: Colors.transparent,
                                child: Stack(
                                  children:[
                                  Positioned(
                                    left: FramSize.width*0.07,
                                    top: FramSize.height*0.03,
                                    child: Container(
                                      height: FramSize.height*0.26,
                                      width:FramSize.width*0.8,
                                      color:Colors.transparent,
                                      child:Lottie.network(weather_lotti(snapshot).cli_lottie.toString())
                                    ),
                                  ),
                                  Positioned(
                                    left: FramSize.width*0.34,
                                    top: FramSize.height*0.3,
                                  child: Container(
                                    height: FramSize.height*0.04,
                                    width: FramSize.width*0.3,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: AutoSizeText(
                                        maxFontSize: 18,
                                        (snapshot.data!.city!.name).toString(),
                                      style: TextStyle(
                                        fontSize: FramSize.height*0.04,
                                        fontWeight: FontWeight.bold,
                                        color: toggle.ForgroundColor
                                      ),
                                      ),
                                    ),
                                  )
                                  )
                                  ]
                                ),
                              ),
                              Positioned(
                                 left: FramSize.width*0.3,
                                 top: FramSize.height*0.36,
    
                                child: Container(
                                  height: FramSize.height*0.1,
                                  width: FramSize.width*0.4,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: AutoSizeText(
                                      maxFontSize:72,
                                      '${snapshot.data!.list![0].main!.temp}°',
                                    style: TextStyle(
                                      fontSize:FramSize.height*0.12,
                                      fontWeight: FontWeight.bold,
                                      color: toggle.ForgroundColor
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                 right: FramSize.width*0.0,
                                 left: FramSize.width*0.0,
                                 top: FramSize.height*0.5,
                                 
                                child: Container(
                                  color: Colors.transparent,
                                  height: FramSize.height*0.2,
                                  width:FramSize.width*1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: FramSize.height*0.15,
                                        width: FramSize.width/4,
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Container(
                                            height: FramSize.height*0.1,

                                              child: Lottie.network(
                                                
                                                'https://assets4.lottiefiles.com/private_files/lf30_dmgebz1e.json'),
                                            ),
                                            Container(
                                              height: FramSize.height*0.04,
                                              width: FramSize.width*0.7,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: AutoSizeText(
                                                  textAlign: TextAlign.center,
                                                  maxFontSize: 26,
                                                  "${double.parse(snapshot.data!.list![0].wind!.speed.toString()).toStringAsFixed(1).toString()} km/h\n${DateFormat('EEEE').format(DateTime.now())}",
                                                  style: TextStyle(
                                                    color: toggle.ForgroundColor,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                  
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      // Container(
                                      //   height: FramSize.height*0.13,
                                      //   width: FramSize.width/4,
                                      //   color: Colors.white,
                                      // ),
                                      Container(
                                        height: FramSize.height*0.15,
                                        width: FramSize.width/4,
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Container(
                                            height: FramSize.height*0.1,

                                              child: Lottie.network(
                                                
                                                'https://assets4.lottiefiles.com/packages/lf20_vcg89p.json'),
                                            ),
                                            Container(
                                              height: FramSize.height*0.04,
                                              width: FramSize.width*0.7,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: AutoSizeText(
                                                  textAlign: TextAlign.center,
                                                  maxFontSize: 18,
                                                  "${snapshot.data!.list![0].main!.pressure} pa\nAir Pressure",
                                                  style: TextStyle(
                                                    color: toggle.ForgroundColor,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                  
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: FramSize.height*0.15,
                                        width: FramSize.width/4,
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Container(
                                            height: FramSize.height*0.1,
                                                color: Colors.transparent,
                                              child: Lottie.network(
                                              'https://assets4.lottiefiles.com/private_files/lf30_rb778uhf.json'),
                                            ),
                                            Container(
                                              height: FramSize.height*0.04,
                                              width: FramSize.width*0.7,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: AutoSizeText(
                                                  textAlign: TextAlign.center,
                                                  maxFontSize: 26,
                                                  "${double.parse(snapshot.data!.list![0].main!.humidity.toString()).round()} % \nHumidity",
                                                  style: TextStyle(
                                                    color: toggle.ForgroundColor,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                  
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                )
                              )
    
                            ],
                          ),
                          ),
                        ),
                        //navigation bar
                        Positioned(
                         top: FramSize.height*0.91,
                          left: FramSize.width*0.025,
                          child: Container(
                            height: FramSize.height*0.09,
                            width:FramSize.width*0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: toggle.NavigatoBarColor,
    
                            ),
                          ),
                        )
                    
                      ],
                    
                    ),
                  ),
                ],
              ),
            );
          }
          
          }
        ),
      );
      }
    );
  }
}