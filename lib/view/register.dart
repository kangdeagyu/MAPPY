import 'package:final_main_project/widget/register/register_widget.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // property
  late PageController pageController;

  @override
  void initState() {
    super.initState();
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
              hintText: "ex) seah@gmail.com",
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

