import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/view/register.dart';
import 'package:final_main_project/view/tabbar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

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
                        onPressed: () async{
                          Future<int> rs = loginCheck(uidController.text.trim(),upasswordController.text.trim());
                          int rsNum = await rs;
                          if (rsNum == 1 ){
                            // 로그인 성공
                            Get.to(const TabBarScreen());
                          }else{
                            // 로그인 실패
                            _FailAlert();
                          }
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
                      ElevatedButton(
                        onPressed: () {
                          kakao();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            //  버튼 모양 깎기
                            borderRadius: BorderRadius.circular(30), // 10은 파라미터
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 240, 0),
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

kakao() async {
  // 카카오 로그인 구현 예제

// 카카오톡 실행 가능 여부 확인
// 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공');
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      await UserApi.instance.loginWithKakaoAccount();
      print('카카오계정으로 로그인 성공');
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n이메일: ${user.kakaoAccount?.email}');

      //  이메일이 회원가입이 되어있는지 아닌지 확인하기
      Future<int> rsNum = kakaoidCheck(user.kakaoAccount?.email);
      int rs = await rsNum;
      print("중복은${rs}");
      if (rs == 1) {
        //_showDialog();
        Get.to(const TabBarScreen());
      } else {
        //toSignUp(user.kakaoAccount?.email);
      }
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}

// 파이어베이스 DB에서 카카오아이디 중복체크하기
Future<int> kakaoidCheck(String? id) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection("user")
      .where("uid", isEqualTo: id)
      .get();
  int count = querySnapshot.size; // 문서 개수 세기
  return count;
}


// 파이어베이스 DB에서 카카오아이디 중복체크하기
Future<int> loginCheck(String id,String pw) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection("user")
      .where("uid", isEqualTo: id)
      .where("upassword", isEqualTo: pw)
      .get();
  int count = querySnapshot.size; // 문서 개수 세기
  return count;
}

// 아이디 비번이 일치하지 않을때
  _FailAlert() {
    Get.defaultDialog(
      title: "로그인실패",
      middleText: "계정과 비밀번호를 확인해주세요",
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text(
                "OK",
              ),
            ),
          ],
        ),
      ],
    );
  }