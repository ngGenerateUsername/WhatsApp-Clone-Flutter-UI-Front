// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:front/Models/ChatModel.dart';
import 'package:front/Screens/SelectContact.dart';
import 'package:front/components/CustomTileChat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Ahmed Ben Hamouda",
        isGroup: false,
        currentMessage: "Hi How are you!",
        time: "4:00",
        icon: "person.svg"),
    ChatModel(
        name: "Flech Family",
        isGroup: true,
        currentMessage: "famma?",
        time: "10:00",
        icon: "groups.svg"),
    ChatModel(
        name: "Mourad krakeb",
        isGroup: false,
        currentMessage: "hello!",
        time: "13:00",
        icon: "person.svg"),
    ChatModel(
        name: "karim jounta",
        isGroup: false,
        currentMessage: "ana fel sale de jeux a5lat",
        time: "00:00",
        icon: "person.svg"),
    ChatModel(
        name: "DSI 32",
        isGroup: true,
        currentMessage: "ghodwa mana9rawech",
        time: "21:00",
        icon: "groups.svg"),
    ChatModel(
        name: "Ahmed Ben Hamouda",
        isGroup: false,
        currentMessage: "Happy birthday!",
        time: "00:01",
        icon: "person.svg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return SelectContact();
            }),
          );
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) =>
            CustomTileChat(chatModel: chats[index]),
      ),
    );
  }
}
