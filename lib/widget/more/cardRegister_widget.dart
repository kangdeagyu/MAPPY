import 'package:final_main_project/model/card_model.dart';
import 'package:final_main_project/styles/button_style.dart';
import 'package:final_main_project/viewmodel/card_obs.dart';
import 'package:final_main_project/viewmodel/card_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget cardwidget(BuildContext context, cardCount) {
  final cardobs = Get.put(CardGet());
  final cardVm = Get.put(CardVm());

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
          cardNumber: cardobs.stCardnumber.value, // 카드번호
          expiryDate: cardobs.stCarddate.value, // 날짜
          cardHolderName: 'CARD', // 카드 이름
          cvvCode: cardobs.stCardcvc.value, // cvc
          chipColor: Colors.amber,
          cardBgColor: cardColor,
          showBackView: false,
          onCreditCardWidgetChange: (CreditCardBrand) {},
        ),
      ),
      SizedBox(
        width: 340.w,
        child: TextField(
          controller: cardobs.numberController.value,
          maxLength: 16,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: '카드번호를 입력해주세요',
            counterText: '',
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            cardobs.updateCardNumber(value);
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
              controller: cardobs.dateController.value,
              maxLength: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'MM/YY',
                counterText: '',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.length == 2 && !value.endsWith('/')) {
                  cardobs.updateCardDate('$value/');
                  cardobs.dateController.value.text =
                      '$value/'; // 컨트롤러의 값을 업데이트합니다.
                  cardobs.dateController.value.selection =
                      TextSelection.fromPosition(TextPosition(
                          offset: cardobs.dateController.value.text
                              .length)); // 커서 위치를 업데이트합니다.
                } else if (value.endsWith('/')) {
                  // '/'로 끝나는 경우
                  final newValue =
                      value.substring(0, value.length - 1); // 마지막 두 글자 제거
                  cardobs.updateCardDate(newValue);
                  cardobs.dateController.value.text = newValue;
                  cardobs.dateController.value.selection =
                      TextSelection.fromPosition(
                          TextPosition(offset: newValue.length));
                } else {
                  cardobs.updateCardDate(value);
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
              controller: cardobs.cvcController.value,
              maxLength: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'cvc',
                counterText: '',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                cardobs.updateCardSvv(value);
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
              uid: "wook",
              number: cardobs.stCardnumber.value,
              date: cardobs.stCarddate.value,
              cvc: cardobs.stCardcvc.value,
            );

            // Add the new card to Firebase and local state.
            await cardVm.addCard(newCard);

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
