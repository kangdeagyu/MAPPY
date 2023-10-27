import 'package:final_main_project/model/untiy_ads_model.dart';
import 'package:get/get.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class UntiyAd extends GetxController {
  final placements = {
    AdManager.interstitialVideoAdPlacementId: true.obs,
    AdManager.rewardedVideoAdPlacementId: true.obs
  }.obs;

  @override
  void onInit() {
    super.onInit();
    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: true,
      onComplete: () {
        print('Initialization Complete');
        loadAds();
      },
      onFailed: (error, message) =>
          print('Initialization Failed: $error $message'),
    );
  }

  void loadAds() {
    for (var placementId in placements.keys) {
      loadAd(placementId);
    }
  }

  void loadAd(String placementId) {
    UnityAds.load(
      placementId: placementId,
      onComplete: (placementId) {
        print('Load Complete $placementId');
        placements[placementId]?.value = true;
      },
      onFailed: (placementId, error, message) =>
          print('Load Failed $placementId: $error $message'),
    );
  }

  void showAd(String placementId) {
    placements[placementId]?.value = false;
    UnityAds.showVideoAd(
      placementId: placementId,
      onComplete: (placementId) {
        print('Video Ad $placementId completed');
        loadAd(placementId);
      },
      onFailed: (placementId, error, message) {
        print('Video Ad $placementId failed: $error $message');
        loadAd(placementId);
      },
      onStart: (placementId) => print('Video Ad $placementId started'),
      onClick: (placementId) => print('Video Ad $placementId click'),
      onSkipped: (placementId) {
        print('Video Ad $placementId skipped');
        loadAd(placementId);
      },
    );
  }
}
