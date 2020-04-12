// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Scenes
import 'package:trashpandas/scenes/player_count.dart';
import 'package:trashpandas/scenes/player_names.dart';
import 'package:trashpandas/scenes/card_count.dart';
import 'package:trashpandas/scenes/final_tally.dart';

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
        themeMode: ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: boxArtFenceColor,
          accentColor: boxArtSkyColor,
          scaffoldBackgroundColor: Colors.white,
          errorColor: boxArtFenceColor,
          appBarTheme: AppBarTheme(
            color: boxArtSkyColor
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: boxArtSkyColor
          ),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary
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
          errorColor: boxArtFenceColor,
          appBarTheme: AppBarTheme(
            color: boxArtFenceColor
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: boxArtFenceColor
          ),
          buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary
          ),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: boxArtFenceColor,
            contentTextStyle: TextStyle(
              color: Colors.white
            )
          )
        ),
        initialRoute: PlayerCountScene.routeName,
        routes: {
          PlayerCountScene.routeName: (context) => PlayerCountScene(),
          PlayerNamesScene.routeName: (context) => PlayerNamesScene(),
          CardCountScene.routeName: (context) => CardCountScene(),
          FinalTallyScene.routeName: (context) => FinalTallyScene()
        }
      ),
    );
  }
}