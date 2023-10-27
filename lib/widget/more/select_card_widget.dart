import 'package:final_main_project/viewmodel/card_vm.dart';
import 'package:final_main_project/widget/more/cardRegister_widget.dart';
import 'package:final_main_project/widget/more/purchase_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget selectCard(String coin, String pay, BuildContext context) {
  final vm = Get.put(CardVm());
  return Column(
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
                      '카드를 선택해주세요',
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
        height: 10.h,
      ),
      // 등록카드 불러오기
      Obx(
        () => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: vm.cardDataList.length,
          itemBuilder: (context, index) {
            var data = vm.cardDataList[index];
            // 카드 색상
            List<Color> colors = [Colors.grey, Colors.blue, Colors.green];
            Color cardColor = colors[index % colors.length];
            return InkWell(
              onTap: () {
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
                    child: purchase(coin, pay, data.number),
                  ),
                  isScrollControlled: true,
                  isDismissible: false,
                );
              },
              child: Card(
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Card",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        replaceWithStar(data.number),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // 등록된 카드가 없으면 추가
      if (vm.cardDataList.length < 3) // 카드 데이터가 3개 미만일 때만 Container 표시
        InkWell(
          onTap: () {
            // 카드내역 삭제
            vm.remove();
            // 카드 등록
            Get.bottomSheet(
              Container(
                height: 420.h,
                color: Theme.of(context).colorScheme.background,
                child: cardwidget(context, vm.cardDataList.length),
              ),
              isScrollControlled: true,
              isDismissible: false,
            );
          },
          child: Container(
            width: 350.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.add_card,
                size: 20,
              ),
            ),
          ),
        ),
    ],
  );
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
