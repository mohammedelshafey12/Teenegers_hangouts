import 'package:flutter/material.dart';
import 'package:googlemaps/Screens/waitingWidget.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash_Screen extends StatelessWidget {
  static String id  = 'splashscreen';
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new waitngWidget(),
        title: new Text('Welcome In SplashScreen'),
        image: new Image.asset('screenshot.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red
    );
  }
}
