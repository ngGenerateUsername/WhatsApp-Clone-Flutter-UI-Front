// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:front/components/CustomTileChat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('floatingButton'),
        child: Icon(Icons.chat),
      ),
      body: ListView(
        children: [
          CustomTileChat(),
          CustomTileChat(),
          CustomTileChat(),
        ],
      ),
    );
  }
}
