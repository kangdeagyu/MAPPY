import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget coinTile(String labelText, String buttonLabel) {
  return Container(
    width: 340.w,
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
            width: 110.w,
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {
                // 결제 카드등록 되어 있을시 바로결제
                // 안되어 있으면 카드등록 페이지로
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[300],
                foregroundColor: Colors.white,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: Text(
                buttonLabel,
                style: const TextStyle(
                  fontSize: 16,
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
