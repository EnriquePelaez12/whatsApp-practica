import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id, text, userId;
  DateTime dateTime;
//obtengo los datos de firebase
  Message.fromFirestore(DocumentSnapshot doc)
      : id = doc.documentID,
        text = doc.data['text'],
        dateTime = (doc.data['datetime'] as Timestamp).toDate();
}

List<Message> toMessageList(QuerySnapshot query) {
  return query.documents.map((doc) => Message.fromFirestore(doc)).toList();
}
