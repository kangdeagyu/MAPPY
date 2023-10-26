import 'package:final_main_project/components/more/charge_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget coinCharging(BuildContext context) {
  return Container(
    width: 165.w,
    height: 78.h,
    decoration: ShapeDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    ),
    child: TextButton.icon(
      onPressed: () {
        Get.bottomSheet(
          Container(
            height: 591.h,
            color: Colors.white,
            child: const ChargeWidget(),
          ),
          isScrollControlled: true,
        );
      },
      icon: Icon(
        Icons.add_circle_outline,
        color: Theme.of(context).colorScheme.primary,
      ),
      label: Text(
        '충전하기',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
        ),
      ),
      style: TextButton.styleFrom(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(0.1),
        ),
      ),
    ),
  );
}
