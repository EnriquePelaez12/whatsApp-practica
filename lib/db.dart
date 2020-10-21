import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/group.dart';
import 'model/message.dart';

//recibe los datos y los mapea
Stream<List<Group>> getGroups() {
  return Firestore.instance.collection('groups').snapshots().map(toGroupList);
}

Stream<List<Message>> getGroupMessages(String groupId) {
  return Firestore.instance
      .collection('groups/$groupId/messages')
      .orderBy('datetime', descending: true)
      .snapshots()
      .map(toMessageList);
}

//enviamos el texto del field text a la base de datos
Future<void> sendMessage(String groupId, Message msg) async {
  Firestore.instance
      .collection('groups/$groupId/messages')
      .add(msg.toFirestore());
}
