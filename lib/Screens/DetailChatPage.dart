// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace, curly_braces_in_flow_control_structures, must_call_super, unused_field, prefer_final_fields
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus)
        setState(() {
          showEmoji = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () {
            if (showEmoji) {
              setState(() {
                showEmoji = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin:
                                EdgeInsets.only(left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message...",
                                contentPadding: EdgeInsets.all(5),
                                prefixIcon: IconButton(
                                    icon: Icon(
                                      Icons.emoji_emotions,
                                    ),
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        showEmoji = !showEmoji;
                                      });
                                    }),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return bottomModal();
                                            });
                                      },
                                      icon: Icon(Icons.attach_file),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            right: 5,
                            left: 2,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF128C7E),
                            radius: 25,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    showEmoji ? emojSelect() : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emojSelect() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3 + 10,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          //  _controller.text = _controller.text + emoji.emoji; //working also
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        },
      ),
    );
  }

  Widget bottomModal() {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.insert_drive_file,
                    Colors.indigo,
                    "Document",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.camera_alt,
                    Colors.pink,
                    "Camera",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.insert_photo,
                    Colors.purple,
                    "Gallery",
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.headset,
                    Colors.orange,
                    "Audio",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.location_pin,
                    Colors.teal,
                    "Location",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.person,
                    Colors.blue,
                    "Contact",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData iconData, Color color, String iconTitle) {
    return InkWell(
      onTap: () => print("tap tap"),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(
              iconData,
              size: 29,
              color: Colors.white,
            ),
            backgroundColor: color,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            iconTitle,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
