import 'package:final_main_project/view/age_prediction.dart';
import 'package:final_main_project/view/chatbot_page.dart';
import 'package:final_main_project/view/home.dart';
import 'package:final_main_project/view/more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // 탭바 컨트롤러

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int initialTabIndex = Get.arguments ?? 0;
    _tabController.index = initialTabIndex;

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        // 탭바 스와이프 제한
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Home(),
          AgePrediction(),
          ChatbotView(),
          More(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        color: Theme.of(context).colorScheme.onPrimary,
        child: TabBar(
          labelColor: Theme.of(context).colorScheme.primary,
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.home,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.face,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.chat_bubble,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.more_horiz,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
