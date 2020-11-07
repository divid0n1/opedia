import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opedia/opedia/op_web.dart';
import 'package:opedia/opedia/qropedia.dart';
import 'package:opedia/slide/qrSlide.dart';
import 'package:permission_handler/permission_handler.dart';

/// 使用前需已经获取相关权限
/// Relevant privileges must be obtained before use
class QrcodeR extends StatefulWidget {
  final Widget headerWidget;
  final Future Function(String) onScan;
  final double scanBoxRatio;
  final Color boxLineColor;
  final Widget helpWidget;
  QrcodeR({
    Key key,
    @required this.onScan,
    this.headerWidget,
    this.boxLineColor = Colors.green,
    this.helpWidget,
    this.scanBoxRatio = 0.85,
  }) : super(key: key);

  @override
  QrcodeRState createState() => new QrcodeRState();
}

/// 扫码后的后续操作
/// ```dart
/// GlobalKey<QrcodeReaderViewState> qrViewKey = GlobalKey();
/// qrViewKey.currentState.startScan();
/// ```
class QrcodeRState extends State<QrcodeR>
    with TickerProviderStateMixin {
  String prot = 'https://';

  QrReaderViewController _controller;
  AnimationController _animationController;
  bool openFlashlight;
  Timer _timer;
  @override
  void initState() {
    _permission();
    super.initState();
    openFlashlight = false;
    _initAnimation();
  }
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


  void _initAnimation() {
    setState(() {
      _animationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000));
    });
    _animationController
      ..addListener(_upState)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _timer = Timer(Duration(seconds: 1), () {
            _animationController?.reverse(from: 1.0);
          });
        } else if (state == AnimationStatus.dismissed) {
          _timer = Timer(Duration(seconds: 1), () {
            _animationController?.forward(from: 0.0);
          });
        }
      });
    _animationController.forward(from: 0.0);
  }

  void _clearAnimation() {
    _timer?.cancel();
    if (_animationController != null) {
      _animationController?.dispose();
      _animationController = null;
    }
  }

  void _upState() {
    setState(() {});
  }

  void _onCreateController(QrReaderViewController controller) async {
    _controller = controller;
    _controller.startCamera(_onQrBack);
  }

  bool isScan = false;
  Future _onQrBack(data, _) async {
    if (isScan == true) return;
    isScan = true;
    stopScan();
    String compUrl = '$prot$data';
    Navigator.pushReplacement(context, MaterialPageRoute(

        builder: (context) => QrOpedia(url: compUrl,)
    ));
//    await widget.onScan(data);
  }

  void startScan() {
    isScan = false;
    _controller.startCamera(_onQrBack);
    _initAnimation();
  }

  void stopScan() {
    _clearAnimation();
    _controller.stopCamera();
  }

  Future<bool> setFlashlight() async {
    openFlashlight = await _controller.setFlashlight();
    setState(() {});
    return openFlashlight;
  }

  Future _scanImage() async {
    stopScan();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      startScan();
      return;
    }
    final rest = await FlutterQrReader.imgScan(image);
    print(rest);
    String compUrl = '$prot$rest';
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => QrOpedia(url: compUrl,)
    ));
//    await widget.onScan(rest);
//    startScan();
  }

  @override
  Widget build(BuildContext context) {
    var _hig = MediaQuery.of(context).size.height;
    var _wid = MediaQuery.of(context).size.width;
    final flashOpen = Image.asset(
      "assets/tool_flashlight_open.png",
      package: "flutter_qr_reader",
      width: 35,
      height: 35,
      color: Colors.white,
    );
    final flashClose = Image.asset(
      "assets/tool_flashlight_close.png",
      package: "flutter_qr_reader",
      width: 35,
      height: 35,
      color: Colors.white,
    );
    return Material(
      color: Colors.white,
      child: LayoutBuilder(builder: (context, constraints) {
        final qrScanSize = constraints.maxWidth * widget.scanBoxRatio;
        final mediaQuery = MediaQuery.of(context);
        if (constraints.maxHeight < qrScanSize * 1.5) {
          print("建议高度与扫码区域高度比大于1.5");
        }
        return Stack(
          children: <Widget>[

            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,

              child: QrReaderView(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                callback: _onCreateController,
              ),
            ),
            if (widget.headerWidget != null) widget.headerWidget,
//            Container(
//                decoration: BoxDecoration(image: DecorationImage(colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),image: AssetImage("assets/qrbg.png"),fit: BoxFit.fill))),


            Align(alignment: Alignment.bottomCenter,
                child: Container(width: _wid,
                  height: _hig/8, decoration: BoxDecoration( color: Colors.white,
        borderRadius: new BorderRadius.only( topLeft: const Radius.circular(30.0),
        topRight: const Radius.circular(30.0),
        ), border: new Border.all(
        color: Colors.white, width: 1.0, ), ),
                child: Stack(
                  children: [
                    Align(alignment: Alignment.topRight,
                      child:                   Container(padding: EdgeInsets.all(7.0),
                        width: 60,
                        height: 60,
//                        decoration: BoxDecoration(color: Colors.black,
//                          borderRadius: BorderRadius.all(Radius.circular(40)),
//                          border: Border.all(color: Colors.white30, width: 12),
//                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/tool_qrcode.png",
                          package: "flutter_qr_reader",
                          width: 35,
                          height: 35,
                          color: Color(0xff308164).withOpacity(0.5),
                        ),
                      ),),
                    Align(alignment: Alignment.topLeft,
                      child:                   GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: _scanImage,
                        child: Container(padding: EdgeInsets.all(7.0),
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/tool_img.png",
                            package: "flutter_qr_reader",
                            width: 25,
                            height: 25,
                            color: Color(0xff308164).withOpacity(0.5),
                          ),
                        ),
                      ),),
                    Center(
                      child: InkWell(onTap: (){
//                        Navigator.pushReplacement(context, MaterialPageRoute(
//                          builder: (context) => QRSlide()
//
//        builder: (context) => QrOpedia(url: 'https://qpedia.co/en/ha604mqt19gh',)
//                      ));
                        Navigator.of(context).pushNamed('/url',arguments: "https://qpedia.co/ar/mobile");


                        ;},
                        child: Container(width: 200,height: 50,
        decoration: BoxDecoration( color: Color(0xff308164),
                          borderRadius: new BorderRadius.only( topLeft: const Radius.circular(30.0),
                              topRight: const Radius.circular(30.0), bottomLeft: const Radius.circular(30.0),
                              bottomRight: const Radius.circular(30.0)), border: new Border.all(
                            color: Colors.white, width: 1.0, ), ),child: Center(child: Text("إلغاء المسح",style: TextStyle(fontFamily: "tajawalReg",fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),),
                      ),
                    ),
                  ],
                ),)),
            Positioned(
              left: (constraints.maxWidth - qrScanSize) / 2,
              top: (constraints.maxHeight - qrScanSize) * 0.333333,
              child: CustomPaint(
                painter: QrScanBoxPainter(
                  boxLineColor: widget.boxLineColor,
                  animationValue: _animationController?.value ?? 0,
                  isForward:
                  _animationController?.status == AnimationStatus.forward,
                ),
                child: SizedBox(
                  width: qrScanSize,
                  height: qrScanSize,
                ),
              ),
            ),
            Positioned(
              top: (constraints.maxHeight - qrScanSize) * 0.333333 +
                  qrScanSize +
                  24,
              width: constraints.maxWidth,
              child: Align(
                alignment: Alignment.center,
                child: DefaultTextStyle(
                  style: TextStyle(color: Colors.white),
                  child: widget.helpWidget ?? Text(""),
                ),
              ),
            ),
            Positioned(
              top: (constraints.maxHeight - qrScanSize) * 0.333333 +
                  qrScanSize -
                  12 -
                  35,
              width: constraints.maxWidth,
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: setFlashlight,
                  child: openFlashlight ? flashOpen : flashClose,
                ),
              ),
            ),
            Positioned(
              width: constraints.maxWidth,
              bottom: constraints.maxHeight == mediaQuery.size.height
                  ? 12 + mediaQuery.padding.top
                  : 12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
//                  GestureDetector(
//                    behavior: HitTestBehavior.translucent,
//                    onTap: _scanImage,
//                    child: Container(
//                      width: 45,
//                      height: 45,
//                      alignment: Alignment.center,
//                      child: Image.asset(
//                        "assets/tool_img.png",
//                        package: "flutter_qr_reader",
//                        width: 25,
//                        height: 25,
//                        color: Colors.blue,
//                      ),
//                    ),
//                  ),
//                  Container(
//                    width: 80,
//                    height: 80,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(40)),
//                      border: Border.all(color: Colors.white30, width: 12),
//                    ),
//                    alignment: Alignment.center,
//                    child: Image.asset(
//                      "assets/tool_qrcode.png",
//                      package: "flutter_qr_reader",
//                      width: 35,
//                      height: 35,
//                      color: Colors.white54,
//                    ),
//                  ),
                  SizedBox(width: 45, height: 45),
                ],
              ),
            ),

          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    _clearAnimation();
    super.dispose();
  }
}

class QrScanBoxPainter extends CustomPainter {
  final double animationValue;
  final bool isForward;
  final Color boxLineColor;

  QrScanBoxPainter(
      {@required this.animationValue,
        @required this.isForward,
        this.boxLineColor})
      : assert(animationValue != null),
        assert(isForward != null);

  @override
  void paint(Canvas canvas, Size size) {
    final borderRadius = BorderRadius.all(Radius.circular(12)).toRRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    canvas.drawRRect(
      borderRadius,
      Paint()
        ..color = Colors.white54
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final path = new Path();
    // leftTop
    path.moveTo(0, 50);
    path.lineTo(0, 12);
    path.quadraticBezierTo(0, 0, 12, 0);
    path.lineTo(50, 0);
    // rightTop
    path.moveTo(size.width - 50, 0);
    path.lineTo(size.width - 12, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 12);
    path.lineTo(size.width, 50);
    // rightBottom
    path.moveTo(size.width, size.height - 50);
    path.lineTo(size.width, size.height - 12);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 12, size.height);
    path.lineTo(size.width - 50, size.height);
    // leftBottom
    path.moveTo(50, size.height);
    path.lineTo(12, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 12);
    path.lineTo(0, size.height - 50);

    canvas.drawPath(path, borderPaint);

    canvas.clipRRect(
        BorderRadius.all(Radius.circular(12)).toRRect(Offset.zero & size));

    // 绘制横向网格
    final linePaint = Paint();
    final lineSize = size.height * 0.45;
    final leftPress = (size.height + lineSize) * animationValue - lineSize;
    linePaint.style = PaintingStyle.stroke;
    linePaint.shader = LinearGradient(
      colors: [Colors.transparent, boxLineColor],
      begin: isForward ? Alignment.topCenter : Alignment(0.0, 2.0),
      end: isForward ? Alignment(0.0, 0.5) : Alignment.topCenter,
    ).createShader(Rect.fromLTWH(0, leftPress, size.width, lineSize));
    for (int i = 0; i < size.height / 5; i++) {
      canvas.drawLine(
        Offset(
          i * 5.0,
          leftPress,
        ),
        Offset(i * 5.0, leftPress + lineSize),
        linePaint,
      );
    }
    for (int i = 0; i < lineSize / 5; i++) {
      canvas.drawLine(
        Offset(0, leftPress + i * 5.0),
        Offset(
          size.width,
          leftPress + i * 5.0,
        ),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(QrScanBoxPainter oldDelegate) =>
      animationValue != oldDelegate.animationValue;

  @override
  bool shouldRebuildSemantics(QrScanBoxPainter oldDelegate) =>
      animationValue != oldDelegate.animationValue;
}