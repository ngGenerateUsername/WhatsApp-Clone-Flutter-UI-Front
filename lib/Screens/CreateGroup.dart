// ignore_for_file: file_names, unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, curly_braces_in_flow_control_structures, prefer_is_empty
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/Models/ChatModel.dart';
import 'package:front/components/ContactTile.dart';
import 'package:front/main.dart';
import 'package:front/pages/ChatPage.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  // ignore: prefer_final_fields
  List<ChatModel> _contacts = [
    ChatModel(
      name: "Ahmed Ben Hamouda",
      status: "Future Engineer,Full Stack Developer",
    ),
    ChatModel(
      name: "Albert Einstein",
      status: "Jobless",
    ),
    ChatModel(
      name: "Pablo Escobar",
      status: "Software Engineer",
    ),
    ChatModel(
      name: "Cristiano Ronaldo",
      status: "disabled",
    ),
    ChatModel(
      name: "Ahmed Rafrafi",
      status: "Dentist",
    ),
    ChatModel(
      name: "Haithem Mabrouk",
      status: "rapper",
    ),
    ChatModel(
      name: "Bilel Ifa",
      status: "Football Player",
    ),
    ChatModel(
      name: "Faouzi benzarti",
      status: "Best Football manager ever!",
    ),
    ChatModel(
      name: "Lionel Messi",
      status: "Football Player",
    ),
    ChatModel(
      name: "Taher Ben hassine",
      status: "Pro photographer",
    ),
    ChatModel(
      name: "Changlou Flech",
      status: "No body know ...",
    ),
  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    //----------------------------

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: _contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (_contacts[index - 1].selected == false) {
                      setState(() {
                        _contacts[index - 1].selected = true;
                        groups.add(_contacts[index - 1]);
                      });
                    } else {
                      setState(() {
                        _contacts[index - 1].selected = false;
                        groups.remove(_contacts[index - 1]);
                      });
                    }
                  },
                  child: ContactTile(contacts: _contacts[index - 1]),
                );
              },
            ),
            groups.length > 0
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: groups.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                int finder = _contacts.indexOf(groups[index]);
                                _contacts[finder].selected = false;
                                groups.remove(groups[index]);
                              });
                            },
                            child: AvatarCard(groups[index].name.toString()),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  )
                : Container(),
          ],
        ));
  }

  Widget AvatarCard(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                child: SvgPicture.asset(
                  "assets/svg/person.svg",
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
                backgroundColor: Colors.blueGrey[200],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
