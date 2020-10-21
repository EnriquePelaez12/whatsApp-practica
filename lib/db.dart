import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/group.dart';

Stream<List<Group>> getGroups() {
  return Firestore.instance.collection('groups').snapshots().map(toGroupList);
}
