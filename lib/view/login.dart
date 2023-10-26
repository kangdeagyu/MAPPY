import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_main_project/view/register.dart';
import 'package:final_main_project/view/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  // property
  bool _passwordVisible = false;
  late TextEditingController uidController;
  late TextEditingController upasswordController;
  bool _visibility = true;
  int deleted = 0;

  late AppLifecycleState _lastLifeCycleState;

  @override
  void initState() {
    super.initState();
    uidController = TextEditingController();
    upasswordController = TextEditingController();

    WidgetsBinding.instance.addObserver(this);
    _initSharedPreferences(); // Shared Preference 초기화
  }

  //  ID PW 지우기    앱상태로 프린트찍기  => Observer
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        print("detached");
        break;
      case AppLifecycleState.resumed:
        print("resume");
        break;
      case AppLifecycleState.inactive:
        _disposeSharedPreferences();
        print("inactive");
        break;
      case AppLifecycleState.paused:
        print("paused");
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
    _lastLifeCycleState = state;
    super.didChangeAppLifecycleState(state);
  }

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
                              Get.to(const Register());
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
                        onPressed: () async {
                          await selectFirebase();
                          print("del?${deleted}");
                          Future<int> rs = loginCheck(uidController.text.trim(),
                              upasswordController.text.trim());
                          int rsNum = await rs;
                          if (rsNum == 1) {
                            // 로그인 성공
                            _saveSharedPreferences();
                            Get.to(const TabBarScreen());
                          } else {
                            // 로그인 실패
                            if (deleted == 0) {
                              // 로그인 실패사유: 아이디비번 불일치
                              _FailAlert();
                            } else {
                              // 로그인 실패사유 : 탈퇴회원
                              _FailAlert2();
                            }
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
                          Get.to(const Register());
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
                        onPressed: () async {
                          await selectFirebase();
                          if (deleted == 0) {
                            //udeleted 가 0이면 회원
                            kakao();
                          } else {
                            //udeleted 가 1이면 탈퇴회원
                            _FailAlert2();
                          }
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
                          width: 250,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ==================================== functions ====================================

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
          _ksaveSharedPreferences(user.kakaoAccount?.email);
          Get.to(const TabBarScreen());
        } else {
          // 회원가입페이지로 이동
          kakaoRegisterCheck();
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
        .where("udeleted", isEqualTo: 0)
        .get();
    int count = querySnapshot.size; // 문서 개수 세기
    return count;
  }

// 파이어베이스 DB에서 아이디 중복체크하기
  Future<int> loginCheck(String id, String pw) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("uid", isEqualTo: id)
        .where("upassword", isEqualTo: pw)
        .where("udeleted", isEqualTo: 0)
        .get();
    int count = querySnapshot.size; // 문서 개수 세기
    return count;
  }

// Firebase select
  Future<void> selectFirebase() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("user")
        .where("uid", isEqualTo: uidController.text.trim())
        .get();
    if(querySnapshot.size>0){
      deleted = querySnapshot.docs[0]["udeleted"] ?? 0;
    }else{
      print("아이디없음");
    }

    setState(() {});
  }

// ===============================================================Alert =====================================================
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

// 탈퇴된회원
  _FailAlert2() {
    Get.defaultDialog(
      title: "로그인실패",
      middleText: "탈퇴된 계정입니다.",
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

  // 카카오 계정이 회원가입되어있지 않을때
  kakaoRegisterCheck() {
    Get.defaultDialog(
      title: "",
      middleText: "회원가입을 진행하시겠습니까?.",
      barrierDismissible: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "아니오",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const Register())?.then((_) => Get.back());
                  },
                  child: const Text(
                    "예",
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // ====================================Shared Preferneces=============================================

  _initSharedPreferences() async {
    // shared preference 인스턴스 생성
    final Future<SharedPreferences> preference =
        SharedPreferences.getInstance();
    final SharedPreferences prefs = await preference;

    uidController.text = prefs.getString("p_userId") ?? ""; // null 이면 빈문자를 넣는다.
    //pw.text = prefs.getString("p_password") ?? "";

    // 메모리에 결과값이 남아있는지 테스트
    // 앱을 종료하고 다시 실행하면 Shared Preference에 남아 있으므로
    // 앱을 종료시 정리하여야 한다.
  }

  _saveSharedPreferences() async {
    // ID PW 를 저장함
    final prefernece = await SharedPreferences.getInstance();
    prefernece.setString("p_userId", uidController.text.trim());
    //prefernece.setString("p_password", pw.text.trim());
  }

  _ksaveSharedPreferences(String? id) async {
    // ID PW 를 저장함
    final prefernece = await SharedPreferences.getInstance();
    prefernece.setString("p_userId", id!);
  }

  _disposeSharedPreferences() async {
    // 저장된 ID PW를 지우기
    final prefernece = await SharedPreferences.getInstance();
    prefernece.clear();
  }
} //end
