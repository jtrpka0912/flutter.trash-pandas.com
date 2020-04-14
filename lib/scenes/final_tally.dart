// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/player.dart';
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/enums.dart';

// Commons
import 'package:trashpandas/commons/other_player_placements.dart';
import 'package:trashpandas/commons/player_placement_icon_button.dart';

// Scenes
import 'package:trashpandas/scenes/player_count.dart';

class FinalTallyScene extends StatelessWidget {
  static const routeName = '/final';
  
  Widget firstPlayerWidget(TrashPandaData trashPandaData) {
    List<Player> players = trashPandaData.getFinalPlayerTallyPlacement();
    Player firstPlacePlayer = players[0];

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 18.0, bottom: 4.5),
          child: Text(
            '${firstPlacePlayer.name}',
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 4.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Won the game with ${firstPlacePlayer.score} points!',
                style: TextStyle(
                  fontSize: 24.0
                )
              ),
              // TODO: Reuse for both first player and other players
              PlayerPlacementIconButton(player: firstPlacePlayer),
            ],
          )
        ),
      ],
    );
  }

  Column otherPlayerWidget(TrashPandaData trashPandaData) {
    List<Player> otherPlayers = List.of(trashPandaData.getFinalPlayerTallyPlacement());
    otherPlayers.removeAt(0); // Remove the first player

    List<OtherPlayerPlacement> otherPlayerPlacementWidgets = [];

    int iterator = 2;
    for(Player player in otherPlayers) {
      String placementText = 'Nonth';
      switch(iterator) {
        case 2:
          placementText = '2nd';
          break;
        case 3:
          placementText = '3rd';
          break;
        case 4:
          placementText = '4th';
          break;
      }

      otherPlayerPlacementWidgets.add(
        OtherPlayerPlacement(
          player: player,
          placementText: placementText,
        )
      );

      iterator++;
    }

    return Column(
      children: otherPlayerPlacementWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Final Tally'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              firstPlayerWidget(trashPandaData),
              SizedBox(height: 36.0),
              otherPlayerWidget(trashPandaData)
            ]
          ),
          bottomSheet: BottomSheet(
            builder: (BuildContext context) {
              return Column();
            },
          ),
          bottomNavigationBar: BottomAppBar(
            child: Builder(
              builder: (context) => FlatButton(
                color: Theme.of(context).bottomAppBarTheme.color,
                child: Text('New Game'),
                onPressed: () {
                  showDialog(
                    context: context,
                    // Will need to bring up the iOS version
                    builder: (_) => AlertDialog(
                      title: Text('Start a new game...'),
                      content: Text('Do you want to start a new game?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor
                            ),
                          ),
                          onPressed: () {
                            // Restart the stats
                            trashPandaData.resetTrashPandas();

                            // Do not allow to go back to the final tally screen
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              PlayerCountScene.routeName,
                              (Route<dynamic> route) => false
                            );
                          },
                        ),
                        FlatButton(
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Theme.of(context).accentColor
                            )
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                      elevation: 5.0,
                    ),
                    barrierDismissible: true,
                  );
                },
              ),
            )
          ),
        );
      }
    );
  }
}
