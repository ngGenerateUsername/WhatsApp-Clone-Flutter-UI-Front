// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTileChat extends StatelessWidget {
  const CustomTileChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('tap tap'),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                "assets/svg/groups.svg",
                color: Colors.white,
                height: 36,
                width: 36,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            trailing: Text('18:04'),
            title: Text(
              'Ahmed BH',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Hi ahmed!",
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
