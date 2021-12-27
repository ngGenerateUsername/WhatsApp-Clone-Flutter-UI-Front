// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/Models/ChatModel.dart';
import 'package:front/Screens/DetailChatPage.dart';

class CustomTileChat extends StatelessWidget {
  final ChatModel chatModel;
  const CustomTileChat({Key? key, required this.chatModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailChatPage()));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                "assets/svg/" + chatModel.icon.toString(),
                color: Colors.white,
                height: 36,
                width: 36,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            trailing: Text(chatModel.time.toString()),
            title: Text(
              chatModel.name.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 4,
                ),
                Text(
                  chatModel.currentMessage.toString(),
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 80,
              right: 20,
            ),
            child: Divider(
              thickness: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
