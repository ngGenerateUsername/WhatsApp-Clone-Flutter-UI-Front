// ignore_for_file: unused_import, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/Models/ChatModel.dart';

class ContactTile extends StatelessWidget {
  final ChatModel contacts;
  const ContactTile({Key? key, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('stop tapping'),
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          child: SvgPicture.asset(
            "assets/svg/person.svg",
            color: Colors.white,
            height: 30,
            width: 30,
          ),
          backgroundColor: Colors.blueGrey[200],
        ),
        title: Text(
          contacts.name.toString(),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          contacts.status.toString(),
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
