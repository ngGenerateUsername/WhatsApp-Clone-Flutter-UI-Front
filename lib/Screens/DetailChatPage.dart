// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/Models/ChatModel.dart';

class DetailChatPage extends StatefulWidget {
  final ChatModel chatModel;
  const DetailChatPage({Key? key, required this.chatModel}) : super(key: key);

  @override
  _DetailChatPageState createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                child: SvgPicture.asset(
                  "assets/svg/" + widget.chatModel.icon.toString(),
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
                radius: 20,
                backgroundColor: Colors.blueGrey,
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () => print('access profile'),
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name.toString(),
                  style: TextStyle(
                    fontSize: 18.6,
                  ),
                ),
                Text(
                  "last seen todaty at " + widget.chatModel.time.toString(),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('stop pressing the camera dude');
            },
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {
              print('sto pressing the phone please');
            },
            icon: Icon(Icons.phone),
          ),
          PopupMenuButton(
              onSelected: (value) => print(value),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text('View Contact'),
                    value: 'view contact',
                  ),
                  PopupMenuItem(
                    child: Text('Media, links, and docs'),
                    value: 'media_links_docs',
                  ),
                  PopupMenuItem(
                    child: Text('Whatsapp Web'),
                    value: 'whatsApp web',
                  ),
                  PopupMenuItem(
                    child: Text('Search'),
                    value: 'Search',
                  ),
                  PopupMenuItem(
                    child: Text('Mute Notification'),
                    value: 'mute notification',
                  ),
                  PopupMenuItem(
                    child: Text('Wallpaper'),
                    value: 'wallpaper',
                  ),
                ];
              })
        ],
      ),
    );
  }
}
