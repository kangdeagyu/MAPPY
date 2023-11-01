import 'package:final_main_project/viewmodel/card_vm.dart';
import 'package:final_main_project/widget/more/card/cardRegister_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 카드 firebase
    final vm = Get.find<CardVm>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '카드 등록',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Obx(
                () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: vm.cardDataList.length,
                  itemBuilder: (context, index) {
                    var data = vm.cardDataList[index];
                    // 카드 색상
                    List<Color> colors = [
                      Colors.grey,
                      Colors.blue,
                      Colors.green
                    ];
                    Color cardColor = colors[index % colors.length];
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) async {
                        // Firebase 삭제
                        await vm.deleteCard(vm.cardDataList[index]);
                      },
                      background: Container(color: Colors.red),
                      child: CreditCardWidget(
                        obscureCardNumber: true,
                        obscureCardCvv: true,
                        isHolderNameVisible: true,
                        cardNumber: data.number,
                        expiryDate: data.date,
                        cardHolderName: 'CARD',
                        cvvCode: data.cvc,
                        chipColor: Colors.amber,
                        cardBgColor: cardColor,
                        showBackView: false,
                        onCreditCardWidgetChange: (CreditCardBrand) {},
                      ),
                    );
                  },
                ),
              ),
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
                        child:
                            cardRegisterWidget(context, vm.cardDataList.length),
                      ),
                      isScrollControlled: true,
                      isDismissible: false,
                    );
                  },
                  child: Container(
                    width: 310.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add_card,
                        size: 40,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
