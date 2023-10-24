import 'package:final_main_project/widget/more/charge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChargeWidget extends StatelessWidget {
  const ChargeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('코인 구매'),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('현재 보유 코인'),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.monetization_on,
                color: Colors.green,
                size: 25,
              ),
              Text(
                '0',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 30,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 360.w,
            height: 453.2.h,
            color: Colors.grey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                coinTile("코인 32개", "₩ 1,500"),
                const SizedBox(
                  height: 20,
                ),
                coinTile("코인 64개", "₩ 3,000"),
                const SizedBox(
                  height: 20,
                ),
                coinTile("코인 96개", "₩ 4,400"),
                const SizedBox(
                  height: 20,
                ),
                coinTile("코인 165개", "₩ 7,500"),
                const SizedBox(
                  height: 20,
                ),
                coinTile("코인 340개", "₩ 15,000"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
