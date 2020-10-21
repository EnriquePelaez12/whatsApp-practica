import 'package:flutter/material.dart';
import 'package:whatsapp1/db.dart' as db; //para usar solo la variable db
import 'package:whatsapp1/model/group.dart';
import 'package:whatsapp1/model/message.dart';
import 'package:whatsapp1/widgets/loading.dart';
import 'package:whatsapp1/widgets/message_box.dart';
import 'package:whatsapp1/widgets/message_list.dart';
import 'package:whatsapp1/widgets/red_error.dart';

//Pagina de los mensajes
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(group.name)),
      backgroundColor: Colors.teal[100],
      body: StreamBuilder(
        stream: db.getGroupMessages(group.id),
        builder: (context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.hasError) {
            return RedError(snapshot.error);
          }
          if (!snapshot.hasData) {
            return Loading();
          }
          return Stack(
            children: <Widget>[
              LayoutBuilder(builder: (context, BoxConstraints constraints) {
                //print(constraints); //ajustamos la imagen a la resolucion de la pantalla
                return Image.asset(
                  'assets/background.png',
                  width: constraints.maxHeight,
                  //height: constraints.maxWidth,
                  fit: BoxFit.cover,
                );
              }),

              // Image.asset('assets/background.jpg'),
              Column(
                children: <Widget>[
                  Expanded(
                    child: MessageList(messages: snapshot.data),
                  ),
                  MessageBox(onSend: (text) {
                    db.sendMessage(group.id, Message(text));
                  })
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
