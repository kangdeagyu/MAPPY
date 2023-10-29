import 'package:final_main_project/viewmodel/age_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget sequentialMessageBox({required int index, Widget? child}) {

  final vm = Get.find<AgeVM>();

  return Obx(() => vm.displayStates[index].value
      ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Age_Icon.png'),
              backgroundColor: Colors.white,
              radius: 20,
            ),
            SizedBox(width: 8.w),
            Align(
                  child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 280.h),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: child,
                ),
              )),
          ],
        )
      : const SizedBox());
}
