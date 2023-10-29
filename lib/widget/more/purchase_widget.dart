import 'package:final_main_project/viewmodel/purchase_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget purchase(String coin, String pay, String number) {
  final purchaseObs = Get.put(PurchaseVM());

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200.w,
              height: 50.h,
              child: Row(
                children: [
                  Image.asset("./assets/images/login.png"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text(
                      '코인을 구매해주세요',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
      SizedBox(
        height: 15.h,
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        width: 330.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coin,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 0.5, color: Colors.black),
            Text(
              pay,
              style: const TextStyle(fontSize: 16),
            ),
            const Text(
              "일회성 청구",
              style: TextStyle(fontSize: 10),
            ),
            const Divider(thickness: 0.5, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "결제카드:",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  replaceWithStar(number),
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const Divider(thickness: 0.5, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "계정:",
                  style: TextStyle(fontSize: 16),
                ),
                Obx(() => Text(purchaseObs.uId.value)),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Obx(
        () => purchaseObs.isProcessing.value
            ? const CircularProgressIndicator()
            : purchaseObs.isComplete.value
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 40,
                  ) // 체크 아이콘의 색상을 변경했습니다.
                : ElevatedButton(
                    onPressed: () async {
                      // 결제 창과 데이터베이스에 코인 업데이트
                      await purchaseObs.makePayment(extractNumber(coin));
                      // 결제 내역 데이터베이스에 저장해줘야됨
                      await purchaseObs.insertPayment(
                          extractNumber(coin), number, extractNumber(pay));
                      // 사용 내역 히스토리
                      await purchaseObs.insertHistory(extractNumber(coin));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[800],
                      foregroundColor: Colors.white,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: const Text("결제하기"),
                  ),
      ),
    ],
  );
}

// 숫자가 아닌 모든 문자제거
int extractNumber(String inputString) {
  String num = inputString.replaceAll(RegExp(r'[^0-9]'), '');
  return int.parse(num);
}

String replaceWithStar(String cardNumber) {
  String result = '';
  for (int i = 0; i < cardNumber.length; i++) {
    if (i >= 4 && i < 12) {
      result += '*';
    } else {
      result += cardNumber[i];
    }
  }
  return result;
}
