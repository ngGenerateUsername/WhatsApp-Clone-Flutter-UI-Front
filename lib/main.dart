// ignore_for_file: prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:front/Screens/CameraScreen.dart';
import 'Screens/HomeScreen.dart';

// void main() => runApp(MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
        textTheme: ThemeData.light().textTheme.apply(fontFamily: 'OpenSans'),
        colorScheme: theme.colorScheme.copyWith(
          primary: Color(0xFF075E54),
          secondary: Color(0xFF128C7E),
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


//the old deprecated
// ThemeData(
//         primaryColor: Color(0xFF075E54), /* accentColor: Color(0xFF128C7E) */
//       ),

//the new migration 
// final ThemeData theme = ThemeData();
//     return MaterialApp(
//       theme: theme.copyWith(
//           colorScheme: theme.colorScheme.copyWith(
//               primary: Color(0xFF075E54), secondary: Color(0xFF128C7E))),
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );