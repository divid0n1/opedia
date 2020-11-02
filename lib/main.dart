import 'package:flutter/material.dart';
import 'package:opedia/qrcode/qrmain.dart';
import 'package:opedia/slide/qrSlide.dart';
import 'package:opedia/splash_screen.dart';

import 'opedia/qropedia.dart';
import 'opedia/qrpage.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
//      initialRoute: '/',
//      onGenerateRoute: (settings){
//
//      },
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final url = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case '/url':
      // Validation of correct data type
        if (url is String) {
          return MaterialPageRoute(
            builder: (_) => QrOpedia(
              url: url,
            ),
          );
        }
        break;
      case '/QrcodeR':
        return MaterialPageRoute(builder: (_) => QrcodeR());
        break; case '/QRSlide': return MaterialPageRoute(builder: (_) => QRSlide());
        break; case '/QrPage': return MaterialPageRoute(builder: (_) => QrPage());
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}