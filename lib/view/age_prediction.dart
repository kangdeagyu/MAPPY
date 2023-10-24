import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/photo_area_widget.dart';
import 'package:final_main_project/widget/age/result_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AgePrediction extends StatelessWidget {
  AgePrediction({super.key});

  final vm = Get.put(AgeVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            SizedBox(width: 10,),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/Age_Icon.png'),
              backgroundColor: Colors.white,
              radius: 20,
            ),
            SizedBox(width: 8),
            Text('예나'),
          ],
        ),
        actions: const [
          Icon(
            Icons.monetization_on,
            color: Colors.green,
            size: 25,
          ),
          SizedBox(width: 5,),
          Text('100', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          SizedBox(width: 30,)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '당신의 얼굴 나이를 측정해보세요.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            photoAreaWidget(),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('카메라'),
                  style: primaryButtonStyle(context),
                  onPressed: () {
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
                    vm.getGalleryImage();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            resultButtonWidget(context),
          ],
        ),
      ),
    );
  }
}
