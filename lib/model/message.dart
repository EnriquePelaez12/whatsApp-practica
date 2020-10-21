import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id, text, userId;
  DateTime datetime;
//obtengo los datos de firebase
  Message.fromFirestore(DocumentSnapshot doc)
      : id = doc.documentID,
        text = doc.data['text'],
        datetime = (doc.data['datetime'] as Timestamp).toDate();

  Map<String, dynamic> toFirestore() => {
        'text': text,
        'datetime': datetime,
      };

  Message(this.text)
      : datetime = DateTime.now(); // se formatea la fecha para obtener la hora
  String get hhmm =>
      '${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
}

List<Message> toMessageList(QuerySnapshot query) {
  return query.documents.map((doc) => Message.fromFirestore(doc)).toList();
}
