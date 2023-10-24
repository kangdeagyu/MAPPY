import 'package:final_main_project/view/register.dart';
import 'package:final_main_project/view/tabbar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // property
  bool _passwordVisible = false;
  TextEditingController upasswordController = TextEditingController();
  TextEditingController uidController = TextEditingController(); //text: Message
  bool _visibility = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/login.png",
                  width: 300.w,
                  height: 300.h,
                  fit: BoxFit.fill, //이미지 가득채우기
                ),
                Visibility(
                  visible: !_visibility,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: uidController,
                        decoration: InputDecoration(
                          labelText: 'ID',
                          hintText: 'Enter your ID',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: upasswordController,
                        obscureText: !_passwordVisible, //이것은 텍스트를 동적으로 가리게 할 것이다
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // passwordVisible 상태에 따라 아이콘을 선택한다
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // 상태를 업데이트한다. 즉, passwordVisible 변수의 상태를 토글한다.
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "아직 회원이 아니시라면 ?",
                            style: TextStyle(
                              // 글씨 스타일주기
                              color: Colors.black, // 글씨 색상
                              fontSize: 15, // 글씨 크기
                              //fontWeight: FontWeight.bold, // 폰트 사이즈
                              //letterSpacing: 1, // 글자 간 간격
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // 버튼 누르기 액션
                              // dart code
                              _visibility = !_visibility;
                              setState(() {
                                
                              });
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
                    ],
                  ),
                ),
                Visibility(
                  visible: _visibility,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //login();
                          _visibility = !_visibility;
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            //  버튼 모양 깎기
                            borderRadius: BorderRadius.circular(30), // 10은 파라미터
                          ),
                          minimumSize: const Size(300, 40),
                        ),
                        child: const Text(
                          "로그인",
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //login();
                          //_visibility = !_visibility;
                          Get.to(const Register());
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            //  버튼 모양 깎기
                            borderRadius: BorderRadius.circular(30), // 10은 파라미터
                          ),
                          minimumSize: const Size(300, 40),
                        ),
                        child: const Text(
                          "회원가입",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //login();
                    _visibility = !_visibility;
                    Get.to(const TabBarScreen());
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primary, // 버튼 배경색
                    foregroundColor:
                        Theme.of(context).colorScheme.onPrimary, // 버튼 글씨색
                    shape: RoundedRectangleBorder(
                      //  버튼 모양 깎기
                      borderRadius: BorderRadius.circular(10), // 10은 파라미터
                    ),
                  ),
                  child: const Text(
                    "클릭(지울거)",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
