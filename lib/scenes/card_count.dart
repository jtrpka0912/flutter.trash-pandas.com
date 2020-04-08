// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';

class CardCountScene extends StatelessWidget {
  static const routeName = '/cards';

  String nextOrFinal(int playerIndex, int playerCount) {
    return morePlayersAhead(playerIndex, playerCount) ? 'Next' : 'Final Tally';
  }
  
  bool morePlayersAhead(int playerIndex, int playerCount) {
    return playerIndex + 1 < playerCount;
  }

  @override
  Widget build(BuildContext context) {
    final int playerIndex = ModalRoute.of(context).settings.arguments;

    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        Player player = trashPandaData.getPlayer(playerIndex);

        return Scaffold(
          appBar: AppBar(
            title: Text('Card Count for ${player.name}'),
            centerTitle: true,
          ),
          body: Container(),
          bottomNavigationBar: BottomAppBar(
            child: Builder(
              builder: (context) => FlatButton(
                color: Theme.of(context).bottomAppBarTheme.color,
                // TODO: Either Next or Final Score depending if
                // playerIndex + 1 equals playerCount
                child: Text(nextOrFinal(playerIndex, trashPandaData.playerCount)),
                onPressed: () {
                  // TODO: Check if playerIndex + 1 is less than playerCount
                  // If less: go to next player

                  if(morePlayersAhead(playerIndex, trashPandaData.playerCount)) {
                    Navigator.pushNamed(
                      context,
                      CardCountScene.routeName,
                      arguments: playerIndex + 1
                    );
                  } else {
                    // Else: go to final tally
                    print('Go to final score page');
                  }
                },
              )
            ),
          ),
        );
      },
    );
  }
}
