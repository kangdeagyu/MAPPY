import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HistoryModel {
  final String id;
  final String category;
  final int price;
  final DateTime usedate;

  HistoryModel({
    required this.id,
    required this.category,
    required this.price,
    required this.usedate,
  });

  factory HistoryModel.fromDocument(DocumentSnapshot doc) {
    Timestamp timestamp = doc['usedate'];
    DateTime dateTime = timestamp.toDate();
    return HistoryModel(
      id: doc.id,
      category: doc['category'] as String,
      price: doc['price'],
      usedate: dateTime,
    );
  }

  String getFormattedDate() {
    final format = DateFormat('MM월 dd일 HH:mm');
    return format.format(usedate);
  }
}
