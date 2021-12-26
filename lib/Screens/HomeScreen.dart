// ignore_for_file: file_names, prefer_const_constructors

// ignore: unused_import
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp Clone"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
        bottom: TabBar(
          controller: _controller,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(
              text: "CHATS",
            ),
            Tab(text: "STATUS"),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text('Camera'),
          Text('Chat tab'),
          Text('status tab'),
          Text('Calls tab')
        ],
      ),
    );
  }
}
