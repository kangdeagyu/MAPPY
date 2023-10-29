import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdManager {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return dotenv.env['ANDROID_GAME_ID'] ?? '';
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return dotenv.env['IOS_GAME_ID'] ?? '';
    }
    return '';
  }

  static String get interstitialVideoAdPlacementId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return dotenv.env['INTERSTITAL_ANDROID_ID'] ?? '';
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return dotenv.env['INTERSTITAL_IOS_ID'] ?? '';
    }
    return '';
  }
}
