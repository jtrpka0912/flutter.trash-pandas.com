// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/player.dart';
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/enums.dart';

// Scenes
import 'package:trashpandas/scenes/player_count.dart';

class FinalTallyScene extends StatelessWidget {
  static const routeName = '/final';
  
  List<Text> printPlacementOrder(TrashPandaData trashPandaData) {
    List<Text> textWidgets = [];
    int iterator = 1;
    for(Player player in trashPandaData.getFinalPlayerTallyPlacement()) {
      Text playerText = Text('${iterator.toString()}. ${player.name} (${player.score})');
      textWidgets.add(playerText);
      textWidgets.add(Text('================'));

      for(CardNames card in CardNames.values) {
        Text scoreText = Text('${card.toString()}: ${player.getCardScore(card).toString()} from ${player.getCardCount(card).toString()} cards');
        textWidgets.add(scoreText);
      }

      iterator++;
    }
    
    return textWidgets;
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
                  trashPandaData.resetTrashPandas();

                  // Do not go back to the final tally screen
                  Navigator.pushReplacementNamed(
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
