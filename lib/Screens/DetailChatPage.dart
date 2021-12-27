// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';

class DetailChatPage extends StatefulWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  _DetailChatPageState createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is persenal chat page"),
      ),
    );
  }
}
