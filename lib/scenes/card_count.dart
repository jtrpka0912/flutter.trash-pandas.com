// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Commons
import 'package:trashpandas/commons/card_count_field.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';
import 'package:trashpandas/models/enums.dart';

class CardCountScene extends StatelessWidget {
  static const routeName = '/cards';

  final _cardCountKey = GlobalKey<FormState>();

  String nextOrFinal(int playerIndex, int playerCount) {
    return morePlayersAhead(playerIndex, playerCount) ? 'Next' : 'Final Tally';
  }
  
  bool morePlayersAhead(int playerIndex, int playerCount) {
    return playerIndex + 1 < playerCount;
  }

  List<CardCountField> constructCardCountFields(
      TrashPandaData trashPandaData,
      int playerIndex) {
    List<CardCountField> fields = [];

    // Loop through all of the card names
    for(CardNames cardName in CardNames.values) {
      CardCountField field = CardCountField(
        playerIndex: playerIndex,
        cardName: cardName
      );
      fields.add(field);
    }

    return fields;
  }

  @override
  Widget build(BuildContext context) {
    final int playerIndex = ModalRoute.of(context).settings.arguments;

    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        Player player = trashPandaData.getPlayer(playerIndex);

        return Scaffold(
          // TODO: Make a separate widget for the AppBar
          appBar: AppBar(
            title: Text('Card Count for ${player.name}'),
            centerTitle: true,
          ),
          body: Container(
            child: Form(
              key: _cardCountKey,
              child: ListView(
                children: constructCardCountFields(trashPandaData, playerIndex)
              )
            )
          ),
          bottomNavigationBar: BottomAppBar(
            child: Builder(
              builder: (context) => FlatButton(
                color: Theme.of(context).bottomAppBarTheme.color,
                child: Text(nextOrFinal(playerIndex, trashPandaData.playerCount)),
                onPressed: () {
                  if(_cardCountKey.currentState.validate()) {
                    _cardCountKey.currentState.save();
                    print('I got ${trashPandaData.getPlayer(playerIndex).getCardCount(CardNames.Shiny)} ${CardNames.Shiny} cards.');

                    if(morePlayersAhead(playerIndex, trashPandaData.playerCount)) {
                      // Go to next player
                      Navigator.pushNamed(
                        context,
                        CardCountScene.routeName,
                        arguments: playerIndex + 1
                      );
                    } else {
                      // Else: go to final tally
                      print('Go to final score page');
                    }
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
