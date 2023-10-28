import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/styles/text_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget uploadImageButton(context, title, buttonStyle) {

  final vm = Get.find<AgeVM>();

  return ElevatedButton(
    style: buttonStyle,
    onPressed: () {
      Get.dialog(
        AlertDialog(
          content: SizedBox(
            height: 120.h,
            child: Column(
                            children: [
                const Text(
                  '어떤 이미지를 사용하시겠어요?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/yena_crop.png',
                      height: 70.h,
                    ),
                    Column(
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
                  ],
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
