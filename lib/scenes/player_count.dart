// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';

// Commons
import 'package:trashpandas/commons/player_count_button.dart';

// Scenes
import 'package:trashpandas/scenes/player_names.dart';

class PlayerCountScene extends StatefulWidget {
  @override
  _PlayerCountSceneState createState() => _PlayerCountSceneState();
}

class _PlayerCountSceneState extends State<PlayerCountScene> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
        builder: (context, trashPandaData, child) {
          final Color primaryColor = Theme.of(context).primaryColor;
          final Color accentColor = Theme.of(context).accentColor;

          Color playerTwoButtonColor = trashPandaData.playerCount == 2 ? accentColor : primaryColor;
          Color playerThreeButtonColor = trashPandaData.playerCount == 3 ? accentColor : primaryColor;
          Color playerFourButtonColor = trashPandaData.playerCount == 4 ? accentColor : primaryColor;

          return Scaffold(
            appBar: AppBar(
              title: Text('Player Count'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Text(
                  'How Many Players',
                  // TODO: Put into a separate style file or something.
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                    height: 27.0
                ),
                Row(
                  children: <Widget>[
                    PlayerCountButton(numberOfPlayers: 2, buttonColor: playerTwoButtonColor),
                    PlayerCountButton(numberOfPlayers: 3, buttonColor: playerThreeButtonColor),
                    PlayerCountButton(numberOfPlayers: 4, buttonColor: playerFourButtonColor)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            // TODO: Figure out how to make this more DRY with other pages
            bottomNavigationBar: BottomAppBar(
                child: Builder(
                    builder: (context) => FlatButton(
                      color: Theme.of(context).bottomAppBarTheme.color,
                      child: Text('Next'),
                      onPressed: () {
                        // This will go to Player Name screen
                        print('No. of players: ${trashPandaData.playerCount}');
                        if(trashPandaData.playerCount > 1 && trashPandaData.playerCount < 5) {
                          // Do navigation
                          print('Go to next scene');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayerNamesScene()
                              )
                          );
                        } else {
                          // Show error message
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select the number of players that are playing.'),
                            ),
                          );
                        }
                      },
                    )
                )
            ),
          );
        }
    );
  }
}