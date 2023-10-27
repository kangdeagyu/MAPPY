import 'package:final_main_project/model/untiy_ads_model.dart';
import 'package:final_main_project/viewmodel/untiy_Ads_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget adsWidget(BuildContext context) {
  final untiyVM = Get.put(UntiyAd());

  return Container(
    width: 330.w,
    height: 55.h,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Obx(() => InkWell(
          onTap: untiyVM
                  .placements[AdManager.interstitialVideoAdPlacementId]!.value
              ? () => untiyVM.showAd(AdManager.interstitialVideoAdPlacementId)
              : null,
          child: const Align(
            alignment: Alignment.center,
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.green,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "무료로 코인 받기",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ),
        )),
  );
}
