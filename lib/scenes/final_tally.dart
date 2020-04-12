// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/player.dart';
import 'package:trashpandas/models/trash_panda_data.dart';

// Scenes
import 'package:trashpandas/scenes/player_count.dart';

class FinalTallyScene extends StatelessWidget {
  static const routeName = '/final';
  
  List<Text> printPlacementOrder(TrashPandaData trashPandaData) {
    List<Text> playerPlacement = [];
    int iterator = 1;
    for(Player player in trashPandaData.getPlayerPlacement()) {
      Text playerText = Text('${iterator.toString()}. ${player.name} (${player.score})');
      playerPlacement.add(playerText);
      iterator++;
    }
    
    return playerPlacement;
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: printPlacementOrder(trashPandaData),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Builder(
              builder: (context) => FlatButton(
                color: Theme.of(context).bottomAppBarTheme.color,
                child: Text('New Game'),
                onPressed: () {
                  // TODO: Maybe add alert to confirm new game.

                  // Restart the stats
                  trashPandaData = new TrashPandaData();

                  Navigator.pushNamed(
                    context,
                    PlayerCountScene.routeName
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
