import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/messagebox/fail_crop_box.dart';
import 'package:final_main_project/widget/age/messagebox/recognizing_box.dart';
import 'package:final_main_project/widget/age/messagebox/success_crop_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget answerWidget(context) {

  final vm = Get.find<AgeVM>();

  return Obx(() {
    if (vm.faceImage.value != null &&
        vm.cropResponeCode.value != -1 &&
        vm.croppedFaceImage.value != null) {
      // 얼굴 인식 결과가 있을 때
      return successCropBox(context);
    } else if (vm.cropResponeCode.value == 500) {
      // 얼굴 인식 실패 시
      return failCropBox(context);
    } else if (vm.cropResponeCode.value == -1) {
      // 얼굴 인식 중일 때
      return recognizingBox(context);
    } else {
      // 초기 상태일 때
      return Container();
    }
  });
}
