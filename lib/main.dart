import 'package:flutter/material.dart';
import 'package:whatsapp1/pages/group_List_page.dart';
import 'pages/chat_page.dart';

void main() {
  runApp(FirebaseWhatsApp());
}

class FirebaseWhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => GroupListPage(),
        '/chat': (_) => ChatPage(),
      },
    );
  }
}
