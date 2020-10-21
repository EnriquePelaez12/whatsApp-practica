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
      .snapshots()
      .map(toMessageList);
}
