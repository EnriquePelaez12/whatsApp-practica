import 'package:flutter/material.dart';
import 'package:whatsapp1/model/message.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(this.msg);
  final Message msg;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          elevation: 1,
          borderRadius: BorderRadius.all(Radius.circular(3)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  msg.text,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Text(
                  //msg.datetime.toString(),
                  msg.hhmm,
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
