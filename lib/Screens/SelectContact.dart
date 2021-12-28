// ignore_for_file: file_names, unused_import, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:front/Models/ChatModel.dart';
import 'package:front/Screens/CreateGroup.dart';
import 'package:front/components/ContactTile.dart';
import 'package:front/main.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  // ignore: prefer_final_fields
  @override
  Widget build(BuildContext context) {
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
    //----------------------------

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "25 contacts",
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
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Invite a friend'),
                  value: 'invite a friend',
                ),
                PopupMenuItem(
                  child: Text('contacts'),
                  value: 'contacts',
                ),
                PopupMenuItem(
                  child: Text('Refresh'),
                  value: 'refresh',
                ),
                PopupMenuItem(
                  child: Text('Help'),
                  value: 'help',
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
          itemCount: _contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0)
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CreateGroup();
                  }));
                },
                child: primaryCard(
                  "new group",
                  Icons.group,
                ),
              );
            if (index == 1)
              return primaryCard(
                "new contact",
                Icons.person_add,
              );

            return ContactTile(contacts: _contacts[index - 2]);
          },
        ));
  }

  Widget primaryCard(String name, IconData icon) {
    return ListTile(
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
    );
  }
}
