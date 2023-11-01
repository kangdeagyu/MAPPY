import 'package:final_main_project/view/register.dart';
import 'package:final_main_project/view/tabbar_screen.dart';
import 'package:final_main_project/viewmodel/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginVM());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: GetBuilder<LoginVM>(
          builder: (controller) {
            return SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "welcome !",
                          style: TextStyle(
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold, // 글자 굵기 설정
                            fontStyle: FontStyle.italic, // 글자 스타일 설정 (기울임)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 50.w, 8.w, 8.w),
                    child: Container(
                      width: 320.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color:
                            Color.fromRGBO(128, 128, 128, 220), // 텍스트 필드의 배경색
                        borderRadius:
                            BorderRadius.circular(10), // 테두리의 radius 설정
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: controller.uidController,
                        decoration: InputDecoration(
                          labelText: '계정',
                          fillColor: Color(0xFFF7F8F9), // 배경색을 원하는 색상으로 변경
                          filled: true,
                          border: InputBorder.none, // 경계 색상 없애기
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 320.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(128, 128, 128, 220), // 텍스트 필드의 배경색
                      borderRadius: BorderRadius.circular(10), // 테두리의 radius 설정
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.upasswordController,
                      obscureText:
                          !controller.passwordVisible, //이것은 텍스트를 동적으로 가리게 할 것이다
                      decoration: InputDecoration(
                        labelText: '비밀번호',
                        fillColor: Color(0xFFF7F8F9), // 배경색을 원하는 색상으로 변경
                        filled: true, // fillColor을 사용하려면 true로 설정해야 합니다.
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            // passwordVisible 상태에 따라 아이콘을 선택한다
                            controller.passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // 상태를 업데이트한다. 즉, passwordVisible 변수의 상태를 토글한다.
                            controller.transPW();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10.h, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // 버튼 누르기 액션
                            controller.findPW(context);
                          },
                          style: TextButton.styleFrom(
                            // 버튼 스타일
                            foregroundColor: Colors.blue,
                          ),
                          child: const Text(
                            "비밀번호 찾기",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      controller.selectFirebase();
                      print("del?${controller.deleted}");
                      // Get.to(LoginPage());
                      Future<int> rs = controller.loginCheck(
                          controller.uidController.text.trim(),
                          controller.upasswordController.text.trim());
                      int rsNum = await rs;
                      if (rsNum == 1) {
                        // 로그인 성공
                        controller.saveSharedPreferences();
                        Get.to(const TabBarScreen());
                      } else {
                        // 로그인 실패
                        if (controller.deleted == 0) {
                          // 로그인 실패사유: 아이디비번 불일치
                          controller.FailAlert();
                        } else {
                          // 로그인 실패사유 : 탈퇴회원
                          controller.FailAlert2();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        //  버튼 모양 깎기
                        borderRadius: BorderRadius.circular(5), // 10은 파라미터
                      ),
                      minimumSize: const Size(300, 40),
                    ),
                    child: Text(
                      "로그인",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80, // 원하는 가로줄 두께 설정
                          color: Theme.of(context).colorScheme.onBackground, // 가로줄의 색상 설정
                          height: 1, // 가로줄의 높이 설정
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                          child: Text(
                            "다른 방법으로 로그인",
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ),
                        Container(
                          width: 80, // 원하는 가로줄 두께 설정
                          color: Theme.of(context).colorScheme.onBackground, // 가로줄의 색상 설정
                          height: 1, // 가로줄의 높이 설정
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: InkWell(
                          onTap: () async {
                            // 이미지 버튼을 탭했을 때 수행할 작업
                            // await controller.selectFirebase();
                            // if (controller.deleted == 0) {
                            //   //udeleted 가 0이면 회원
                            //   controller.kakao();
                            // } else {
                            //   //udeleted 가 1이면 탈퇴회원
                            //   controller.FailAlert2();
                            // }
                            controller.kakao();
                          },
                          child: Image.asset(
                            "assets/images/kakao.png",
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                      ),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: InkWell(
                          onTap: () {
                            // 이미지 버튼을 탭했을 때 수행할 작업
                          },
                          child: Image.asset(
                            "assets/images/google.png",
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                      ),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: InkWell(
                          onTap: () {
                            // 이미지 버튼을 탭했을 때 수행할 작업
                          },
                          child: Image.asset(
                            "assets/images/naver.png",
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                      ),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: InkWell(
                          onTap: () {
                            // 이미지 버튼을 탭했을 때 수행할 작업
                          },
                          child: Image.asset(
                            "assets/images/apple.png",
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "아직 회원이 아니시라면 ?",
                          style: TextStyle(
                            // 글씨 스타일주기
                            color: Theme.of(context).colorScheme.onBackground, // 글씨 색상
                            fontSize: 15, // 글씨 크기
                            //fontWeight: FontWeight.bold, // 폰트 사이즈
                            //letterSpacing: 1, // 글자 간 간격
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // 버튼 누르기 액션
                            // dart code
                            Get.to(const Register());
                          },
                          style: TextButton.styleFrom(
                            // 버튼 스타일
                            foregroundColor: Colors.blue,
                          ),
                          child: const Text(
                            "회원가입",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
