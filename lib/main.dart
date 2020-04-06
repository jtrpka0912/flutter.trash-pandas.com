// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Scenes
import 'package:trashpandas/scenes/player_count.dart';

// Model
import 'package:trashpandas/models/trash_panda_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color boxArtFenceColor = Color(0xffac2d5a);
    final Color boxArtSkyColor = Color(0xff00a8bd);

    return ChangeNotifierProvider(
      create: (BuildContext context) => TrashPandaData(),
      child: MaterialApp(
        title: 'Trash Panda Score',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: boxArtFenceColor,
          accentColor: boxArtSkyColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: boxArtSkyColor
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: boxArtSkyColor
          ),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: boxArtFenceColor,
            contentTextStyle: TextStyle(
              color: Colors.white
            )
          )
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: boxArtFenceColor,
          accentColor: boxArtSkyColor,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: boxArtFenceColor
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: boxArtFenceColor
          ),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: boxArtFenceColor,
            contentTextStyle: TextStyle(
              color: Colors.white
            )
          )
        ),
        home: PlayerCountScene(),
      ),
    );
  }
}