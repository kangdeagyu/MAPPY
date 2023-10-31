import 'package:final_main_project/model/untiy_ads_model.dart';
import 'package:final_main_project/viewmodel/purchase_vm.dart';
import 'package:get/get.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class UntiyAd extends GetxController {
  final purchaseObs = Get.put(PurchaseVM());
  final placements = {
    AdManager.interstitialVideoAdPlacementId: true.obs,
  }.obs;

  @override
  void onInit() {
    super.onInit();
    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: true,
      onComplete: () {
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
        // 광고 시청이 완료되었을 때 동작
        try {
          purchaseObs.updateCoin(50);
          purchaseObs.insertHistoryAds(50);
        } catch (e) {
          // 오류 처리
        }
        loadAd(placementId);
      },
      onFailed: (placementId, error, message) {
        loadAd(placementId);
      },
      onStart: (placementId) => print('Video Ad $placementId started'),
      onClick: (placementId) => print('Video Ad $placementId click'),
      onSkipped: (placementId) {
        loadAd(placementId);
      },
    );
  }
}
