import 'package:flutter/material.dart';
import 'package:whatsapp1/model/group.dart';

class GroupTile extends StatelessWidget {
  const GroupTile(this.group);

  final Group group;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 45,
        decoration: BoxDecoration(
          color: Colors.teal[100],
          shape: BoxShape.circle,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(group.name),
          Text(
            '20/10/2020',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
          )
        ],
      ),
      subtitle: Text(group.id),
    );
  }
}
