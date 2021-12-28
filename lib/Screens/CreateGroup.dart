// ignore_for_file: file_names, unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
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
        body: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (_contacts[index].selected == false) {
                  setState(() {
                    _contacts[index].selected = true;
                    groups.add(_contacts[index]);
                  });
                } else {
                  setState(() {
                    _contacts[index].selected = false;
                    groups.remove(_contacts[index]);
                  });
                }
              },
              child: ContactTile(contacts: _contacts[index]),
            );
          },
        ));
  }

  Widget primaryCard(String name, IconData icon) {
    return InkWell(
      onTap: () => print("inkWell"),
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          child: Icon(
            icon,
            size: 26,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF25D366),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
