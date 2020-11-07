import 'dart:ui';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opedia/opedia/qropedia.dart';
import 'package:opedia/slide/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelOne extends StatefulWidget {
//  final CarouselController _controller = CarouselController();
//  IntroSlide introSlide = IntroSlide()  ;
//  const WelOne({Key key}) : super(key: key);



  @override
  _WelOneState createState() => _WelOneState();
}

class _WelOneState extends State<WelOne> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Center(
            child: Container(padding: EdgeInsets.only(left: 20,right: 20,top: 30),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(width: 300,height: 330,
                  child: Stack(
                    children: [
                      Container(width: 300,height: 330,decoration: BoxDecoration( color: Colors.white.withOpacity(0.5), image: DecorationImage(image: AssetImage('assets/welone.png')), )),
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
                    ],
                  ),
                )
              ,Container(alignment: Alignment.centerLeft,
                    width: 400,color: Colors.white,child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'مرحباً بك في مصحفي تطبيق الموسوعة القرآنية التفاعلية', style: TextStyle(fontSize: 25,color: Colors.black,fontFamily: 'tajawalReg',fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center
                      ),
//                      Text(
//                        ' ', style: TextStyle(fontFamily: 'tajawalReg',fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
//
//                      ),

                     SizedBox(height: 25,), Text(
                     "رفيقك الدائم في رحلة فهم القرآن الكريم ومعرفة علومه وتدبر رسالته، ومعينك لتكون من أهل القرآن الكريم أهل الله وخاصته، وعلى صلة دائمة مع الذكر الحكيم من خلال مصحفك الخاص."
                      ,style: TextStyle(fontSize: 15,color: Colors.grey,fontFamily: 'tajawalReg',fontWeight: FontWeight.bold,),textAlign: TextAlign.center,

                      ),

                      SizedBox(height: 45,),
/*                      InkWell(                          onTap: ()async{
                        bool isFirst = true;
                        String ourl = 'https://qpedia.co/en/ha604mqt19gh';
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool('isFirst', isFirst);
                        print (isFirst);

                        Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/en/ha604mqt19gh");

//                        Navigator.pushReplacement(context, MaterialPageRoute(
//                            builder: (context) => QrOpedia(url: ourl,)));
                      } ,
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
                                heroTag: "oncontainer",
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
                      )*/
                      SizedBox(height: 15,),
                      /*Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [InkWell(onTap: ()async{
                          bool isFirst = true;
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool('isFirst', isFirst);
                          print (isFirst);
//                          Navigator.pushReplacement(context, MaterialPageRoute(
//                              builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",) ));
                          Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/en/user/login");


                        } ,
                            child: Text("تسجيل الدخول",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'tajawalReg'),)),Text("لديك حساب؟ ",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: 'tajawalReg'),)],)*/
                    ],
                  ),),
                ],),
            ),
          ),
        ) );}}

class WelTwo extends StatefulWidget {
  const WelTwo({Key key}) : super(key: key);

  @override
  _WelTwoState createState() => _WelTwoState();
}

class _WelTwoState extends State<WelTwo> {
//  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Center(
            child: Container(padding: EdgeInsets.only(left: 20,right: 20,top: 30),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 300,height: 330,
                    child: Stack(
                      children: [
                        Container(width: 300,height: 330,decoration: BoxDecoration( color: Colors.white.withOpacity(0.5), image: DecorationImage(image: AssetImage('assets/weltwo.png')), )),
                        Positioned(bottom: 140,left: 140,
                          child: Center(
                            child: Container(height: 40,width: 40,
//                              child: FloatingActionButton(mini: true,
//                                heroTag: "oncontasdsiner",
//                                backgroundColor: Color(0xff3C8D70),
////                          onPressed: () {},
//                                child: Icon(
//                                  Icons.add,
//                                  color: Colors.white,
//                                ),
//                                foregroundColor: Color(0xff684c4c),
//                              ),
                            ),
                          ),)
                      ],
                    ),
                  )
                  ,Container(alignment: Alignment.centerLeft,
                    width: 400,color: Colors.white,child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'تطبيق مصحفي مصمم ليدعم تدبرك وأنت تتلو من مصحفك', style: TextStyle(fontSize: 25,color: Colors.black,fontFamily: 'tajawalReg',fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.center

                        ),
//                      Text(
//                        ' ', style: TextStyle(fontFamily: 'tajawalReg',fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
//
//                      ),

                        SizedBox(height: 25,), Text(
                          "يمكنك الوصول بسهولة لكل ما يتعلق بصفحات مصحفك الخاص من تلاوات وتسجيلات ومرئيات وتفاسير وشروح وترجمات للمعاني ومؤلفات بعدة لغات، لتنعم بصحبة القرآن الكريم و الاطلاع على علومه دون عناء."
                          ,style: TextStyle(fontSize: 15,color: Colors.grey,fontFamily: 'tajawalReg',fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.center

                        ),

                        SizedBox(height: 45,),
                       /* InkWell(                          onTap: ()async{
                          bool isFirst = true;
                          String ourl = 'https://qpedia.co/en/ha604mqt19gh';
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool('isFirst', isFirst);
                          print (isFirst);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => QrOpedia(url: ourl,)
                          ));
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
                                  heroTag: "oncontainer",
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
                        SizedBox(height: 15,),
                        InkWell( onTap: ()async{
                          bool isFirst = true;
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool('isFirst', isFirst);
                          print (isFirst);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",) ));
                        } ,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("تسجيل الدخول",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'tajawalReg'),),Text("لديك حساب؟ ",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: 'tajawalReg'),)],),
                        )*/
                      ],
                    ),),
                ],),
            ),
          ),
        ) );}

}

class WelThree extends StatefulWidget {
  @override
  _WelThreeState createState() => _WelThreeState();
}

class _WelThreeState extends State<WelThree> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Center(
            child: Container(padding: EdgeInsets.only(left: 20,right: 20,top: 30),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 300,height: 330,
                    child: Stack(
                      children: [
                        Container(width: 300,height: 330,decoration: BoxDecoration( color: Colors.white.withOpacity(0.5), image: DecorationImage(image: AssetImage('assets/welthree.png')), )),
                        Positioned(bottom: 140,left: 140,
                          child: Center(
                            child: Container(height: 40,width: 40,
//                              child: FloatingActionButton(mini: true,
//                                heroTag: "oncontasdsiner",
//                                backgroundColor: Color(0xff3C8D70),
////                          onPressed: () {},
//                                child: Icon(
//                                  Icons.add,
//                                  color: Colors.white,
//                                ),
//                                foregroundColor: Color(0xff684c4c),
//                              ),
                            ),
                          ),)
                      ],
                    ),
                  )
                  ,Container(alignment: Alignment.centerLeft,
                    width: 400,color: Colors.white,child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
'تطبيق مصحفي يساعدك في زيادة معلوماتك القرآنية'
                          , style: TextStyle(fontSize: 25,color: Colors.black,fontFamily: 'tajawalReg',fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.center

                        ),
//                      Text(
//                        ' ', style: TextStyle(fontFamily: 'tajawalReg',fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
//
//                      ),

                        SizedBox(height: 25,), Text(
     "خير معين لك لاستثمار أوقاتك في الاستزادة من زاد القرآن الكريم ودوام الصلة به من خلال برمجة ختماتك المتنوعة وقراءاتك مع خدمات البحث وتدوين الملاحظات والحفظ في محفظتك وغير ذلك الكثير."
                          ,style: TextStyle(fontSize: 15,color: Colors.grey,fontFamily: 'tajawalReg',fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.center

                        ),

                        SizedBox(height: 45,),
                       /* InkWell(
                          onTap: ()async{
                            bool isFirst = true;
                            String ourl = 'https://qpedia.co/en/ha604mqt19gh';
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setBool('isFirst', isFirst);
                            print (isFirst);
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => QrOpedia(url: ourl,)
                            ));
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
                                  heroTag: "oncontainer",
                                  backgroundColor: Color(0xff3C8D70),
                                  onPressed: () async {
                                    bool isFirst = true;
                                    String ourl = 'https://qpedia.co/en/ha604mqt19gh';
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setBool('isFirst', isFirst);
                                    print (isFirst);
                                    Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context) => QrOpedia(url: ourl,)
                                    ));
                                  },
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
                        SizedBox(height: 15,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [InkWell(onTap: ()async{
                  bool isFirst = true;
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool('isFirst', isFirst);
                  print (isFirst);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => QrOpedia(url: "https://qpedia.co/en/user/login",) ));
                  } ,child: Text("تسجيل الدخول",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'tajawalReg'),)),Text("لديك حساب؟ ",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: 'tajawalReg'),)],)*/
                      ],
                    ),),
                ],),
            ),
          ),
        ) );}
}



class ExpandableText extends StatefulWidget {
  ExpandableText(this.text,this.size,this.rang);
  final double size;
  final Color rang;
  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      new AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: new ConstrainedBox(
              constraints: widget.isExpanded
                  ? new BoxConstraints()
                  : new BoxConstraints(maxHeight: 40.0),
              child: new Text(
                widget.text,style: TextStyle(fontSize: widget.size,color: widget.rang,fontFamily: 'tajawalReg',fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      widget.isExpanded
          ? new ConstrainedBox(constraints: new BoxConstraints())
          : SizedBox(height: 40,
            child: new InkWell(
            child: const Text('                                                                                                            '),
            onTap: () => setState(() => widget.isExpanded = true)),
          )
    ]);
  }
}



