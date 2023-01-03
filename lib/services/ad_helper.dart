import 'dart:io';

class AdHelper {


  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6797847842737373/5103259699';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6797847842737373/6630048068';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

}