// ignore_for_file: unused_import, file_names, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  final String path;
  const CameraView({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.title,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                size: 27,
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 8,
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  minLines: 1,
                  maxLines: 6,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption...",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: CircleAvatar(
                        radius: 27,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 27,
                        ),
                        backgroundColor: Colors.tealAccent[700],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
