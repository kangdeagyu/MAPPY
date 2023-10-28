import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/messagebox/custom_message_box.dart';
import 'package:final_main_project/widget/age/messagebox/crop_fail_box.dart';
import 'package:final_main_project/widget/age/messagebox/crop_success_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget answerWidget(context) {

  final vm = Get.find<AgeVM>();

  return Obx(() {
    if (vm.faceImage.value != null &&
        vm.cropResponeCode.value != -1 &&
        vm.croppedFaceImage.value != null) {
      // 얼굴 인식 결과가 있을 때
      return cropSuccessBox(context);
    } else if (vm.cropResponeCode.value == 500) {
      // 얼굴 인식 실패 시
      return cropFailBox(context);
    } else if (vm.cropResponeCode.value == -1) {
      // 얼굴 인식 중일 때
      return customMessageBox(
        maxWidth: 280.w,
        child: const Text('얼굴 인식중........'),
      );
    } else {
      // 초기 상태일 때
      return Container();
    }
  });
}
