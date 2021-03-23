import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:opedia/opedia/qropedia.dart';
import 'package:opedia/qrcode/qrmain.dart';
import 'package:opedia/slide/wins.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

final CarouselController qcontroller = CarouselController();

class QRSlide extends StatefulWidget {
  @override
  _QRSlideState createState() => _QRSlideState();
}

class _QRSlideState extends State<QRSlide> {

  Future _permission()async{
    var status = await Permission.camera.status;
    if (status.isUndetermined) {
      Permission.camera.request();

      // We didn't ask for permission yet.
      print(status);
    }

// You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
/*//    final PermissionHandler _permissionHandler = PermissionHandler();
    //
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.camera]);
    print(permissions);
    if (permissions[PermissionGroup.camera] == PermissionStatus.granted) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Text("ok"),
          );
        },
      );
      setState(() {
        isOk = true;
      });
    }*/

    //
  }


  @override
  void initState() {
    _permission();
    super.initState();
  }

  int qcurrentIndex = 0;
  List cardList = [
    QrOne(),
    QrTwo(),
    QrThree(),
  ];

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
        CarouselSlider(
          carouselController: qcontroller,
          options: CarouselOptions(
            initialPage: qcurrentIndex,
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                qcurrentIndex = index;
              });
            },
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                child: Card(
//                  color: Colors.blueAccent,
                  child: card,
                ),
              );
            });
          }).toList(),
        ),
//        Row(
//          children: <Widget>[
//            Text("data")
//          ],
//        )
//      RaisedButton(onPressed: ()=>xcontroller.nextPage(),child: Text('asdfas'),)
        Align(alignment: Alignment.bottomCenter,child:Container(    decoration: BoxDecoration(color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: const Radius.circular(30.0),),
          border: new Border.all(color: Colors.white,width: 1.0,),
        ),
          height: height/4,child: Material(

          color: Colors.white.withOpacity(0.0),
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
                  color: qcurrentIndex == index
                      ? Color(0xffc6942c).withOpacity(1.0)
                      : Color(0xffc6942c).withOpacity(0.5),
                ),
              );
            }).toList(),
          ),
            InkWell(
              onTap: ()async{
                bool isFirst = false;
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('brIsFirst', isFirst);
                print (isFirst);
//                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QrcodeR()));
//                Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/en/user/login");
                Navigator.of(context).pushNamed('/QrcodeR');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff308164),
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0)),
                  border: new Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                height: 60,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'إبدأ الأن',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'tajawalReg',
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    FloatingActionButton(
                      mini: true,
                      heroTag: "oncontadiner",
                      backgroundColor: Color(0xff3C8D70),
                      onPressed: () => qcontroller.nextPage(),
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
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: ()async{
//                              Navigator.pushReplacement(context, MaterialPageRoute(
////        builder: (context) => IntroSlide()
//                                  builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",)
//                              ));
                  bool isFirst = false;
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool('brIsFirst', isFirst);
                  print (isFirst);
                  Navigator.pushReplacement(context, MaterialPageRoute(
//        builder: (context) => IntroSlide()
                      builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",)
                  ));
//                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QrcodeR()));
                } ,
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'tajawalReg'),
                  ),
                ),
                Text(
                  "لديك حساب؟ ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'tajawalReg'),
                )
              ],
            )

        ],),),),),
//        Padding(padding: EdgeInsets.only(top: 470),child:         ,),
      ],

    );
  }
}

class QrOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 330,
                    child: Stack(
                      children: [
                        Container(
                            width: 300,
                            height: 330,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              image: DecorationImage(
                                  image: AssetImage('assets/brone.png')),
                            )),

/*
                        Positioned(bottom: 140,left: 140,
                          child: Center(
                            child: Container(height: 40,width: 40,
                              child: FloatingActionButton(mini: true,
                                heroTag: "oncontasdsiner",
                                backgroundColor: Color(0xff3C8D70),
//                          onPressed: () {},
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                foregroundColor: Color(0xff684c4c),
                              ),
                            ),
                          ),)
*/
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 400,
                    color: Colors.white,
                    child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ExpandableText(
                          "تطبيق مصحفي بوابتك لموسوعة قرآنية ضخمة ومتنامية",
                          25,
                          Colors.black,
                        ),
//                      Text(
//                        ' ', style: TextStyle(fontFamily: 'tajawalReg',fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
//
//                      ),

                        SizedBox(
                          height: 25,
                        ),
                        ExpandableText(
                          "تقدم لك أمهات كتب علوم القرآن الكريم وتفاسيره وشروحه وترجمات معانيه الموثوقة، وتسعى لتضمين المزيد من المراجع الموثوقة والمؤلفات الحديثة ضمن باقات اشتراك مناسبة.",
                          15.0,
                          Colors.grey,
                        ),

                        SizedBox(
                          height: 45,
                        ),
                       /* InkWell(
                          onTap: ()async{
                            bool isFirst = false;
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setBool('brIsFirst', isFirst);
                            print (isFirst);
//                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QrcodeR()));
                            Navigator.of(context).pushNamed('/QrcodeR');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff308164),
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(30.0),
                                  topRight: const Radius.circular(30.0),
                                  bottomLeft: const Radius.circular(30.0),
                                  bottomRight: const Radius.circular(30.0)),
                              border: new Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            height: 60,
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'إبدأ الأن',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'tajawalReg',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  heroTag: "onacontainer",
                                  backgroundColor: Color(0xff3C8D70),
                                  onPressed: () => qcontroller.nextPage(),
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
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),*/
                        SizedBox(
                          height: 15,
                        ),
                       /* Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(onTap: ()async{
//                              Navigator.pushReplacement(context, MaterialPageRoute(
////        builder: (context) => IntroSlide()
//                                  builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",)
//                              ));
                              bool isFirst = false;
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool('brIsFirst', isFirst);
                              print (isFirst);
                           *//*   Navigator.pushReplacement(context, MaterialPageRoute(
//        builder: (context) => IntroSlide()
                                  builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",)
                              ));*//*
//                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QrcodeR()));
                              Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/en/user/login");

                            } ,
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'tajawalReg'),
                              ),
                            ),
                            Text(
                              "لديك حساب؟ ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'tajawalReg'),
                            )
                          ],
                        )*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class QrTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( width: 300,  height: 330,
                    child: Stack(
                      children: [
                        Container( width: 300, height: 330, decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5), image: DecorationImage(
                                  image: AssetImage('assets/brtwo.png')),
                            )), ], ), ),
                  Container( alignment: Alignment.centerLeft, width: 400, color: Colors.white,
                    child: Column(  children: <Widget>[
                        ExpandableText(
                          "تطبيق مصحفي وسيلتك لتفاعل أفضل مع القرآن الكريم",
                          25, Colors.black, ),
                      SizedBox( height: 25, ),
                        ExpandableText(
                          "يتيح لك تثبيت فهمك من خلال المشاركة في الاختبارات والمسابقات، وأن تسجل خواطرك، ومشاركة أصحابك في جلسات التدبر وثمراتها، وأن تراجع حفظك وإتقانك للتجويد، وغير ذلك من الخدمات الفريدة والقادمة تباعاً.",
                          15.0, Colors.grey, ),
                        SizedBox( height: 45, ),
                        /*InkWell( onTap: () async{bool isFirst = false;
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool('brIsFirst', isFirst);
                        print (isFirst);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QrcodeR()));},
                          child: Container( decoration: BoxDecoration( color: Color(0xff308164),
                              borderRadius: new BorderRadius.only( topLeft: const Radius.circular(30.0),
                                  topRight: const Radius.circular(30.0), bottomLeft: const Radius.circular(30.0),
                                  bottomRight: const Radius.circular(30.0)), border: new Border.all(
                                color: Colors.white, width: 1.0, ), ),
                            height: 60,  width: 300,   child: Row( mainAxisAlignment: MainAxisAlignment.end,
                              children: [ Text(
                                  'إبدأ الأن',
                                  style: TextStyle( color: Colors.white, fontFamily: 'tajawalReg', fontWeight: FontWeight.bold, fontSize: 22),
                                ),
                                SizedBox(  width: 50, ),
                                FloatingActionButton(
                                  mini: true,
                                  heroTag: "oncontainers",
                                  backgroundColor: Color(0xff3C8D70),
                                  onPressed: () => qcontroller.nextPage(),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  foregroundColor: Color(0xff684c4c),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),*/
                        SizedBox(
                          height: 15,
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell( onTap: ()async{
                              bool isFirst = false;
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool('brIsFirst', isFirst);
                              print (isFirst);
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",)
                              ));
                            },
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'tajawalReg'),
                              ),
                            ),
                            Text(
                              "لديك حساب؟ ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'tajawalReg'),
                            )
                          ],
                        )*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class QrThree extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( width: 300,  height: 330,
                    child: Stack(
                      children: [
                        Container( width: 300, height: 330, decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5), image: DecorationImage(
                            image: AssetImage('assets/brthree.png')),
                        )), ], ), ),
                  Container( alignment: Alignment.centerLeft, width: 400, color: Colors.white,
                    child: Column(  children: <Widget>[
                      ExpandableText(
"تطبيق مصحفي وسيلتك لتفاعل أفضل مع القرآن الكريم",
                        25, Colors.black, ),
                      SizedBox( height: 25, ),
                      ExpandableText(
                        "يتيح لك تثبيت فهمك من خلال المشاركة في الاختبارات والمسابقات، وأن تسجل خواطرك، ومشاركة أصحابك في جلسات التدبر وثمراتها، وأن تراجع حفظك وإتقانك للتجويد، وغير ذلك من الخدمات الفريدة والقادمة تباعاً."
,                        15.0, Colors.grey, ),
                      SizedBox( height: 45, ),
                   /*   InkWell( onTap: () async {
                        bool isFirst = false;
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool('brIsFirst', isFirst);
                        print (isFirst);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QrcodeR()));

                      },
                        child: Container( decoration: BoxDecoration( color: Color(0xff308164),
                          borderRadius: new BorderRadius.only( topLeft: const Radius.circular(30.0),
                              topRight: const Radius.circular(30.0), bottomLeft: const Radius.circular(30.0),
                              bottomRight: const Radius.circular(30.0)), border: new Border.all(
                            color: Colors.white, width: 1.0, ), ),
                          height: 60,  width: 300,   child: Row( mainAxisAlignment: MainAxisAlignment.end,
                            children: [ Text(
                              'إبدأ الأن',
                              style: TextStyle( color: Colors.white, fontFamily: 'tajawalReg', fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                              SizedBox(  width: 50, ),
                              FloatingActionButton(
                                mini: true,
                                heroTag: "on2container",
                                backgroundColor: Color(0xff3C8D70),
                                onPressed: () => qcontroller.nextPage(),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                foregroundColor: Color(0xff684c4c),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(onTap: ()async{bool isFirst = false;
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool('brIsFirst', isFirst);
                          print (isFirst);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",)
                          )); } ,
                            child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'tajawalReg'),
                            ),
                          ),
                          Text(
                            "لديك حساب؟ ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'tajawalReg'),
                          )
                        ],
                      )*/
                    ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

