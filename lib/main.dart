// Packages
import 'package:flutter/material.dart';

// Scenes
import './scenes/player_count.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash Panda Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayerCountPage(),
    );
  }
}

