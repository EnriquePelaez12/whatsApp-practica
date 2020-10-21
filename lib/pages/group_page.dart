import 'package:flutter/material.dart';
import 'package:whatsapp1/db.dart' as db;
import 'package:whatsapp1/model/group.dart';
import 'package:whatsapp1/widgets/group_tile.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase WhastApp')),
      body: StreamBuilder(
        stream: db.getGroups(),
        // stream: Firestore.instance.collection('groups').snapshots(),
        builder: (context, AsyncSnapshot<List<Group>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(backgroundColor: Colors.red),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Group> groups = snapshot.data;
          return ListView.separated(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              return GroupTile(groups[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                //divicion entre cada mensaje
                height: 1,
                indent: 75,
                endIndent: 15,
              );
            },
          );
        },
      ),
    );
  }
}

/*

Para probar tu coneccion con la bd

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase WhastApp')),
      body: StreamBuilder(
        stream: Firestore.instance.collection('groups').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<DocumentSnapshot> docs = snapshot.data.documents;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(docs[index].data['name']),
              );
            },
          );
        },
      ),
    );
  }
}

 */
