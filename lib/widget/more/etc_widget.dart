import 'package:final_main_project/viewmodel/theme_obs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget etcWidget() {
  final ThemeController themeController = Get.put(ThemeController());

  return Column(
    children: [
      SizedBox(
        width: 350,
        height: 30,
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
            const Text(
              '기타',
              style: TextStyle(
                color: Color(0xFF2F9BFF),
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
