import 'package:cloud_firestore/cloud_firestore.dart';

class CardModel {
  final String id;
  final String uid;
  final String number;
  final String date;
  final String cvc;

  CardModel({
    required this.id,
    required this.uid,
    required this.number,
    required this.date,
    required this.cvc,
  });

  factory CardModel.fromDocument(DocumentSnapshot doc) {
    return CardModel(
      id: doc.id,
      uid: doc['uid'] as String,
      number: doc['number'] as String,
      date: doc['date'] as String,
      cvc: doc['cvc'] as String,
    );
  }
}
