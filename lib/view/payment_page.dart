import 'package:final_main_project/model/card_model.dart';
import 'package:final_main_project/viewmodel/card_obs.dart';
import 'package:final_main_project/viewmodel/card_vm.dart';
import 'package:final_main_project/widget/more/cardRegister_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cardobs = Get.put(CardGet());
    final cardVm = Get.put(CardVm());
    return Scaffold(
      appBar: AppBar(
        title: const Text('카드 등록'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  // 카드내역 삭제
                  cardobs.remove();
                  // 카드 등록
                  Get.bottomSheet(
                    Container(
                      height: 400.h,
                      color: Colors.white,
                      child: cardwidget(context),
                    ),
                    isScrollControlled: true,
                    isDismissible: false,
                  );
                },
                child: Obx(
                  () => ListView.builder(
                      itemCount: cardVm.cardDataList.length,
                      itemBuilder: (context, index) {
                        var data = cardVm.cardDataList[index];
                        return CreditCardWidget(
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          cardNumber: data.number,
                          expiryDate: data.date,
                          cardHolderName: 'CARD',
                          cvvCode: data.cvc,
                          chipColor: Colors.amber,
                          cardBgColor: Colors.black,
                          showBackView: false,
                          onCreditCardWidgetChange: (CreditCardBrand) {},
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
