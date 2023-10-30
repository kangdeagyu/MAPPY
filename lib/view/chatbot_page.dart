import 'dart:async';

import 'package:final_main_project/components/more/charge_components.dart';
import 'package:final_main_project/styles/text_style.dart';
import 'package:final_main_project/viewmodel/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatbotView extends StatefulWidget {
  ChatbotView({Key? key}) : super(key: key);

  @override
  _ChatbotViewState createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final TextEditingController _controller = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey bottomSheetKey = GlobalKey();
  double? bottomSheetHeight;
  bool isKeyboardOpen = false;
  String? userId;

  final vm = Get.put(Chatbot());
  


  @override
  void dispose() {
    _animationController.dispose();
    _scaleController.dispose();
    _fadeController.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_scaleController);

    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);

    // 바텀 시트의 높이를 첫 프레임 렌더링 후에 가져오기
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        bottomSheetHeight = getBottomSheetHeight();
        _scrollToBottom();
      });
    });

    _loadUserId();
  } // init State

    _loadUserId() async {
    userId = await getUserId();
    setState(() {});  // UI 업데이트
  }

  

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    isKeyboardVisible ? _keyboardOpenScrollToBottom() : print("키보드 닫힘");

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Chatbot_Icon.png'),
                  backgroundColor: Colors.white,
                  radius: 20,
                ),
                SizedBox(width: 8),
                Text('세아'),
              ],
            ),
            centerTitle: false,
            actions: [
              const Icon(
                Icons.monetization_on,
                color: Colors.green,
                size: 25,
              ),
              SizedBox(
                width: 5,
              ),
              Obx(() {
                return Text(
                  '${vm.myCoin.value}',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                );
              }),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          body: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 60,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("chat")
                            .doc(userId)
                            .collection('messages')
                            .orderBy('insertdate', descending: false)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final messages = snapshot.data!.docs;
                            return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                final message = messages[index];
                                final speaker = message['speaker'] ?? '';
                                final content = message['content'] ?? '';
                                // final userId = message['userid'];
                                return _buildChatItem(speaker, content);
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildChatInputField(),
              ),
            ],
          ),
          // bottomSheet: ,
        ),
      ),
    );
  }

  Widget _buildChatItem(String speaker, String content) {
    if (_animationController.status != AnimationStatus.completed ||
        _scaleController.status != AnimationStatus.completed ||
        _fadeController.status != AnimationStatus.completed) {
      _animationController.forward(from: 0.0);
      _scaleController.forward(from: 0.0);
      _fadeController.forward(from: 0.0);
    }

    if (speaker == 'seah') {
      return SlideTransition(
        position: _slideAnimation,
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/Chatbot_Icon.png'),
                backgroundColor: Colors.white,
                radius: 20,
              ),
              const SizedBox(width: 8),
              Align(
                  child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 240.h),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.only(right: 80.0, bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(content),
                ),
              )),
            ],
          ),
        ),
      );
    } else {
      return SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Padding(
                padding: EdgeInsets.all(8.0.h),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: 240.h), // 여기에서 maxWidth를 설정합니다.
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        margin: const EdgeInsets.only(left: 80.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.green[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          content,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
              ),
            ),
          ));
    }
  }

  Widget _buildChatInputField() {
    return Container(
      key: bottomSheetKey,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '세아에게 보내기',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                if (vm.myCoin.value.toInt() >= 10) {
                  sendChatText(_controller.text);
                  _controller.clear();
                } else {
                  Get.dialog(
                    AlertDialog(
                      title: Row(
                        children: [
                          Image.asset(
                            'assets/images/Chatbot_Icon.png',
                            height: 70.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '보유 코인이 부족해요!!\n충전하시겠어요?',
                            style: onBackgroundTextStyle(context, 18),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('취소'),
                        ),

                        TextButton(
                          onPressed: () async {
                            Get.back();
                            Get.bottomSheet(
                              Container(
                                height: 600.h,
                                color: Colors.white,
                                child: const ChargeWidget(),
                              ),
                              isScrollControlled: true,
                            );
                          },
                          child: const Text('확인'),
                        ),
                      ],
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> sendChatText(String text) async {
    vm.useCoin(10);
    // 1. 사용자 메시지 화면에 즉시 표시
    input(userId!, text);
    _scrollToBottom();

    // 2. "대화를 분석 중..." 메시지 화면에 즉시 표시
    DocumentReference tempRef = await output(userId!, "대화를 분석 중...");
    _scrollToBottom();

    final url = 'http://18.218.101.241:5000/ChatModel/chat';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'text': text,
      },
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print(responseData);
      String resultText = responseData['result'];

      // 3. 백그라운드에서 메시지를 데이터베이스에 저장하고 "대화를 분석 중..." 메시지 업데이트
      await tempRef.update({'content': resultText});
    } else {
      print('Failed to send the text. StatusCode: ${response.statusCode}');
      // 실패한 경우 "대화를 분석 중..." 메시지를 "응답을 받지 못했습니다."로 업데이트
      await tempRef.update({'content': "응답을 받지 못했습니다."});
    }
    _scrollToBottom();
  }

  // addChat 함수를 업데이트해서 DocumentReference를 반환하도록 변경
  Future<DocumentReference> input(String userid, String content) async {
    // 'chat' 컬렉션 참조
    CollectionReference chat = FirebaseFirestore.instance.collection('chat');
    
    // 'userid'를 문서로 사용
    DocumentReference userDoc = chat.doc(userid);
    
    // 해당 'userid' 문서 아래의 'messages' 컬렉션 참조
    CollectionReference messages = userDoc.collection('messages');
    
    // 'messages' 컬렉션에 채팅 내용 추가
    return await messages.add({
      'speaker' : userid,
      'content': content,
      'insertdate': Timestamp.fromDate(DateTime.now()),
    });
  }


  Future<DocumentReference> output(String userid, String content) async {
    // 'chat' 컬렉션 참조
    CollectionReference chat = FirebaseFirestore.instance.collection('chat');
    
    // 'userid'를 문서로 사용
    DocumentReference userDoc = chat.doc(userid);
    
    // 해당 'userid' 문서 아래의 'messages' 컬렉션 참조
    CollectionReference messages = userDoc.collection('messages');
    return await messages.add({
      'speaker': "seah",
      'content': content,
      'insertdate': Timestamp.fromDate(DateTime.now()),
    });
  }

  

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void _keyboardOpenScrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        double offset = _scrollController.position.maxScrollExtent +
            MediaQuery.of(context).viewInsets.bottom;

        // 키보드가 올라왔을 때의 추가 패딩을 고려
        double extraPadding = bottomSheetHeight ?? 0;

        _scrollController.jumpTo(offset.h + extraPadding.h * 2);
      }
    });
  }

  double? getBottomSheetHeight() {
    final RenderBox? renderBox =
        bottomSheetKey.currentContext?.findRenderObject() as RenderBox?;
    print("바텀 시트 높이 = (${renderBox?.size.height})");
    return renderBox?.size.height;
  }

  // 로그인 한 유저 아이디 가져오기
  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('p_userId');
  }

  // //보유 코인 개수 가져오기
  // Future<void> checkCoin() async {
  //   try {
  //     String userId = await getUserId();
  //     FirebaseFirestore.instance
  //         .collection("user")
  //         .where("uid", isEqualTo: userId)
  //         .snapshots()
  //         .listen((querySnapshot) {
  //       if (querySnapshot.docs.isNotEmpty) {
  //         myCoin.value = querySnapshot.docs[0]['coin'];
  //       }
  //     });
  //   } catch (error) {
  //     // print("코인 가져오기 오류: $error");
  //   }
  // }




}   // End View
