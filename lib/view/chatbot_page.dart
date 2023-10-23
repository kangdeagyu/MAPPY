import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // addTempData();  // 주의: build 메서드 내에서 호출하면 여러 번 호출될 수 있습니다.

    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅방"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
        .collection("chat")
        .orderBy('insertdate', descending: true)
        .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(); // 로딩 인디케이터를 보여줍니다.
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // 데이터가 있는 경우, 해당 데이터로 리스트 뷰 등을 만들어 반환합니다.
            final messages = snapshot.data!.docs;
            return ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final content = message['content'] ?? '';
                final userId = message['userid'];

              if (userId == 'seah') {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,  // 상단 정렬
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Chatbot_Icon.png'),  // 'seah'의 프로필 이미지 경로
                      radius: 20,  // 원하는 크기로 조정
                    ),
                    SizedBox(width: 8),  // 이미지와 메시지 사이의 간격
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(right: 80.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(content),
                      ),
                    ),
                  ],
                );
                } else {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(left: 80.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(content),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  // Functions ----
  void addTempData() async {
    CollectionReference rein = FirebaseFirestore.instance.collection('chat');

    await rein.add({
      'userid': 'donghyun',
      'content': 'Test Question.',
      'insertdate': DateTime.now().toIso8601String(),
    });
  }
}
