import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String uid;
  final String upassword;
  final String uname;
  final String birth;
  final Timestamp dateTime;


  User({
    required this.uid,
    required this.upassword,
    required this.uname,
    required this.birth,
    required this.dateTime,
  });

}