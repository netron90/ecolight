import 'dart:async';

import 'package:eco_light/constants/constants.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EcolightApp(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kSplashScreenBg,
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                      child: Image(
                        width: 240.0,
                        height: 240.0,
                        image: AssetImage('assets/images/home_button.png'),
                      ),
                    ),
                  ],
                ),
                flex: 3,
              ),
              Expanded(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
