import 'package:eco_light/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  _initGoogleMobileAds();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp( MaterialApp(
        title: kAppName,
        home: SplashScreen(),
      ),
    ),
  );
}

Future<InitializationStatus> _initGoogleMobileAds() {
  // TODO: Initialize Google Mobile Ads SDK
  return MobileAds.instance.initialize();
}
