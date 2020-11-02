import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:opedia/slide/intro.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file:///C:/Users/Admin/Desktop/Webchat/opedia/lib/qrcode/qrsupport.dart';
import 'file:///C:/Users/Admin/Desktop/Webchat/opedia/lib/qrcode/qrmain.dart';

import 'opedia/op_web.dart';
import 'opedia/opedia.dart';
import 'opedia/qropedia.dart';

class FadeTransitionSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Fade();
}

class _Fade extends State<FadeTransitionSample> with TickerProviderStateMixin {
  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
//    _permission();
    super.initState();
    animation = AnimationController(vsync: this, duration: Duration(seconds: 3),);
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation);

    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animation.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white.withOpacity(0.0),
      body: Container(
        child: Center(
          child: FadeTransition(
            opacity: _fadeInFadeOut,
            child: Container(height: 150,width: 300,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/spc.png"))),),
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return StartState();
  }
}

class StartState extends State<SplashScreen> {
  bool isFirst;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    isFirstF();
  }
  Future isFirstF()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    isFirst = prefs.getBool('isFirst');
//    print("isFirst before Value:${isFirst}");
//    isFirst = true;
    print("isFirst Value:${isFirst}");

    return isFirst;

  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, check);
  }
  route(){
    if(isFirst == null){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => IntroSlide()
//          builder: (context) => QrOpedia(url: ourl,)
      ));
      print("isFirst Val:${isFirst}");
    }else if (isFirst == true){
          String ourl = 'https://qpedia.co/en/ha604mqt19gh';
//      String ourl = 'https://qpedia.co/ar/QR';
//  String ourl = 'http://ameyaahr.com';
//      Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/en/ha604mqt19gh");
      Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/ar/mobile");
//          Navigator.pushReplacement(context, MaterialPageRoute(
//        builder: (context) => IntroSlide()
//          builder: (context) => OpWeb(ourl: ourl,)
//      ));
    }
  print('its done');
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return route();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return route();
    }
    return startTimer();
  }






  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Color(0xff006045),
      body: Stack(
//         fit: StackFit.expand,
        children: <Widget>[
//          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/spu.png"))),),
          Stack(children: [
            Align(alignment: Alignment.topCenter,
              child: Container(height: 150,width: 300,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/spu.png"))),),),
            Align(alignment: Alignment.center,
            child: FadeTransitionSample(),),
            Align(alignment: Alignment.bottomCenter,
            child: Container(height: 150,width: 300,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/spb.png"))),)),
//
          ],),
//          Container(
//            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/splashN.png"),fit: BoxFit.fill)),
//          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//Container(height: 100, width: 200,
//    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/OpediaLogo.png'),fit: BoxFit.contain)),
//    /*child: Text('Opedia'),*/),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          color: Color(0xffc79938),
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
//                    Center(child: CircularProgressIndicator()),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
//                    Text(
//                      "Loading...",
//                      style: TextStyle(
//                          color: Color(0xff309054),
//                          fontSize: 18,
//                          fontWeight: FontWeight.bold),
//                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}