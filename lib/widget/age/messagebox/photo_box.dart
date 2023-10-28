import 'dart:io';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget photoBox() {

  final vm = Get.find<AgeVM>();

  return Obx(
    () => vm.faceImage.value != null
        ? SizedBox(
            height: 250.h,
            width: 250.w,
            child:
                Image.file(File(vm.faceImage.value!.path)), // show image on screen
          )
        : Container(
          ),
  );
}
