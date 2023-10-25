import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget uploadImageButton(context, title, buttonStyle, vm) {
  return ElevatedButton(
    style: buttonStyle,
    onPressed: () {
      Get.dialog(
        AlertDialog(
          content: SizedBox(
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('카메라'),
                  style: primaryButtonStyle(context),
                  onPressed: () {
                    Get.back();
                    vm.getCameraImage();
                  },
                ),
                SizedBox(
                  width: 15.w,
                ),
                ElevatedButton.icon(
                  style: primaryButtonStyle(context),
                  icon: const Icon(Icons.photo),
                  label: const Text('갤러리'),
                  onPressed: () {
                    Get.back();
                    vm.getGalleryImage();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
    child: Text(
      title,
      style: buttonTextStyle(context)
    ),
  );
}
