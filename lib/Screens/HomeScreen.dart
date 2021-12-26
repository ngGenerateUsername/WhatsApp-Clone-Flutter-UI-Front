// ignore_for_file: file_names, prefer_const_constructors

// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:front/pages/ChatPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  // ignore: prefer_final_fields
  List<PopupMenuEntry<String>> _widgetList = [
    PopupMenuItem(
      child: Text('New group'),
      value: '0',
    ),
    PopupMenuItem(
      child: Text('New broadcast'),
      value: '1',
    ),
    PopupMenuItem(
      child: Text('WhatsApp Web'),
      value: '2',
    ),
    PopupMenuItem(
      child: Text('Starred messages'),
      value: '3',
    ),
    PopupMenuItem(
      child: Text('Settings'),
      value: '4',
    ),
  ];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp Clone"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) => _widgetList,
          ),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
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
          Text(
            'Camera',
          ),
          ChatPage(),
          Text('status tab'),
          Text('Calls tab')
        ],
      ),
    );
  }
}
