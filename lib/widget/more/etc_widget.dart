import 'package:final_main_project/viewmodel/theme_obs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget etcWidget(BuildContext context) {
  final ThemeController themeController = Get.put(ThemeController());

  return Column(
    children: [
      SizedBox(
        width: 320.w,
        height: 30.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/setting.png'),
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              '기타',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 30),
      SizedBox(
        width: 324,
        height: 24,
        child: Obx(() =>
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'Dark Mode',
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Switch(
                value: themeController.isDarkMode.value,
                onChanged: (value) {
                  themeController.isDarkMode.value = value;
                },
              )
            ])),
      ),
    ],
  );
}
