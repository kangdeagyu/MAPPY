import 'package:final_main_project/model/card_model.dart';
import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/card_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget cardwidget(BuildContext context, cardCount) {
  final vm = Get.put(CardVm());

  // 카드 색상
  List<Color> colors = [Colors.grey, Colors.blue, Colors.green];
  Color cardColor = colors[cardCount];
  return Column(
    children: [
      Obx(
        () => // 여기에 Obx 추가
            CreditCardWidget(
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          cardNumber: vm.stCardnumber.value, // 카드번호
          expiryDate: vm.stCarddate.value, // 날짜
          cardHolderName: 'CARD', // 카드 이름
          cvvCode: vm.stCardcvc.value, // cvc
          chipColor: Colors.amber,
          cardBgColor: cardColor,
          showBackView: false,
          onCreditCardWidgetChange: (CreditCardBrand) {},
        ),
      ),
      SizedBox(
        width: 340.w,
        child: TextField(
          controller: vm.numberController.value,
          maxLength: 16,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: '카드번호를 입력해주세요',
            counterText: '',
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            vm.updateCardNumber(value);
          },
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 160.w,
            child: TextField(
              controller: vm.dateController.value,
              maxLength: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'MM/YY',
                counterText: '',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length == 2 && !value.endsWith('/')) {
                  vm.updateCardDate('$value/');
                  vm.dateController.value.text = '$value/'; // 컨트롤러의 값을 업데이트합니다.
                  vm.dateController.value.selection =
                      TextSelection.fromPosition(TextPosition(
                          offset: vm.dateController.value.text
                              .length)); // 커서 위치를 업데이트합니다.
                } else if (value.endsWith('/')) {
                  // '/'로 끝나는 경우
                  final newValue =
                      value.substring(0, value.length - 1); // 마지막 두 글자 제거
                  vm.updateCardDate(newValue);
                  vm.dateController.value.text = newValue;
                  vm.dateController.value.selection =
                      TextSelection.fromPosition(
                          TextPosition(offset: newValue.length));
                } else {
                  vm.updateCardDate(value);
                }
              },
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          SizedBox(
            width: 160.w,
            child: TextField(
              controller: vm.cvcController.value,
              maxLength: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'cvc',
                counterText: '',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                vm.updateCardSvv(value);
              },
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: 340.w,
        child: ElevatedButton(
          onPressed: () async {
            // firebase에 카드 등록
            CardModel newCard = CardModel(
              id: "",
              uid: vm.uId.value,
              number: vm.stCardnumber.value,
              date: vm.stCarddate.value,
              cvc: vm.stCardcvc.value,
            );

            // Add the new card to Firebase and local state.
            await vm.addCard(newCard);

            Get.back();
          },
          style: primaryButtonStyle(context),
          child: Text(
            "등록하기",
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
        ),
      ),
      SizedBox(
        width: 340.w,
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: primaryButtonStyle(context),
          child: Text(
            "돌아가기",
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
        ),
      )
    ],
  );
}
