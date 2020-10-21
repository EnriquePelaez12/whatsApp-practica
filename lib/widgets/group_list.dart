import 'package:flutter/material.dart';
import 'package:whatsapp1/model/group.dart';
import 'group_tile.dart';

class GroupList extends StatelessWidget {
  const GroupList({@required this.groups});

  final List<Group> groups;

  @override
  Widget build(BuildContext context) {
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
  }
}
