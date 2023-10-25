import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String uid;
  final String upassword;
  final String uname;
  final String ubirth;
  final Timestamp dateTime;


  User({
    required this.uid,
    required this.upassword,
    required this.uname,
    required this.ubirth,
    required this.dateTime,
  });

}