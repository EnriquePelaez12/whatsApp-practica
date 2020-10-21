import 'package:flutter/material.dart';

//*********** Message Box Aqui texfiel y el teclado******************** */

class MessageBox extends StatefulWidget {
  final Function onSend;
  MessageBox({this.onSend});

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

//para no dejar memori list, para no dejar basura o usar mucha memoria cuando se deja abierta la app
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Metodo para borrar el texto del textfield una vez enviado el mensaje
  _send(String text) {
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: _controller,
            onSubmitted: _send,
          )),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _send(_controller.text),
          ),
        ],
      ),
    );
  }
}
