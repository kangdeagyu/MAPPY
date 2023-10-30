import 'package:final_main_project/viewmodel/notification_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget notification(context) {
  return Column(
    children: [
      SizedBox(
        width: 320.w,
        height: 30.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '알림',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            Obx(
              () => Switch(
                value: Get.find<NotificationVm>().isNotificationMode.value,
                onChanged: (value) async {
                  await Get.find<NotificationVm>().toggleNotification();
                },
              ),
            )
          ],
        ),
      ),
    ],
  );
}
