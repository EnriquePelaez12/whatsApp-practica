import 'package:flutter/material.dart';
import 'package:whatsapp1/db.dart' as db; //para usar solo la variable db
import 'package:whatsapp1/model/group.dart';
import 'package:whatsapp1/model/message.dart';
import 'package:whatsapp1/widgets/loading.dart';
import 'package:whatsapp1/widgets/message_list.dart';
import 'package:whatsapp1/widgets/red_error.dart';

//Pagina de los mensajes
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(group.name)),
      body: StreamBuilder(
        stream: db.getGroupMessages(group.id),
        builder: (context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.hasError) {
            return RedError(snapshot.error);
          }
          if (!snapshot.hasData) {
            return Loading();
          }
          return MessageList(messages: snapshot.data);
        },
      ),
    );
  }
}
