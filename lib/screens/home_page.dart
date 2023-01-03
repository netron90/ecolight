import 'package:eco_light/components/home_page_components/home_action_button.dart';
import 'package:eco_light/constants/constants.dart';
import 'package:eco_light/screens/main_light_screen.dart';
import 'package:flutter/material.dart';
import 'package:screen_brightness/screen_brightness.dart';

class EcolightApp extends StatefulWidget {
  const EcolightApp({Key? key}) : super(key: key);

  @override
  State<EcolightApp> createState() => _EcolightAppState();
}

class _EcolightAppState extends State<EcolightApp> {
  bool activeLight = true, customLight = false;

  /*----- Crotol lamp power ------*/

  /*
   *
   ** @luminosityState control lumisosity slider visibility on the top of the app
   ** @controlState control action button visibility on the top of the app
   ** @powerState control powerButton state
  */
  bool powerState = false, luminosityState = false, controlState = true;
  /*----- !Crotol lamp power ------*/

  Color btnLightFillColor = kBntActiveColor,
      btnLightBorderColor = kSplashScreenBg,
      btnCustomLightFillColor = kBtnInactiveColor,
      btnCustomLightBorderColor = kBorderInactiveBntColor,
      customLightColor = kSplashScreenBg,
      mainLightIconColor = kActiveIconColor,
      customLightIconColor = kInactiveIconColor,
      screenLight = kSplashScreenBg,
      luminosityActiveColor = kActiveSliderBlackColor,
      luminosityInactiveColor = kActiveSliderBlackColor,
      luminosityThumOverlayColor = kOverlayThumBlackColor;

  double _brightness = .9;

  ImageProvider powerImg = AssetImage('assets/images/home_button.png');
  ImageProvider logoImg = AssetImage('assets/images/logo.png');

  ColorType defaultCustomColor = ColorType.orange;

  customLightProcess() {
    if (customLight) {
     
      showCustomSetColor();
    } else {
      setState(() {
        customLightColor = Colors.white;
      });
    }
  }

  void showCustomSetColor() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: kBottomSheetDarkBg,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 36,
                ),
                SizedBox(
                  child: Container(
                    padding: EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      color: kBottomSheetBg,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 3.0),
                        Image(
                          image: AssetImage(
                              'assets/images/bottom_sheet_anchor.png'),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Mood',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 14.0),
                        ),
                        SizedBox(height: 14.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomColorSet(
                              onPressed: () {
                                setState(() {
                                  defaultCustomColor = ColorType.orange;
                                  customLightColor = kOrangeColor;
                                  powerImg = AssetImage(
                                      'assets/images/orange_button.png');
                                  logoImg = AssetImage(
                                      'assets/images/orange_logo.png');
                                });
                                Navigator.pop(context);
                              },
                              selectedColorSet: checkSelectedColorSet(
                                  customLightColor, kOrangeColor),
                              customLightColor: kOrangeColor,
                            ),
                            CustomColorSet(
                              onPressed: () {
                                setState(() {
                                  defaultCustomColor = ColorType.green;
                                  customLightColor = kGreenColor;
                                  powerImg = AssetImage(
                                      'assets/images/green_button.png');
                                  logoImg = AssetImage(
                                      'assets/images/green_logo.png');
                                });
                                Navigator.pop(context);
                              },
                              selectedColorSet: checkSelectedColorSet(
                                  customLightColor, kGreenColor),
                              customLightColor: kGreenColor,
                            ),
                            CustomColorSet(
                              onPressed: () {
                                setState(() {
                                  defaultCustomColor = ColorType.red;
                                  customLightColor = kRedColor;
                                  powerImg = AssetImage(
                                      'assets/images/red_button.png');
                                  logoImg =
                                      AssetImage('assets/images/red_logo.png');
                                });
                                Navigator.pop(context);
                              },
                              selectedColorSet: checkSelectedColorSet(
                                  customLightColor, kRedColor),
                              customLightColor: kRedColor,
                            ),
                            CustomColorSet(
                              onPressed: () {
                                setState(() {
                                  defaultCustomColor = ColorType.cyan;
                                  customLightColor = kCyanColor;
                                  powerImg = AssetImage(
                                      'assets/images/cyan_button.png');
                                  logoImg =
                                      AssetImage('assets/images/cyan_logo.png');
                                });
                                Navigator.pop(context);
                              },
                              selectedColorSet: checkSelectedColorSet(
                                  customLightColor, kCyanColor),
                              customLightColor: kCyanColor,
                            ),
                            CustomColorSet(
                              onPressed: () {
                                setState(() {
                                  defaultCustomColor = ColorType.purple;
                                  customLightColor = kPurpleColor;
                                  powerImg = AssetImage(
                                      'assets/images/purple_button.png');
                                  logoImg = AssetImage(
                                      'assets/images/purple_logo.png');
                                });
                                Navigator.pop(context);
                              },
                              selectedColorSet: checkSelectedColorSet(
                                  customLightColor, kPurpleColor),
                              customLightColor: kPurpleColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void mainLightBtnProcess() {
    customLight = false;
    activeLight = true;
    setState(() {
      btnLightFillColor = kBntActiveColor;
      btnLightBorderColor = kSplashScreenBg;
      btnCustomLightFillColor = kBtnInactiveColor;
      btnCustomLightBorderColor = kBorderInactiveBntColor;
      customLightColor = kSplashScreenBg;
      powerImg = AssetImage('assets/images/home_button.png');
      logoImg = AssetImage('assets/images/logo.png');
      mainLightIconColor = kActiveIconColor;
      customLightIconColor = kInactiveIconColor;
    });
   
  }

  void customLightBtnProcess() {
    customLight = true;
    activeLight = false;
    setState(() {
      btnLightFillColor = kBtnInactiveColor;
   
      btnLightBorderColor = kBorderInactiveBntColor;
      btnCustomLightFillColor = kBntActiveColor;
      btnCustomLightBorderColor = kSplashScreenBg;
      customColorCheck();

      mainLightIconColor = kInactiveIconColor;
      customLightIconColor = kActiveIconColor;
    });

  }

  void customColorCheck() {
    if (defaultCustomColor == ColorType.orange) {
      customLightColor = kOrangeColor;
      powerImg = AssetImage('assets/images/orange_button.png');
      logoImg = AssetImage('assets/images/orange_logo.png');
    }

    if (defaultCustomColor == ColorType.green) {
      customLightColor = kGreenColor;
      powerImg = AssetImage('assets/images/green_button.png');
      logoImg = AssetImage('assets/images/green_logo.png');
    }

    if (defaultCustomColor == ColorType.red) {
      customLightColor = kRedColor;
      powerImg = AssetImage('assets/images/red_button.png');
      logoImg = AssetImage('assets/images/red_logo.png');
    }

    if (defaultCustomColor == ColorType.cyan) {
      customLightColor = kCyanColor;
      powerImg = AssetImage('assets/images/cyan_button.png');
      logoImg = AssetImage('assets/images/cyan_logo.png');
    }

    if (defaultCustomColor == ColorType.purple) {
      customLightColor = kPurpleColor;
      powerImg = AssetImage('assets/images/purple_button.png');
      logoImg = AssetImage('assets/images/purple_logo.png');
    }
  }

  void customColorCheckPower() {
    if (defaultCustomColor == ColorType.orange) {
      customLightColor = kOrangeColor;
      powerImg = AssetImage('assets/images/orange_button.png');
      logoImg = AssetImage('assets/images/white_logo.png');
    }

    if (defaultCustomColor == ColorType.green) {
      customLightColor = kGreenColor;
      powerImg = AssetImage('assets/images/green_button.png');
      logoImg = AssetImage('assets/images/white_logo.png');
    }

    if (defaultCustomColor == ColorType.red) {
      customLightColor = kRedColor;
      powerImg = AssetImage('assets/images/red_button.png');
      logoImg = AssetImage('assets/images/white_logo.png');
    }

    if (defaultCustomColor == ColorType.cyan) {
      customLightColor = kCyanColor;
      powerImg = AssetImage('assets/images/cyan_button.png');
      logoImg = AssetImage('assets/images/white_logo.png');
    }

    if (defaultCustomColor == ColorType.purple) {
      customLightColor = kPurpleColor;
      powerImg = AssetImage('assets/images/purple_button.png');
      logoImg = AssetImage('assets/images/white_logo.png');
    }
  }

  void customColorCheckPowerOff() {
    if (defaultCustomColor == ColorType.orange) {
      customLightColor = kOrangeColor;
      powerImg = AssetImage('assets/images/orange_button.png');
      logoImg = AssetImage('assets/images/orange_logo.png');
    }

    if (defaultCustomColor == ColorType.green) {
      customLightColor = kGreenColor;
      powerImg = AssetImage('assets/images/green_button.png');
      logoImg = AssetImage('assets/images/green_logo.png');
    }

    if (defaultCustomColor == ColorType.red) {
      customLightColor = kRedColor;
      powerImg = AssetImage('assets/images/red_button.png');
      logoImg = AssetImage('assets/images/red_logo.png');
    }

    if (defaultCustomColor == ColorType.cyan) {
      customLightColor = kCyanColor;
      powerImg = AssetImage('assets/images/cyan_button.png');
      logoImg = AssetImage('assets/images/cyan_logo.png');
    }

    if (defaultCustomColor == ColorType.purple) {
      customLightColor = kPurpleColor;
      powerImg = AssetImage('assets/images/purple_button.png');
      logoImg = AssetImage('assets/images/purple_logo.png');
    }
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }

  void mainLightPowerHandle() {
    if (!powerState) {
      powerState = true;
      setState(() {
        luminosityState = true;
        controlState = false;
        screenLight = Colors.white;
        luminosityActiveColor = kActiveSliderBlackColor;
        luminosityInactiveColor = kInactiveSliderBlackColor;
        luminosityThumOverlayColor = kOverlayThumBlackColor;
         powerImg = AssetImage('assets/images/home_button.png');
        logoImg = AssetImage('assets/images/logo_black.png');
      });
    } else {
      powerState = false;
      setState(() {
        luminosityState = false;
        controlState = true;
        screenLight = kSplashScreenBg;
        powerImg = AssetImage('assets/images/home_button.png');
        logoImg = AssetImage('assets/images/logo.png');
      });
    }
  }

  void customLightPowerHandle() {
    if (!powerState) {
      powerState = true;
      setState(() {
        luminosityState = true;
        controlState = false;
        screenLight = customLightColor;
        luminosityActiveColor = kActiveSliderWhiteColor;
        luminosityInactiveColor = kInactiveSliderWhiteColor;
        luminosityThumOverlayColor = kOverlayThumWhiteColor;
        customColorCheckPower();
      });
    } else {
      powerState = false;
      setState(() {
        luminosityState = false;
        controlState = true;
        screenLight = kSplashScreenBg;
        customColorCheckPowerOff();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenLight,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: luminosityState,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.brightness_high,
                      color: luminosityActiveColor,
                      size: 18.0,
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: luminosityActiveColor,
                            overlayColor: luminosityThumOverlayColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 8.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                            activeTrackColor: luminosityActiveColor,
                            inactiveTrackColor: luminosityInactiveColor,
                            trackHeight: .2),
                        child: Slider.adaptive(
                          value: _brightness,
                          onChanged: (double value) {
                            setState(() {
                              _brightness = value;
                            });
                            setBrightness(_brightness);
                          },
                          max: 1,
                          min: 0.1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: controlState,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActionButton(
                        onPressed: customLightProcess,
                        btnBorderColor: kSplashScreenBg,
                        btnFillColor: customLightColor),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ActionButton(
                            onPressed: mainLightBtnProcess,
                            btnBorderColor: btnLightBorderColor,
                            btnFillColor: btnLightFillColor,
                            icon: Icons.lightbulb,
                            iconColor: mainLightIconColor,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          ActionButton(
                            onPressed: customLightBtnProcess,
                            btnBorderColor: btnCustomLightBorderColor,
                            btnFillColor: btnCustomLightFillColor,
                            icon: Icons.settings,
                            iconColor: customLightIconColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (activeLight) {
                     
                     
                      mainLightPowerHandle();
                    } else {
                   
                      customLightPowerHandle();
                    }
                  },
                  child: Image(
                    width: 240.0,
                    height: 240.0,
                    image: powerImg,
                  ),
                ),
              ),
              Image(
                image: logoImg,
              )
            ],
          ),
        ),
      ),
    );
  }

  Color checkSelectedColorSet(Color actualCustomLight, Color colorInRow) {
    if (actualCustomLight == colorInRow) {
      return btnCustomLightFillColor;
    } else {
      return kSplashScreenBg;
    }
  }
}

class CustomColorSet extends StatelessWidget {
  CustomColorSet(
      {required this.onPressed,
      required this.selectedColorSet,
      required this.customLightColor});
  final VoidCallback onPressed;
  Color selectedColorSet, customLightColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: CircleBorder(
          side: BorderSide(width: 6.0, color: selectedColorSet),
        ),
        fillColor: customLightColor,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 0),
        constraints: BoxConstraints(minWidth: 56.0),
      ),
    );
  }
}
