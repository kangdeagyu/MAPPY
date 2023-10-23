import 'package:final_main_project/view/age_prediction.dart';
import 'package:final_main_project/view/chatbot.dart';
import 'package:final_main_project/view/home.dart';
import 'package:final_main_project/view/more.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _HomeState();
}

class _HomeState extends State<TabBarScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;

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
        children: const [
          Home(),
          AgePrediction(),
          ChatBot(),
          More(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: TabBar(
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