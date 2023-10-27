import 'package:final_main_project/viewmodel/theme_obs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget etcWidget(BuildContext context) {
  final themeController = Get.put(ThemeController());

  return Column(
    children: [
      SizedBox(
        width: 320.w,
        height: 30.h,
        child: Obx(() =>
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                '다크 모드',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
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
