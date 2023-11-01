import 'package:final_main_project/widget/more/charge/select_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget coinTile(String labelText, String buttonLabel, BuildContext context) {
  return Container(
    width: 330.w,
    height: 55.h,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: Colors.green,
                size: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                labelText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  height: 0,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 105.w,
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 260.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: selectCard(labelText, buttonLabel, context),
                  ),
                  isScrollControlled: true,
                  isDismissible: false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: Text(
                buttonLabel,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
