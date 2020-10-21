//En esta clase van los datos de la base de datos
//para no mesclarlos en otras clases

import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String id;
  String name;

  Group.fromFirestore(DocumentSnapshot doc)
      : id = doc.documentID,
        name = doc.data['name'];
}

List<Group> toGroupList(QuerySnapshot query) {
  return query.documents.map((doc) => Group.fromFirestore(doc)).toList();
}
