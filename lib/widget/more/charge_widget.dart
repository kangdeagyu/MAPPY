import 'package:final_main_project/widget/more/purchase_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget coinTile(String labelText, String buttonLabel, BuildContext context) {
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
                Get.bottomSheet(
                  Container(
                    height: 300.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: purchase(labelText, buttonLabel),
                  ),
                  isScrollControlled: true,
                  isDismissible: false,
                );

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

void showPurchaseDialog(BuildContext context, String coin, String amount) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('코인 구매'),
        content: Column(
          children: [
            SizedBox(
              height: 100,
              width: 150,
              child: Image.asset("./assets/images/login.png"),
            ),
            Text(
              '$coin\n$amount',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('취소하기', style: TextStyle(color: Colors.red)),
            onPressed: () {
              Get.back();
              showCancelSnackbar();
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text("구매하기", style: TextStyle(color: Colors.green)),
            onPressed: () {
              // Handle purchase logic here
              Get.back();
            },
          )
        ],
      );
    },
  );
}

void showCancelSnackbar() {
  Get.snackbar(
    '알림',
    '결제가 취소되었습니다',
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}
