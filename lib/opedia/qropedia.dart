import 'dart:async';
import 'dart:io'; 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opedia/qrcode/qrmain.dart';
import 'package:opedia/slide/qrSlide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QrOpedia extends StatefulWidget {
  final url;
  QrOpedia({this.url});
  @override
  _QrOpediaState createState() => _QrOpediaState();
}

class _QrOpediaState extends State<QrOpedia> {

  bool isLoading=true;
  bool brIsFirst = true;
  @override
  void initState() {

    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

  }

  Future <bool> funIsFirstTime()async{
    Navigator.of(context).pushNamed('/QrPage');

   /* SharedPreferences prefs = await SharedPreferences.getInstance();
    brIsFirst = prefs.getBool('brIsFirst');
//    print("New isFirstTime:${isFirstTime}");
  if(brIsFirst == false){
//    builder: (context) => QrcodeR()
    print("with false:${brIsFirst}");
    String ourl = 'https://qpedia.co/ar/QR';
  *//*  Navigator.pushReplacement(context, MaterialPageRoute(

        builder: (context) => QrcodeR()
////        builder: (context) => QRSlide()

//          builder: (context) => QrOpedia(url: ourl,)
    ));*//*
    Navigator.of(context).pushNamed('/QrcodeR');
  }else {
//    Navigator.pushReplacement(context, MaterialPageRoute(
//        builder: (context) => QRSlide()
//
////        builder: (context) => QrOpedia(url: ourl,)
//    ));
    Navigator.of(context).pushNamed('/QRSlide');
    print("with else:${brIsFirst}");}
    return brIsFirst;*/
  }
//  String url = 'https://qpedia.co/en/ha604mqt19gh';

  Widget fAB() {
    final Completer<WebViewController> _controller =
    Completer<WebViewController>();
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> snapshot) {
          final bool webViewReady =
              snapshot.connectionState == ConnectionState.done;
          final WebViewController controller = snapshot.data;

          return Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
/*              FloatingActionButton(mini: true,heroTag: "replay",
                foregroundColor: Color(0xffc79938),
                backgroundColor: Color(0xfff5f3da),
                onPressed: !webViewReady
                    ? null
                    : () {
                  controller.reload();
                },
                child: const Icon(Icons.replay),
              ),*/
InkWell(onTap: (){
//  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QrcodeR()));
//  print('hello');
  funIsFirstTime();
},
  child:   Container(height: 50,width: 50,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/qricon.png")),
  //  color: Color(0xff308164),
    borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(30.0),
        topRight: const Radius.circular(30.0),
        bottomLeft: const Radius.circular(30.0),
        bottomRight: const Radius.circular(30.0)),
    border: new Border.all(color: Colors.white,width: 1.0,),
  )),
)
/*              FloatingActionButton(
                heroTag: "qrcode",
//                  mini: true,
                backgroundColor: Color(0xfff5f3da),
                onPressed: () async{
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => QrcodeR()
                  ));
                },
                foregroundColor: Color(0xffc79938),
                child: Icon(Icons.add_a_photo),
              )
*/
            ],
          );

          return Container();
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(),
        preferredSize: Size.fromHeight(0.0),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebResourceError: (error) {
             Text ('Errorr');
             print("0a: $error");
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),  isLoading ? Center( child: CircularProgressIndicator(),) : Stack(),
        ],

      ),
      floatingActionButton: fAB(),
    );

  }

}
