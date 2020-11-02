import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:opedia/opedia/qropedia.dart';
import 'package:opedia/slide/wins.dart';
import 'package:shared_preferences/shared_preferences.dart';
final CarouselController xcontroller = CarouselController();
class IntroSlide extends StatefulWidget {
//  int xcurrentIndex = 0;
//  IntroSlide({this.xcurrentIndex});

  @override
  _IntroSlideState createState() => _IntroSlideState();
}

class _IntroSlideState extends State<IntroSlide> {
//  final CarouselController xcontroller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

//  ixcurrentIndex=0;
  int xcurrentIndex = 0;
  List cardList=[
    WelOne(),
    WelTwo(),
    WelThree(),
  ];

  nextSlide(){
xcontroller.nextPage();
//    _currentIndex ++;
//    setState(() {
//
//    });
  }
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        CarouselSlider(carouselController: xcontroller,
          options: CarouselOptions(
            initialPage: xcurrentIndex,
//            height: 200.0,
//            autoPlay: true,
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
//            autoPlayInterval: Duration(seconds: 3),
//            autoPlayAnimationDuration: Duration(milliseconds: 800),
//            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                xcurrentIndex = index;
              });
            },
          ),
          items: cardList.map((card){
            return Builder(
                builder:(BuildContext context){
                  return Container(
                    height: MediaQuery.of(context).size.height*0.30,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.blueAccent,
                      child: card,
                    ),
                  );
                }
            );
          }).toList(),
        ),
Align(alignment: Alignment.bottomCenter, child: Container(height: height/4,
    decoration: BoxDecoration(color: Colors.white,
    borderRadius: new BorderRadius.only(
    topLeft: const Radius.circular(30.0),
    topRight: const Radius.circular(30.0),),
    border: new Border.all(color: Colors.white,width: 1.0,),
    ),
child: Column(children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: cardList.map((url) {
      int index = cardList.indexOf(url);
      return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: xcurrentIndex == index
              ? Color(0xffc6942c).withOpacity(1.0)
              : Color(0xffc6942c).withOpacity(0.5),
        ),
      );
    }).toList(),
  ),

  Material(color: Colors.white.withOpacity(0.0),
    child: InkWell(onTap: ()async{



      bool isFirst = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isFirst', isFirst);
      print (isFirst);
//      Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/en/ha604mqt19gh");
      Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/ar/user/register");

    },
      child: Container(                      decoration: BoxDecoration(color: Color(0xff308164),
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: const Radius.circular(30.0),
            bottomLeft: const Radius.circular(30.0),
            bottomRight: const Radius.circular(30.0)),
        border: new Border.all(color: Colors.white,width: 1.0,),
      ),
        height: 60,
        width: 300,
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'إبدأ الأن',
              style: TextStyle(color: Colors.white,fontFamily: 'tajawalReg',fontWeight: FontWeight.bold, fontSize: 22),
            ),SizedBox(width: 50,),
            FloatingActionButton(mini: true,
              heroTag: "absscd",
              backgroundColor: Color(0xff3C8D70),
              onPressed: () => xcontroller.nextPage(),
//                              IntroSlide insl;
//                              insl.createState().xcontroller.nextPage();
//                                final CarouselController xcontroller = CarouselController();
//                                xcontroller.nextPage();
//                              introSlide();
//                              introSlide.xcurrentIndex +;
//                                onPressed: () => _controller.nextPage(),
//                              },

//                                introSlide.createState().nextSlide();
//introSlide.
//                              },
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              foregroundColor: Color(0xff684c4c),
            ),SizedBox(width: 10,),
          ],
        ),
      ),
    ),
  ),
SizedBox(height: 15,),
  Material(color: Colors.white,
    child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [InkWell(onTap: ()async{
        bool isFirst = true;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isFirst', isFirst);
        print (isFirst);
//        Navigator.pushReplacement(context, MaterialPageRoute(
//            builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",) ));
        Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/en/user/login");
      } ,
          child: Text("تسجيل الدخول",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'tajawalReg'),)),Text("لديك حساب؟ ",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: 'tajawalReg'),)],),
  )
],),
),),

      ],
    );
  }
}
