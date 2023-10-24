import 'package:final_main_project/viewmodel/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // property
  late TextEditingController uidController;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    uidController = TextEditingController();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "회원가입 폼",
          ),
        ),
        body: PageView(
          controller: pageController,
          children: [
            RegistrationPage(
              labelText: "계정",
              hintText: "사용하실 계정을 입력해 주세요",
              nextPage: nextPage,
              previousPage: previousPage,
            ),
            RegistrationPage(
              labelText: "비밀번호",
              hintText: "비밀번호를 입력해 주세요",
              nextPage: nextPage,
              previousPage: previousPage,
            ),
            RegistrationPage(
              labelText: "이름",
              hintText: "이름을 입력해 주세요",
              nextPage: nextPage,
              previousPage: previousPage,
            ),
            RegistrationPage(
              labelText: "생년월일",
              hintText: "ex) 980501",
              nextPage: nextPage,
              previousPage: previousPage,
            ),
            // Add more pages here
          ],
        ),
      ),
    );
  }
}



// widget register form
class RegistrationPage extends StatelessWidget {
  final String labelText;
  final String hintText;
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  RegistrationPage({
    required this.labelText,
    required this.hintText,
    required this.nextPage,
    required this.previousPage,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(VisibleController()); //controller등록
    return Container(
      width: 300,
      height: 400,
      color: Colors.white,
      child: GetBuilder<VisibleController>(
        builder: (controller) {
          return Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                width: 340.w,
                //height: 200.h,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    labelText: labelText,
                    hintText: hintText,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.h, 10.w, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: controller.counter == 1 ? false : true,
                      child: ElevatedButton(
                        onPressed: () {
                          previousPage();
                          controller.decrease();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF4081),
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "이전",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        nextPage();
                        controller.increase();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF4081),
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child:  Text(
                        controller.counter==4 ? "회원가입" : "다음",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


