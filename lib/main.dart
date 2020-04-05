// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Scenes
import 'package:trashpandas/scenes/player_count.dart';
import 'package:trashpandas/scenes/player_names.dart';

// Model
import 'package:trashpandas/models/trash_panda_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TrashPandaData(),
      child: MaterialApp(
        title: 'Trash Panda Score',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue,
            accentColor: Colors.teal
        ),
        home: PlayerCountScene(),
      ),
    );
  }
}