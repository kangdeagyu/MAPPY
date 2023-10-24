import 'package:final_main_project/view/age_result.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';

class AgePrediction extends StatelessWidget {
  AgePrediction({super.key});

  final vm = Get.put(AgeVM());

  @override
  Widget build(BuildContext context) {

    ButtonStyle customButtonStyle = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
      foregroundColor:
          MaterialStateProperty.all(Theme.of(context).colorScheme.onPrimary),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPhotoArea(),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('카메라'),
                  style: customButtonStyle,
                  onPressed: () {
                    Get.defaultDialog(
                      title: '경고!',
                      content: const Text('ios 시뮬레이터에서 카메라 사용 불가'),
                      textConfirm: '확인',
                      confirmTextColor: Theme.of(context).colorScheme.onPrimary,
                      buttonColor: Theme.of(context).colorScheme.primary,
                      onConfirm: () => Get.back(),
                    );
                  },
                ),
                SizedBox(
                  width: 15.w,
                ),
                ElevatedButton.icon(
                  style: customButtonStyle,
                  icon: const Icon(Icons.photo),
                  label: const Text('갤러리'),
                  onPressed: () {
                    vm.getGalleryImage();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
              style: customButtonStyle,
              onPressed: () {
                Get.to(const AgeResultScreen());
              },
              child: const Text('결과 확인'),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildPhotoArea() {
    return Obx(
      () => vm.faceImage.value != null
          ? SizedBox(
              height: 320.h,
              width: 250.w,
              child:
                  Image.file(File(vm.faceImage.value!.path)), // show image in screen
            )
          : Container(
              height: 320.h,
              width: 250.w,
              color: Colors.grey,
            ),
    );
  }
}