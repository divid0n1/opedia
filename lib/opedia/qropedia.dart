import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opedia/opedia/test.dart';
import 'package:opedia/qrcode/qrmain.dart';
import 'package:opedia/slide/qrSlide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QRButtonControler {
  final _qrButtonStream = StreamController<bool>();
  StreamSink<bool> get qrBoolSink => _qrButtonStream.sink;
  Stream<bool> get qrBoolStream => _qrButtonStream.stream;
}


class QrOpedia extends StatefulWidget {

  final url;
  QrOpedia({this.url});
  @override
  _QrOpediaState createState() => _QrOpediaState();
}

class _QrOpediaState extends State<QrOpedia> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  bool isLoading=true;
  bool brIsFirst = true;
  bool isQrPage;
  final qrButtonControler = QRButtonControler();

  _printUrl() {
    String ur;
 _controller.future.asStream().listen((event) async{
  ur = await event.currentUrl();
  print("dataUR:${ur}");
  if(ur == "https://qpedia.co/ar/QR"){
    isQrPage = true;
    qrButtonControler.qrBoolSink.add(isQrPage);
    print("isQrPage${isQrPage}");
//    setState(() { });
  }else {
    isQrPage = false;
    qrButtonControler.qrBoolSink.add(isQrPage);
    print("isQrPage:${isQrPage}");
//    setState(() {  });
  }
});


  }

  @override
  void initState() {
//    _printUrl();
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

/*

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
//          final String url = await snapshot.data.currentUrl();

          return Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(onTap: ()async{
//  final String url = await snapshot.data.currentUrl();
//                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WebViewExample()));
  await print('${snapshot.data.currentUrl()}');

//controller.currentUrl();
//  funIsFirstTime();
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


*/
/*              FloatingActionButton(mini: true,heroTag: "replay",
                foregroundColor: Color(0xffc79938),
                backgroundColor: Color(0xfff5f3da),
                onPressed: !webViewReady
                    ? null
                    : () {
                  controller.reload();
                },
                child: const Icon(Icons.replay),
              ),*//*

*/
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
*//*

            ],
          );

          return Container();
        });
  }

  Widget _fAB() {
    return FutureBuilder<WebViewController>(


        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {

          if (controller.hasData) {
            String te;
//            return Text("${te}",style: TextStyle(fontSize: 40,),);
            tef()async{
//              await controller.data.currentUrl();
              te = await controller.data.currentUrl();
              return Text("${te}",style: TextStyle(fontSize: 40,),);

              print("tef:$te");
              if(te == "https://qpedia.co/ar/QR"){
                print("te is true:");
//                return Container(height: 100,width: 100,color: Colors.yellow,);
              }
            }
            tef();

            return te == "https://qpedia.co/ar/QR" ? Container(height: 50,width: 50,color: Colors.orange,) : Container(height: 50,width: 50,color: Colors.blue,);
//            return te == "https://qpedia.co/ar/mobile" ? Container(height: 50,width: 50,color: Colors.orange,) : Container(height: 50,width: 50,color: Colors.blue,);
//            return tef();
          }
          return Container();
        });
  }
*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(),
        preferredSize: Size.fromHeight(0.0),
      ),
      body: Stack(
        children: [
          WebView(onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
            onPageStarted: _printUrl(),
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
Align(alignment: Alignment.bottomCenter,child: Padding(padding: EdgeInsets.only(bottom: 200,),child: Container(
  height: 50,width: 50,child:StreamBuilder(
  stream: qrButtonControler.qrBoolStream,
  builder: (context,snap){
    if(isQrPage == true ){
      return    InkWell(onTap: (){ Navigator.of(context).pushNamed('/QrcodeR');},
        child: Container(height: 50,width: 50,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/qricon.png")),
          //  color: Color(0xff308164),
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0),
              bottomLeft: const Radius.circular(30.0),
              bottomRight: const Radius.circular(30.0)),
          border: new Border.all(color: Colors.white,width: 1.0,),
        )),
      );
    }
    return Container();
  },
),
),),)
        ],

      ),
//      floatingActionButton: _fAB(),
    );

  }

}
