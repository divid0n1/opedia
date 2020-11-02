import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opedia/qrcode/qrmain.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Opedia extends StatefulWidget {
  @override
  _OpediaState createState() => _OpediaState();
}

class _OpediaState extends State<Opedia> {

  bool isLoading=true;
  @override
  void initState() {

    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
String url = 'https://qpedia.co/en/ha604mqt19gh';
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
            initialUrl: this.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? Center( child: CircularProgressIndicator(),)
              : Stack(),
          Align(alignment: Alignment.bottomRight,child: FloatingActionButton(
            heroTag: "aqrcode",
            mini: true,
            backgroundColor: Color(0xfff5f3da),
            onPressed: () async{
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => QrcodeR()
              ));
              },
            foregroundColor: Color(0xffc79938),
            child: Icon(Icons.add_a_photo),
          ),)
        ],

      ),
    );
  }
}
