import 'package:final_main_project/viewmodel/purchase_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UseCoin extends StatelessWidget {
  const UseCoin({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.put(PurchaseVM());
    return Scaffold(
      appBar: AppBar(
        title: const Text('사용 내역'),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 330.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent), // 선을 투명하게 설정
                child: ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "현재 보유 코인",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 36.w,
                            height: 36.h,
                            child: const Icon(
                              Icons.monetization_on,
                              color: Colors.green,
                            ),
                          ),
                          Obx(
                            () {
                              // 코인 변화 rx로 실시간관리
                              return Text(
                                vm.myCoin.value.toString(),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              );
                            },
                          ),
                        ],
                      ) // 코인
                    ],
                  ),
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(15, 0, 40, 0), // 좌우 간격 설정
                      child: Column(
                        children: [
                          const Divider(
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("유료 충전 코인"),
                              Text("0코인"),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("무료 충전 코인"),
                              Text("0코인"),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemCount: vm.payments.length, // 결제 내역의 개수
                  itemBuilder: (context, index) {
                    final payment = vm.payments[index];
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          payment.category == 'charge'
                              ? const Text("코인 충전")
                              : payment.category == 'yena'
                                  ? const Text("얼굴나이 예측")
                                  : const Text("챗봇"),
                          payment.category == 'charge'
                              ? Text("+${payment.price}코인")
                              : Text("-${payment.price}코인"),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(payment.getFormattedDate()),
                          Obx(
                            () {
                              // 코인 변화 rx로 실시간관리
                              return Text(
                                "${vm.myCoin.value.toString()} 코인",
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
