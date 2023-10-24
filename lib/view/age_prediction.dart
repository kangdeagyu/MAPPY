import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/view/age_result.dart';
import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:final_main_project/widget/age/photo_area_widget.dart';
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
              height: 50.h,
            ),
            ElevatedButton(
              style: onPrimaryButtonStyle(context),
              onPressed: () {
                Get.to(const AgeResultScreen());
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 10.h),
                child: Column(
                  children: [
                    const Text(
                      '결과 확인하기',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '30',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.monetization_on,
                            color: Colors.green,
                            size: 25,
                          ),
                          Text(
                            ' 차감',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
