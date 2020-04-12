// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 36.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: trashPandaData
                        .getPlayer(playerIndex)
                        .getCardCount(CardNames.Shiny)
                        .toString(),
                      validator: (String numberOfCardsString) {
                        final int numberOfCards = int.tryParse(numberOfCardsString) ?? 0;

                        if(numberOfCards < 0) {
                          return 'You can not have negative cards!';
                        }

                        CardNames cardName = CardNames.Shiny;
                        switch(cardName) {
                          case CardNames.Shiny:
                            if(numberOfCards > 3) {
                              return 'You can not have more than three Shiny cards.';
                            }
                            break;
                          case CardNames.YumYum:
                            if(numberOfCards > 5) {
                              return 'You can not have more than five Yum Yum cards.';
                            }
                            break;
                          case CardNames.Feesh:
                            if(numberOfCards > 7) {
                              return 'You can not have more than seven Feesh cards.';
                            }
                            break;
                          case CardNames.MmmPie:
                            if(numberOfCards > 9) {
                              return 'You can not have more than nine Mmm Pie cards.';
                            }
                            break;
                          case CardNames.Nanners:
                            if(numberOfCards > 11) {
                              return 'You can not have more than eleven Nanner cards.';
                            }
                            break;
                          case CardNames.Blammo:
                            if(numberOfCards > 13) {
                              return 'You can not have more than thirteen Blammo cards.';
                            }
                            break;
                        }

                        return null;
                      },
                      onChanged: (String numberOfCardsString) {
                        final int numberOfCards = int.tryParse(numberOfCardsString) ?? 0;
                        trashPandaData
                          .getPlayer(playerIndex)
                          .setCardCount(CardNames.Shiny, numberOfCards);
                      },
                    )
                  )
                ]
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
