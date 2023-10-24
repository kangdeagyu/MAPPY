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
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 80.h),
                  child: GestureDetector(
                    onTap: () => Get.to(const TabBarScreen()),
                    child: Image.asset(
                      "assets/images/login.png",
                      width: 300.w,
                      height: 350.h,
                      fit: BoxFit.fill, //이미지 가득채우기
                    ),
                  ),
                ),
                Visibility(
                  visible: !_visibility,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 340.w,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: uidController,
                          decoration: InputDecoration(
                            labelText: '계정',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 340.w,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: upasswordController,
                          obscureText:
                              !_passwordVisible, //이것은 텍스트를 동적으로 가리게 할 것이다
                          decoration: InputDecoration(
                            labelText: '비밀번호',
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
                              setState(() {});
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
                      ElevatedButton(
                        onPressed: () {
                          //login();
                          _visibility = !_visibility;
                          Get.to(const TabBarScreen());
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF4081), // 버튼 배경색
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary, // 버튼 글씨색
                          shape: RoundedRectangleBorder(
                            //  버튼 모양 깎기
                            borderRadius: BorderRadius.circular(10), // 10은 파라미터
                          ),
                        ),
                        child: const Text(
                          "로그인",
                        ),
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
                      SizedBox(
                        height: 5.h,
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
                      SizedBox(
                        height: 5.h,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     print("버튼 클릭");
                      //   },
                      //   child: SizedBox(
                      //     width: 300,
                      //     height: 40,
                      //     child: Image.asset(
                      //       "assets/images/kakao_login.png",
                      //       fit: BoxFit.fill,
                      //     ),
                      //   ),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          //login();
                          //_visibility = !_visibility;
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            //  버튼 모양 깎기
                            borderRadius: BorderRadius.circular(30), // 10은 파라미터
                          ),
                          backgroundColor: const Color.fromARGB(255, 255, 240, 0),
                          minimumSize: const Size(300, 40),
                        ),
                        child: Image.asset(
                          "assets/images/kakao_login.png",
                          //fit: BoxFit.fill,
                          width: 250,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// // functions
// // kakao login
//   kakao() async {
//     try {
//       bool isInstalled = await isKakaoTalkInstalled();

//       OAuthToken token = isInstalled
//           ? await UserApi.instance.loginWithKakaoTalk()
//           : await UserApi.instance.loginWithKakaoAccount();

//       final url = Uri.https('kapi.kakao.com', '/v2/user/me');

//       final response = await http.get(
//         url,
//         headers: {
//           HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
//         },
//       );

//       final profileInfo = json.decode(response.body);
//       print(profileInfo.toString());
//       print(profileInfo["id"]);
//       print(profileInfo["kakao_account"]);

//       try {
//         User user = await UserApi.instance.me();
//         print('사용자 정보 요청 성공'
//             '\n회원번호: ${user.id}'
//             '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
//             '\n이메일: ${user.kakaoAccount?.email}');

//         //  이메일이 회원가입이 되어있는지 아닌지 확인하기
//         Future<int> rsNum = kakaoLoginAction(user.kakaoAccount?.email);
//         int rs = await rsNum;
//         if (rs == 1) {
//           _showDialog();
//         } else {
//           toSignUp(user.kakaoAccount?.email);
//         }
//       } catch (error) {
//         print('사용자 정보 요청 실패 $error');
//       }
//     } catch (error) {
//       print('카카오톡으로 로그인 실패 $error');
//     }
//   }